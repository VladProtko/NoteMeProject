//
//  TitleLabel+Styles.swift
//  NoteMeProject
//
//  Created by Sergeenko on 11/12/2023.
//

import UIKit

extension UILabel {
    static func titleLabel(_ title: String) -> UILabel {
        let label = UILabel()
        
        label.backgroundColor = .clear
        label.textColor = .appText
        label.textAlignment = .center
        label.text = title
        label.font = .appBoldFont.withSize(25.0)
        
        return label
    }
}
