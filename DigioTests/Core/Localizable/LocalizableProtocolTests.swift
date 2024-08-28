//
//  LocalizableProtocolTests.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio
import XCTest

class LocalizableProtocolTests: XCTestCase {

    private let sut = LocalizableMock.testLocalizable

    func testLocalizableProtocol_localizedProperty_ShouldReturnANonEmptyString() {
        let expectedResult = "testLocalizable"

        XCTAssertFalse(sut.localized.isEmpty)
        XCTAssertEqual(expectedResult, sut.localized)
    }

    func testLocalizableProtocol_tableProperty_ShouldReturnANonEmptyString() {
        let expectedResult = "LocalizableTable"

        XCTAssertFalse(sut.table.isEmpty)
        XCTAssertEqual(expectedResult, sut.table)
    }

    func testLocalizableProtocol_localized_ShouldReturnACorrectLocalizedString() {
        let expectedResult = "testLocalizable"

        let stringLocalized = sut.localized(with: "")

        XCTAssertEqual(expectedResult, stringLocalized)
    }
}

// MARK: - Testing Helpers
private enum LocalizableMock: String, LocalizableProtocol {
    var table: String {
        return "LocalizableTable"
    }

    case testLocalizable
}
