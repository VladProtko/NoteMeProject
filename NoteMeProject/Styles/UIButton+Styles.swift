//
//  UIButton+Styles.swift
//  NoteMeProject
//
//  Created by Sergeenko on 06/12/2023.
//

import UIKit

extension UIButton {
    
    static func yellowRoundedButton(_ title: String?) -> UIButton {
        let button = UIButton()
        
        button.backgroundColor = .appYellow
        button.cornerRadius = 5
            
        button.setTitle(title, for: .normal)
        
        button.setTitleColor(.appText, for: .normal)
        button.setTitleColor(.appText.withAlphaComponent(0.75), for: .highlighted)
        
        button.titleLabel?.font = .appBoldFont.withSize(17.0)
        
        return button
    }
}
