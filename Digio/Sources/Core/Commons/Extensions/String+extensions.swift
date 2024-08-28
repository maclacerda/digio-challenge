//
//  String+extensions.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

public extension String {
    /**
     @function bridge
     @abstraction Convert the `String` object in `NSString` object
     */
    func bridge() -> NSString {
        return self as NSString
    }
}
