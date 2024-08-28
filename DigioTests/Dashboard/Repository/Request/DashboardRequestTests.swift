//
//  DashboardRequestTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest
@testable import Digio

final class DashboardRequestTests: XCTestCase {
    func test_dashboardRequest() {
        let sut = DashboardRequest.products

        XCTAssertEqual(sut.path, "/products")
        XCTAssertEqual(sut.baseURL, "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox")
        XCTAssertEqual(sut.method, .get)
    }
}
