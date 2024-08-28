//
//  CALayer+extensions.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

import QuartzCore
import UIKit

public extension CALayer {
    /**
     @function roundCorners(corners:radius)
     @abstraction Apply the radius in many borders of `UIView`
     @param roundedRect Element to define borders to radius applyied
     @param radius Value to radius
     */
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()

        mask.path = path.cgPath

        self.mask = mask
    }
}
