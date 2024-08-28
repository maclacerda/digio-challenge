//
//  DashboardDisplaySpy.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio

final class DashboardDisplaySpy: DashboardDisplayLogic {
    private(set) var invokedDisplayDashboardProductsCount = 0
    private(set) var invokedDisplayDashboardProductsParameter: DashboardScenarios.Products.ViewModel?

    func displayDashboardProducts(with viewModel: DashboardScenarios.Products.ViewModel) {
        invokedDisplayDashboardProductsCount += 1
        invokedDisplayDashboardProductsParameter = viewModel
    }

    private(set) var invokedDisplayDetailCount = 0
    private(set) var invokedDisplayDetailParameter: DashboardScenarios.Detail.ViewModel?

    func displayDetail(with viewModel: DashboardScenarios.Detail.ViewModel) {
        invokedDisplayDetailCount += 1
        invokedDisplayDetailParameter = viewModel
    }
}
