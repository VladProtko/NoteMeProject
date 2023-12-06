//
//  View+Layer.swift
//  NoteMeProject
//
//  Created by Sergeenko on 06/12/2023.
//

import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get { layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    func seBoreder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
}
