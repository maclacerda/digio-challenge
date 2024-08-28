//
//  DetailLocalizable.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

import Foundation

enum DetailLocalizable: String, LocalizableProtocol {
    var table: String {
        return "Detail"
    }

    case spotlightTitle
    case productTitle
}
