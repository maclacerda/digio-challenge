//
//  DashboardPresenter.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

protocol DashboardPresentationLogic {
    func presentDashboardProducts(with response: DashboardScenarios.Products.Response)
    func presentDetail(with response: DashboardScenarios.Detail.Response)
}

final class DashboardPresenter {
    // MARK: - Properties
    weak var view: DashboardDisplayLogic?

    // MARK: - Initializer
    init() {}
}

// MARK: - DashboardPresentationLogic
extension DashboardPresenter: DashboardPresentationLogic {
    func presentDashboardProducts(with response: DashboardScenarios.Products.Response) {
        switch response {
        case .succes(let response):
            let viewModel = makeDashboardViewModel(with: response)

            view?.displayDashboardProducts(with: .success(viewModel: viewModel))

        case .failure(let error):
            view?.displayDashboardProducts(
                with: .failure(
                    viewModel: .init(
                        message: error.localizedDescription
                    )
                )
            )
        }
    }

    func presentDetail(with response: DashboardScenarios.Detail.Response) {
        view?.displayDetail(with: .init(data: response.data))
    }
}

// MARK: - Private methods
private extension DashboardPresenter {
    func makeDashboardViewModel(with response: DashboardResponse) -> DashboardViewModel {
        .init(
            spotlight: makeSpotlight(with: response.spotlight),
            products: makeProducts(with: response.products),
            cash: makeCash(with: response.cash)
        )
    }

    func makeSpotlight(with spotlight: [DashboardSpotlight]) -> [DashboardSpotlightViewModel] {
        spotlight.map {
            .init(
                name: $0.name,
                bannerURL: $0.bannerURL,
                description: $0.description
            )
        }
    }

    func makeProducts(with products: [DashboardProducts]) -> [DashboardProductsViewModel] {
        products.map {
            .init(
                name: $0.name,
                imageURL: $0.imageURL,
                description: $0.description
            )
        }
    }

    func makeCash(with cash: DashboardCash) -> DashboardCashViewModel {
        .init(
            title: cash.title,
            bannerURL: cash.bannerURL,
            description: cash.description
        )
    }
}
