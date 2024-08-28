//
//  DashboardScenarios.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

// swiftlint:disable nesting
enum DashboardScenarios {
    enum Products {
        struct Request {}

        enum Response {
            case succes(response: DashboardResponse)
            case failure(error: Error)
        }

        enum ViewModel {
            case success(viewModel: DashboardViewModel)
            case failure(viewModel: DashboardErrorViewModel)
        }
    }

    enum Detail {
        struct Request {
            let spotlight: DashboardSpotlightViewModel?
            let product: DashboardProductsViewModel?

            init(
                spotlight: DashboardSpotlightViewModel? = nil,
                product: DashboardProductsViewModel? = nil
            ) {
                self.spotlight = spotlight
                self.product = product
            }
        }

        struct Response {
            let data: DetailScreenData
        }

        struct ViewModel {
            let data: DetailScreenData
        }
    }
}
