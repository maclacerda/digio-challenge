//
//  DetailScreenViewController.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import UIKit

protocol DetailDisplayLogic: AnyObject {
    func displayDetail(with viewModel: DetailScreenScenarios.Detail.ViewModel)
}

final class DetailScreenViewController: BaseViewController {
    // MARK: - Properties
    private let interactor: DetailBusinessLogic
    internal let customView = DetailScreenView()

    // MARK: - Initializers
    init(
        interactor: DetailBusinessLogic
    ) {
        self.interactor = interactor
        super.init()
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        queuedFatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadDetails(with: .init())
    }
}

// MARK: - Private methods

private extension DetailScreenViewController {
    func commonInit() {
        statusBarStyle = .default
        statusBarHidden = false
    }
}

extension DetailScreenViewController: DetailDisplayLogic {
    func displayDetail(with viewModel: DetailScreenScenarios.Detail.ViewModel) {
        title = viewModel.sourceType == .spotlights ? DetailLocalizable.spotlightTitle.localized : DetailLocalizable.productTitle.localized

        customView.viewData = viewModel
    }
}
