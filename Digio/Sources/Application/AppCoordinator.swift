//
//  AppCoordinator.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 08/26/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []

    private let window: UIWindow
    private var rootViewController: BaseNavigationViewController

    // MARK: - Initializer
    init(window: UIWindow) {
        self.window = window

        rootViewController = BaseNavigationViewController()
        rootViewController.navigationBar.tintColor = .black

        self.window.rootViewController = rootViewController
    }

    // MARK: - Flows
    func start() {
        showDashboard()
        window.makeKeyAndVisible()
    }

    // MARK: - Private methods

    private func showDashboard() {
        let dashboardCoordinator = DashboardCoordinator(
            rootViewController: rootViewController
        )

        dashboardCoordinator.start()
        childCoordinators.append(dashboardCoordinator)
    }
}
