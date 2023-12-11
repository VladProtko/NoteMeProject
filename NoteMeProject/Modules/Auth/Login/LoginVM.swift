//
//  LoginVM.swift
//  NoteMeProject
//
//  Created by Sergeenko on 08/12/2023.
//

import UIKit

protocol LoginInputValidatorUseCase {
    func validate(email: String?) -> Bool
    func validate(password: String?) -> Bool
}

protocol LoginAuthServiceUseCase {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void)
}

final class LoginVM: LoginViewModelProtocol {
    
    var catchEmailError: ((String?) -> Void)?
    var catchPasswordError: ((String?) -> Void)?
    
    private let authService: LoginAuthServiceUseCase
    private let inputValidator: LoginInputValidatorUseCase
    
    init(authService: LoginAuthServiceUseCase,
         inputValidator: LoginInputValidatorUseCase) {
        self.authService = authService
        self.inputValidator = inputValidator
    }
    
    func loginDidTap(email: String?, password: String?) {
        guard 
            checkValidation(email: email, password: password),
            let email, let password
        else { return }
        authService.login(email: email,
                          password: password) { isSuccess in
            print(isSuccess)
        }
    }
    
    func newAccountDidTap() {
        print("\(#function)")
    }
    
    func forgotPasswordDidTap(email: String?) { }
    
    private func checkValidation(email: String?, password: String?) -> Bool {
        let isEmailValid = inputValidator.validate(email: email)
        let isPasswordValid = inputValidator.validate(password: password)
        
        catchEmailError?(isEmailValid ? nil : "Wrong e-mail")
        catchPasswordError?(isPasswordValid ? nil : "Non-valid password")
        
        return isEmailValid && isPasswordValid
    }
}
