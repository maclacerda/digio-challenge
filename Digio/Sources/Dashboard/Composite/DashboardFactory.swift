//
//  DashboardFactory.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import UIKit

enum DashboardFactory {
    // MARK: - Public methods
    static func make(with delegate: DashboardViewControllerDelegate?) -> UIViewController {
        let network = Network.shared

        let dashboardRepository = DashboardRepository(
            network: network
        )

        let presenter = DashboardPresenter()

        let interactor = DashboardInteractor(
            presenter: presenter,
            repository: dashboardRepository
        )

        let viewController = DashboardViewController(
            interactor: interactor
        )

        presenter.view = viewController
        viewController.delegate = delegate

        return viewController
    }
}
