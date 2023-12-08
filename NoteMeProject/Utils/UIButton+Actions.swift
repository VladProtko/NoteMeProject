//
//  UIButton+Actions.swift
//  NoteMeProject
//
//  Created by Sergeenko on 08/12/2023.
//

import UIKit

extension UIButton {
    
    @discardableResult
    func withAction(_ target: Any?, _ selector: Selector, for event: UIControl.Event = .touchUpInside) -> UIButton {
        self.addTarget(target, action: selector, for: event)
        return self
    }
    
}
