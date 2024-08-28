//
//  DashboardBusinessLogicSpy.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio

final class DashboardBusinessLogicSpy: DashboardBusinessLogic {
    private(set) var invokedLoadProductsCount = 0
    private(set) var invokedLoadProductsParameter: DashboardScenarios.Products.Request?

    func loadProducts(with request: DashboardScenarios.Products.Request) {
        invokedLoadProductsCount += 1
        invokedLoadProductsParameter =  request
    }

    private(set) var invokedPrepareDetailDataCount = 0
    private(set) var invokedPrepareDetailDataParameter: DashboardScenarios.Detail.Request?

    func prepareDetailData(with request: DashboardScenarios.Detail.Request) {
        invokedPrepareDetailDataCount += 1
        invokedPrepareDetailDataParameter = request
    }
}
