//
//  LoginVM.swift
//  NoteMeProject
//
//  Created by Sergeenko on 08/12/2023.
//

import UIKit

protocol LoginAuthServiceUseCase {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void)
}

final class LoginVM: LoginViewModelProtocol {
    
    private let authService: LoginAuthServiceUseCase
    
    init(authService: LoginAuthServiceUseCase) {
        self.authService = authService
    }
    
    func loginDidTap(email: String?, password: String?) {
        guard let email, let password else { return }
        
        authService.login(email: email,
                          password: password) { isSuccess in
            print(isSuccess)
        }
    }
    
    func newAccountDidTap() { }
    
    func forgotPasswordDidTap(email: String?) { }
}
