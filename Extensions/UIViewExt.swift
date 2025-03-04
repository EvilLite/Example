//
//  UIViewExt.swift
//  exampleApp
//
//  Created by Alex Grigol on 01/03/2025.
//
import UIKit
extension UIView {
    func addSubView(_ views: UIView...) {
        for view in views {
            self.addSubView(view)
        }
    }
}
