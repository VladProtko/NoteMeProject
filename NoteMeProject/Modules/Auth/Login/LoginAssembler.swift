//
//  LoginAssembler.swift
//  NoteMeProject
//
//  Created by Sergeenko on 08/12/2023.
//

import UIKit

final class LoginAssembler {
    
    private init() {}
    
    static func make() -> UIViewController {
        let vm = LoginVM(authService: TESTAuthService(), 
                         inputValidator: InputValidator())
        
        return LoginVC(viewModel: vm)
    }    
}

private class TESTAuthService: LoginAuthServiceUseCase {
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
    
    
}
