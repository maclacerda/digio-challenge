//
//  DetailScreenInteractor.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import Foundation

protocol DetailBusinessLogic {
    func loadDetails(with request: DetailScreenScenarios.Detail.Request)
}

struct DetailScreenData {
    let sourceType: DetailScreenSourceType
    let model: DetailScreenViewModel
}

final class DetailScreenInteractor {
    // MARK: - Properties
    private let presenter: DetailPresentationLogic
    private let data: DetailScreenData

    // MARK: - Initializer
    init(
        presenter: DetailPresentationLogic,
        data: DetailScreenData
    ) {
        self.presenter = presenter
        self.data = data
    }
}

// MARK: - DetailBusinessLogic
extension DetailScreenInteractor: DetailBusinessLogic {
    func loadDetails(with request: DetailScreenScenarios.Detail.Request) {
        presenter.presentDetails(
            with: .init(
                sourceType: data.sourceType,
                name: data.model.name,
                description: data.model.description,
                imageURL: data.model.imageURL
            )
        )
    }
}
