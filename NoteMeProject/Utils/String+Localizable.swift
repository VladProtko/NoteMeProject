//
//  String+Localizable.swift
//  NoteMeProject
//
//  Created by Sergeenko on 08/12/2023.
//

import UIKit

extension String {
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "", comment: "")
    }
}
