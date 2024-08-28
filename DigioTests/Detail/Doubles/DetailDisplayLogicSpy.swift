//
//  DetailDisplayLogicSpy.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio

final class DetailDisplayLogicSpy: DetailDisplayLogic {
    private(set) var invokedDisplayDetailCount = 0
    private(set) var invokedDisplayDetailParameter: DetailScreenScenarios.Detail.ViewModel?

    func displayDetail(with viewModel: DetailScreenScenarios.Detail.ViewModel) {
        invokedDisplayDetailCount += 1
        invokedDisplayDetailParameter = viewModel
    }
}
