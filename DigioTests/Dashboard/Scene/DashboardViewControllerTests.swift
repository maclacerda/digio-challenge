//
//  DashboardViewControllerTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest
@testable import Digio

final class DashboardViewControllerTests: XCTestCase {
    func test_loadView_shouldSetView() {
        let (sut, _) = makeSUT()

        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.view)
        XCTAssertNotNil(sut.customView.delegate)
    }

    func test_getProductsData_whenSuccess_shouldSetupView() {
        let (sut, _) = makeSUT()

        let viewModel: DashboardViewModel = .fixture()
        sut.displayDashboardProducts(with: .success(viewModel: viewModel))

        XCTAssertEqual(sut.customView.state, .loaded)
        XCTAssertNotNil(sut.customView.viewData)
        XCTAssertEqual(sut.customView.viewData!, viewModel)
    }

    // MARK: - Helpers
    private func makeSUT(
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (
        sut: DashboardViewController,
        interactor: DashboardBusinessLogicSpy
    ) {
        let interactor = DashboardBusinessLogicSpy()
        let sut = DashboardViewController(interactor: interactor)

        if #available(iOS 13.0, *) {
            trackForMemoryLeaks(interactor, file: file, line: line)
            trackForMemoryLeaks(sut, file: file, line: line)
        }

        return (sut, interactor)
    }
}
