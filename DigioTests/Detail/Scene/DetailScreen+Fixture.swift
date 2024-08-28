//
//  DetailScreen+Fixture.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio

extension DetailScreenData {
    static func fixture() -> Self {
        .init(
            sourceType: .products,
            model: .fixture()
        )
    }
}

extension DetailScreenViewModel {
    static func fixture() -> Self {
        .init(
            name: "",
            description: "",
            imageURL: ""
        )
    }
}

extension DetailScreenScenarios.Detail.Response: Equatable {
    public static func == (lhs: DetailScreenScenarios.Detail.Response, rhs: DetailScreenScenarios.Detail.Response) -> Bool {
        lhs.sourceType == rhs.sourceType && lhs.name == rhs.name && lhs.description == rhs.description && lhs.imageURL == rhs.imageURL
    }

    static func fixture() -> Self {
        .init(
            sourceType: .products,
            name: "",
            description: "",
            imageURL: ""
        )
    }
}

extension DetailScreenScenarios.Detail.ViewModel: Equatable {
    public static func == (lhs: DetailScreenScenarios.Detail.ViewModel, rhs: DetailScreenScenarios.Detail.ViewModel) -> Bool {
        lhs.sourceType == rhs.sourceType && lhs.name == rhs.name && lhs.description == rhs.description && lhs.imageURL == rhs.imageURL
    }

    static func fixture() -> Self {
        .init(
            sourceType: .products,
            name: "",
            description: "",
            imageURL: ""
        )
    }
}
