//
//  DashboardPresentationLogicSpy.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio

final class DashboardPresentationLogicSpy: DashboardPresentationLogic {
    private(set) var invokedPresentDashboardProductsCount = 0
    private(set) var invokedPresentDashboardProductsParameter: DashboardScenarios.Products.Response?

    func presentDashboardProducts(with response: DashboardScenarios.Products.Response) {
        invokedPresentDashboardProductsCount += 1
        invokedPresentDashboardProductsParameter = response
    }

    private(set) var invokedPresentDetailCount = 0
    private(set) var invokedPresentDetailParameter: DashboardScenarios.Detail.Response?

    func presentDetail(with response: DashboardScenarios.Detail.Response) {
        invokedPresentDetailCount += 1
        invokedPresentDetailParameter = response
    }
}
