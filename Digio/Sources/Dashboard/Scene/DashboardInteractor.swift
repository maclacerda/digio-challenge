//
//  DashboardInteractor.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

protocol DashboardBusinessLogic {
    func loadProducts(with request: DashboardScenarios.Products.Request)
    func prepareDetailData(with request: DashboardScenarios.Detail.Request)
}

final class DashboardInteractor {
    // MARK: - Properties
    private let presenter: DashboardPresentationLogic
    private let repository: DashboardRepositoryProtocol

    // MARK: - Initializer
    init(
        presenter: DashboardPresentationLogic,
        repository: DashboardRepositoryProtocol
    ) {
        self.presenter = presenter
        self.repository = repository
    }
}

// MARK: - DashboardBusinessLogic
extension DashboardInteractor: DashboardBusinessLogic {
    func loadProducts(with request: DashboardScenarios.Products.Request) {
        repository.getProducts { [weak self] result in
            switch result {
            case .success(let model):
                self?.presenter.presentDashboardProducts(with: .succes(response: model))
            case .failure(let error):
                self?.presenter.presentDashboardProducts(with: .failure(error: error))
            }
        }
    }

    func prepareDetailData(with request: DashboardScenarios.Detail.Request) {
        if let spotlight = request.spotlight {
            presenter.presentDetail(
                with: .init(
                    data: .init(
                        sourceType: .spotlights,
                        model: .init(
                            name: spotlight.name,
                            description: spotlight.description,
                            imageURL: spotlight.bannerURL
                        )
                    )
                )
            )
        } else if let product = request.product {
            presenter.presentDetail(
                with: .init(
                    data: .init(
                        sourceType: .products,
                        model: .init(
                            name: product.name,
                            description: product.description,
                            imageURL: product.imageURL
                        )
                    )
                )
            )
        }
    }
}
