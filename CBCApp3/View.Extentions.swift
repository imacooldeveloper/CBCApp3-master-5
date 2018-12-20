//
//  View.Extentions.swift
//  CBCApp3
//
//  Created by Martin Gallardo on 7/13/18.
//  Copyright © 2018 Martin Gallardo. All rights reserved.
//


import UIKit

extension UIView {
    func anchor(top:NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, right: NSLayoutXAxisAnchor?, topPadding: CGFloat, bottomPadding: CGFloat, leftPadding: CGFloat, rightPadding: CGFloat, width: CGFloat, height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
