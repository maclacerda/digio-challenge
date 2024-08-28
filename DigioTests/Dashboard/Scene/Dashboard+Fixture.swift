//
//  Dashboard+Fixture.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio

extension DashboardResponse {
    static func fixture() -> Self {
        .init(
            spotlight: [],
            products: [],
            cash: .fixture()
        )
    }
}

extension DashboardCash {
    static func fixture() -> Self {
        .init(
            title: "",
            bannerURL: "",
            description: ""
        )
    }
}

extension DashboardViewModel: Equatable {
    public static func == (lhs: Digio.DashboardViewModel, rhs: Digio.DashboardViewModel) -> Bool {
        lhs.spotlight == rhs.spotlight && lhs.products == rhs.products && lhs.cash == rhs.cash
    }

    static func fixture() -> Self {
        .init(
            spotlight: [],
            products: [],
            cash: .fixture()
        )
    }
}

extension DashboardCashViewModel: Equatable {
    public static func == (lhs: DashboardCashViewModel, rhs: DashboardCashViewModel) -> Bool {
        lhs.title == rhs.title && lhs.description == rhs.description && lhs.bannerURL == rhs.bannerURL
    }
}

extension DashboardSpotlightViewModel: Equatable {
    public static func == (lhs: DashboardSpotlightViewModel, rhs: DashboardSpotlightViewModel) -> Bool {
        lhs.name == rhs.name && lhs.description == rhs.description && lhs.bannerURL == rhs.bannerURL
    }
}

extension DashboardProductsViewModel: Equatable {
    public static func == (lhs: DashboardProductsViewModel, rhs: DashboardProductsViewModel) -> Bool {
        lhs.name == rhs.name && lhs.description == rhs.description && lhs.imageURL == rhs.imageURL
    }
}

extension DashboardCashViewModel {
    static func fixture() -> Self {
        .init(
            title: "",
            bannerURL: "",
            description: ""
        )
    }
}

extension DashboardScenarios.Products.Response: Equatable {
    public static func == (lhs: DashboardScenarios.Products.Response, rhs: DashboardScenarios.Products.Response) -> Bool {
        true
    }
}

extension DashboardResponse: Equatable {
    public static func == (lhs: DashboardResponse, rhs: DashboardResponse) -> Bool {
        lhs.spotlight == rhs.spotlight && lhs.products == rhs.products && lhs.cash == rhs.cash
    }
}

extension DashboardProducts: Equatable {
    public static func == (lhs: DashboardProducts, rhs: DashboardProducts) -> Bool {
        lhs.name == rhs.name && lhs.description == rhs.description && lhs.imageURL == rhs.imageURL
    }
}

extension DashboardSpotlight: Equatable {
    public static func == (lhs: DashboardSpotlight, rhs: DashboardSpotlight) -> Bool {
        lhs.name == rhs.name && lhs.description == rhs.description && lhs.bannerURL == rhs.bannerURL
    }
}

extension DashboardCash: Equatable {
    public static func == (lhs: DashboardCash, rhs: DashboardCash) -> Bool {
        lhs.title == rhs.title && lhs.description == rhs.description && lhs.bannerURL == rhs.bannerURL
    }
}
