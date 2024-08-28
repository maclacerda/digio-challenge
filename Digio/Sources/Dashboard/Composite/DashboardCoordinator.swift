//
//  DashboardCoordinator.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import UIKit

final class DashboardCoordinator: Coordinator {
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []

    private let rootViewController: UINavigationController?

    // MARK: - Initializer
    init(
        rootViewController: UINavigationController
    ) {
        self.rootViewController = rootViewController
    }

    func start() {
        let viewController = DashboardFactory.make(with: self)

        rootViewController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - DashboardViewControllerDelegate
extension DashboardCoordinator: DashboardViewControllerDelegate {
    func goToDetail(with data: DetailScreenData) {
        guard let rootViewController else { return }

        let coordinator = DetailScreenCoordinator(
            rootViewController: rootViewController,
            data: data
        )

        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
