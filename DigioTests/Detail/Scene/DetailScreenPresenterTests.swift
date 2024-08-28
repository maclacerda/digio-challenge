//
//  DetailScreenPresenterTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest
@testable import Digio

final class DetailScreenPresenterTests: XCTestCase {
    let displaySpy = DetailDisplayLogicSpy()

    private lazy var sut: DetailScreenPresenter = {
        let presenter = DetailScreenPresenter()
        presenter.view = displaySpy
        return presenter
    }()

    func test_presentProductsData_givenSuccess_shouldDisplayProductsData() {
        let response: DetailScreenScenarios.Detail.ViewModel = .fixture()
        sut.presentDetails(with: .fixture())

        XCTAssertEqual(displaySpy.invokedDisplayDetailCount, 1)
        XCTAssertNotNil(displaySpy.invokedDisplayDetailParameter)
        XCTAssertEqual(displaySpy.invokedDisplayDetailParameter!, response)
    }
}
