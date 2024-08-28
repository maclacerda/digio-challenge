//
//  DashboardLocalizable.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

import Foundation

enum DashboardLocalizable: String, LocalizableProtocol {
    var table: String {
        return "Dashboard"
    }

    case welcomeMessage
    case loadErrorMessage
    case products
}
