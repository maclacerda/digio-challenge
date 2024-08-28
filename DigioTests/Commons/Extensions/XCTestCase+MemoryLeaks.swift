//
//  XCTestCase+MemoryLeaks.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import XCTest

extension XCTestCase {
    /// Method to capture possible memory leaks
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        if #available(iOS 13.0, *) {
            addTeardownBlock { [weak instance] in
                XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
            }
        }
    }
}
