//
//  DetailPresentationLogicSpy.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio

final class DetailPresentationLogicSpy: DetailPresentationLogic {
    private(set) var invokedPresentDetailCount = 0
    private(set) var invokedPresentDetailParameter: DetailScreenScenarios.Detail.Response?

    func presentDetails(with response: DetailScreenScenarios.Detail.Response) {
        invokedPresentDetailCount += 1
        invokedPresentDetailParameter = response
    }
}
