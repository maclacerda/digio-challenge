//
//  DetailScreenViewControllerTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest
@testable import Digio

final class DetailScreenViewControllerTests: XCTestCase {
    func test_loadView_shouldSetView() {
        let (sut, _) = makeSUT()

        sut.loadViewIfNeeded()

        XCTAssertNotNil(sut.view)
    }

    func test_getProductsData_whenSuccess_shouldSetupView() {
        let (sut, _) = makeSUT()

        let viewModel: DetailScreenScenarios.Detail.ViewModel = .fixture()
        sut.displayDetail(with: .fixture())

        XCTAssertNotNil(sut.customView.viewData)
        XCTAssertEqual(sut.customView.viewData!, viewModel)
    }

    // MARK: - Helpers
    private func makeSUT(
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (
        sut: DetailScreenViewController,
        interactor: DetailBusinessLogicSpy
    ) {
        let interactor = DetailBusinessLogicSpy()
        let sut = DetailScreenViewController(interactor: interactor)

        if #available(iOS 13.0, *) {
            trackForMemoryLeaks(interactor, file: file, line: line)
            trackForMemoryLeaks(sut, file: file, line: line)
        }

        return (sut, interactor)
    }
}
