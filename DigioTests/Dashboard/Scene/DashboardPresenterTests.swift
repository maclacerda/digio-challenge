//
//  DashboardPresenterTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest
@testable import Digio

final class DashboardPresenterTests: XCTestCase {
    let displaySpy = DashboardDisplaySpy()

    private lazy var sut: DashboardPresenter = {
        let presenter = DashboardPresenter()
        presenter.view = displaySpy
        return presenter
    }()

    func test_presentProductsData_givenSuccess_shouldDisplayProductsData() {
        let response: DashboardResponse = .fixture()
        sut.presentDashboardProducts(with: .succes(response: response))

        XCTAssertEqual(displaySpy.invokedDisplayDashboardProductsCount, 1)

        switch displaySpy.invokedDisplayDashboardProductsParameter {
        case .success(let viewModel):
            XCTAssertTrue(viewModel.products.isEmpty)
            XCTAssertTrue(viewModel.spotlight.isEmpty)
            XCTAssertEqual(viewModel.cash, DashboardCashViewModel.fixture())
        default:
            XCTFail("Expected to be success")
        }
    }

    func test_presentProductsData_givenFailure_shouldDisplayFailure() {
        sut.presentDashboardProducts(with: .failure(error: NSError(domain: "Error", code: -1)))

        switch displaySpy.invokedDisplayDashboardProductsParameter {
        case .failure:
            XCTAssertEqual(displaySpy.invokedDisplayDashboardProductsCount, 1)
        default:
            XCTFail("Expected to be failure")
        }
    }
}
