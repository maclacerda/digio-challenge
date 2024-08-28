//
//  DetailScreenScenarios.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import Foundation

// swiftlint:disable nesting
enum DetailScreenScenarios {
    enum Detail {
        struct Request {}

        struct Response {
            let sourceType: DetailScreenSourceType
            let name: String
            let description: String
            let imageURL: String
        }

        struct ViewModel {
            let sourceType: DetailScreenSourceType
            let name: String
            let description: String
            let imageURL: String
        }
    }
}
