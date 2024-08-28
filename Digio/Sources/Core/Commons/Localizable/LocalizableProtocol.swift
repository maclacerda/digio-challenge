//
//  LocalizableProtocol.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

import Foundation

/// Protocol to able a localize strings
public protocol LocalizableProtocol {
    /// Table of localizable Strings (i.e: Localizable.strings)
    var table: String { get }

    /// Return the simple localized String
    var localized: String { get }

    /// Return the complex localized String
    /// i.e:
    ///     - in your LocalizableStrings:
    ///         "day-remaining" = "%i days remaining";
    ///     - in your implementation of LocalizableProtocol:
    ///         case daysRemaining = "day-remaining"
    ///     - in your viewController (per example):
    ///         daysRemaining.localized(10)
    ///     returns:
    ///         "10 days remaining" in String format
    func localized(with parameters: CVarArg...) -> String
}

public extension LocalizableProtocol where Self: RawRepresentable, Self.RawValue == String {
    /// Return a localizaed string based on your key
    var localized: String {
        return Bundle.main.localizedString(forKey: rawValue, value: nil, table: table)
    }

    /// Return a localized string based on your key with parameters
    func localized(with parameters: CVarArg...) -> String {
        return withVaList(parameters) {
            NSString(format: localized, locale: Locale.current, arguments: $0) as String
        }
    }
}
