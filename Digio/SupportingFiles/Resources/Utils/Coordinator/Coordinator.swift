//
//  Coordinator.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 08/26/24.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()
    var childCoordinators: [Coordinator] { get set }
}
