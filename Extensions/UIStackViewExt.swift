//
//  UIStackViewExt.swift
//  exampleApp
//
//  Created by Alex Grigol on 01/03/2025.
//
import UIKit
extension UIStackView {
    
    func addArrangedSubView(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
