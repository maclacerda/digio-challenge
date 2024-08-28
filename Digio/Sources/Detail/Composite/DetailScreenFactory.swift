//
//  DetailScreenFactory.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import UIKit

enum DetailScreenFactory {
    // MARK: - Public methods
    static func make(with data: DetailScreenData) -> UIViewController {
        let presenter = DetailScreenPresenter()

        let interactor = DetailScreenInteractor(
            presenter: presenter,
            data: data
        )

        let viewController = DetailScreenViewController(
            interactor: interactor
        )

        presenter.view = viewController

        return viewController
    }
}
