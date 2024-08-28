//
//  BaseNavigationViewController.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 08/26/24.
//

import UIKit

class BaseNavigationViewController: UINavigationController {
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    var statusBarHidden = false {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    var showNavigationBar = true {
        didSet {
            isNavigationBarHidden = !showNavigationBar
        }
    }

    override var prefersStatusBarHidden: Bool { return statusBarHidden }
    override var preferredStatusBarStyle: UIStatusBarStyle { return statusBarStyle }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation { return .fade }
}
