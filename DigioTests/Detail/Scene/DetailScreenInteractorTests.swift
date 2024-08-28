//
//  DetailScreenInteractorTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest
@testable import Digio

final class DetailScreenInteractorTests: XCTestCase {
    func test_getDetails_whenSuccess_shouldPresentDetailsResponse() {
        let (sut, presenter) = makeSUT()

        sut.loadDetails(with: .init())

        let response: DetailScreenScenarios.Detail.Response = .fixture()

        XCTAssertEqual(presenter.invokedPresentDetailCount, 1)
        XCTAssertNotNil(presenter.invokedPresentDetailParameter)
        XCTAssertEqual(presenter.invokedPresentDetailParameter!, response)
    }

    // MARK: - Helpers
    private func makeSUT(
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (
        sut: DetailBusinessLogic,
        presenter: DetailPresentationLogicSpy
    ) {
        let presenter = DetailPresentationLogicSpy()

        let sut = DetailScreenInteractor(
            presenter: presenter,
            data: .fixture()
        )

        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(presenter, file: file, line: line)

        return (sut, presenter)
    }
}
