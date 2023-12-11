//
//  RegisterPresenter.swift
//  NoteMeProject
//
//  Created by Sergeenko on 11/12/2023.
//

import UIKit

protocol RegisterPresenterDelegate: AnyObject {
    
}


final class RegisterPresenter: RegisterPresenterProtocol {
    
    func registerDidTap(email: String?, password: String?, repeatPassword: String?) {
        
    }
    
    func haveAccountDidTap() { }
}
