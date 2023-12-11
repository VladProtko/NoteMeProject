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
    
    var catchEmailError: ((String) -> Void)?
    var catchPasswordError: ((String) -> Void)?
    
    private let authService: LoginAuthServiceUseCase
    private let inputValidator: LoginInputValidatorUseCase
    
    init(authService: LoginAuthServiceUseCase,
         inputValidator: LoginInputValidatorUseCase) {
        self.authService = authService
        self.inputValidator = inputValidator
    }
    
    func loginDidTap(email: String?, password: String?) {
        guard inputValidator.validate(email: email) else { catchEmailError?("Wrong e-mail"); return }
        guard inputValidator.validate(password: password) else { catchPasswordError?("Non-valid password"); return }
        
        guard let email, let password else { return }
        authService.login(email: email,
                          password: password) { isSuccess in
            print(isSuccess)
        }
    }
    
    func newAccountDidTap() { }
    
    func forgotPasswordDidTap(email: String?) { }
}
