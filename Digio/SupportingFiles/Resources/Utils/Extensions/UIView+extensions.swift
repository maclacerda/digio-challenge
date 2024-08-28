//
//  UIView+extensions.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

import Foundation
import UIKit

public extension UIView {
    /**
     @function roundCorners(corners:radius)
     @abstraction Apply the radius in many borders of `UIView`
     @param roundedRect Element to define borders to radius applyied
     @param radius Value to radius
     */
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        layer.roundCorners(corners, radius: radius)
    }
}
