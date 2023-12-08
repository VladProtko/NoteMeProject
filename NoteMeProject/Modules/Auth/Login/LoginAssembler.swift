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
        let vm = LoginVM()
        
        return LoginVC(viewModel: vm)
    }    
}
