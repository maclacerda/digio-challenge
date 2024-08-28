//
//  DashboardRepositoryTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest
@testable import Digio

final class DashboardRepositoryTests: XCTestCase {
    func test_execute_requestProductsData() {
        let (sut, network) = makeSUT()

        sut.getProducts { _ in }

        let spy = network as? NetworkLogicSpy

        XCTAssertNotNil(spy)
        XCTAssertNotNil(spy!.networkRequest)
        XCTAssertTrue(spy!.networkRequest! is DashboardRequest)
    }

    // MARK: - Helpers
    private func makeSUT(
        file: StaticString = #filePath,
        line: UInt = #line
    ) -> (sut: DashboardRepository, network: NetworkLogic) {
        let network = NetworkLogicSpy()
        let sut = DashboardRepository(network: network)

        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(network, file: file, line: line)

        return (sut, network)
    }

    private func expected(sut: DashboardRepository, toCompleteWith expectedResult: Result<DashboardResponse, Error>) {
        var resultReceived: Result<DashboardResponse, Error>?

        sut.getProducts { resultReceived = $0 }

        switch (resultReceived, expectedResult) {
        case let (.success(responseReceivedReceived), .success(expectedResponse)):
            XCTAssertEqual(responseReceivedReceived, expectedResponse)
        case let (.failure(errorReceived as NSError), .failure(expectedError as NSError)):
            XCTAssertEqual(errorReceived, expectedError)
        default:
            XCTFail("Expected result \(expectedResult) got \(String(describing: resultReceived))")
        }
    }
}
