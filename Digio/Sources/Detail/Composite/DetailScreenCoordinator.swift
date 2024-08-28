//
//  DetailScreenCoordinator.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import UIKit

final class DetailScreenCoordinator: Coordinator {
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []

    private let rootViewController: UINavigationController?
    private let data: DetailScreenData

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController,
        data: DetailScreenData
    ) {
        self.rootViewController = rootViewController
        self.data = data
    }

    func start() {
        let viewController = DetailScreenFactory.make(with: data)

        rootViewController?.pushViewController(viewController, animated: true)
    }
}
