//
//  DetailBusinessLogicSpy.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio

final class DetailBusinessLogicSpy: DetailBusinessLogic {
    private(set) var invokedLoadDetailsCount = 0
    private(set) var invokedLoadDetailsParameter: DetailScreenScenarios.Detail.Request?

    func loadDetails(with request: DetailScreenScenarios.Detail.Request) {
        invokedLoadDetailsCount += 1
        invokedLoadDetailsParameter = request
    }
}
