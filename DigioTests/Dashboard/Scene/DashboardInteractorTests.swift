//
//  DashboardInteractorTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest
@testable import Digio

final class DashboardInteractorTests: XCTestCase {
    func test_getProductsData_whenSuccess_shouldPresentProductsResponse() {
        let (sut, presenter, repository) = makeSUT()

        sut.loadProducts(with: .init())

        XCTAssertEqual(repository.requestsCount, 1)

        let response: DashboardResponse = .fixture()

        XCTAssertEqual(presenter.invokedPresentDashboardProductsCount, 1)
        XCTAssertNotNil(presenter.invokedPresentDashboardProductsParameter)
        XCTAssertEqual(presenter.invokedPresentDashboardProductsParameter!, .succes(response: response))
    }

    // MARK: - Helpers
    private func makeSUT(
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (
        sut: DashboardBusinessLogic,
        presenter: DashboardPresentationLogicSpy,
        repository: DashboardRepositorySpy
    ) {
        let presenter = DashboardPresentationLogicSpy()
        let repository = DashboardRepositorySpy()

        let sut = DashboardInteractor(
            presenter: presenter,
            repository: repository
        )

        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(presenter, file: file, line: line)
        trackForMemoryLeaks(repository, file: file, line: line)

        return (sut, presenter, repository)
    }
}
