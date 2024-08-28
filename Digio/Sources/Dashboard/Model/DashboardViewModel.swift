//
//  DashboardViewModel.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

struct DashboardViewModel {
    let spotlight: [DashboardSpotlightViewModel]
    let products: [DashboardProductsViewModel]
    let cash: DashboardCashViewModel
}

struct DashboardSpotlightViewModel {
    let name: String
    let bannerURL: String
    let description: String
}

struct DashboardProductsViewModel {
    let name: String
    let imageURL: String
    let description: String
}

struct DashboardCashViewModel {
    let title: String
    let bannerURL: String
    let description: String
}

struct DashboardErrorViewModel {
    let message: String
}
