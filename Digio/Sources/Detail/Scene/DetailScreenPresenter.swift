//
//  DetailScreenPresenter.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import Foundation

protocol DetailPresentationLogic {
    func presentDetails(with response: DetailScreenScenarios.Detail.Response)
}

final class DetailScreenPresenter {
    // MARK: - Properties
    weak var view: DetailDisplayLogic?

    // MARK: - Initializer
    init() {}
}

// MARK: - DetailPresentationLogic
extension DetailScreenPresenter: DetailPresentationLogic {
    func presentDetails(with response: DetailScreenScenarios.Detail.Response) {
        view?.displayDetail(
            with: .init(
                sourceType: response.sourceType,
                name: response.name,
                description: response.description,
                imageURL: response.imageURL
            )
        )
    }
}
