//
//  DashboardViewController.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import UIKit

protocol DashboardDisplayLogic: AnyObject {
    func displayDashboardProducts(with viewModel: DashboardScenarios.Products.ViewModel)
    func displayDetail(with viewModel: DashboardScenarios.Detail.ViewModel)
}

protocol DashboardViewControllerDelegate: AnyObject {
    func goToDetail(with data: DetailScreenData)
}

final class DashboardViewController: BaseViewController {
    // MARK: - Properties
    weak var delegate: DashboardViewControllerDelegate?
    private let interactor: DashboardBusinessLogic

    internal let customView = DashboardView()

    // MARK: - Initializers
    init(
        interactor: DashboardBusinessLogic
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
        customView.delegate = self
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.state = .loading
        interactor.loadProducts(with: .init())
    }
}

// MARK: - Private methods

private extension DashboardViewController {
    func commonInit() {
        statusBarStyle = .default
        statusBarHidden = false

        buildAvatarView(with: DashboardLocalizable.welcomeMessage.localized(with: "Marcos"))
    }
}

extension DashboardViewController: DashboardDisplayLogic {
    func displayDashboardProducts(with viewModel: DashboardScenarios.Products.ViewModel) {
        switch viewModel {
        case .success(let viewModel):
            customView.viewData = viewModel
            customView.state = .loaded

        case .failure(let viewModel):
            customView.state = .loaded

            let message = DashboardLocalizable.loadErrorMessage.localized(
                with: viewModel.message
            )

            showMessage(message: message)
        }
    }

    func displayDetail(with viewModel: DashboardScenarios.Detail.ViewModel) {
        delegate?.goToDetail(with: viewModel.data)
    }
}

// MARK: - DashboardViewDelegate
extension DashboardViewController: DashboardViewDelegate {
    func didTapBanner(with title: String, and message: String) {
        showMessage(with: title, message: message)
    }

    func didTapProduct(with product: DashboardProductsViewModel) {
        interactor.prepareDetailData(with: .init(product: product))
    }

    func didTapSpotlight(with spotlight: DashboardSpotlightViewModel) {
        interactor.prepareDetailData(with: .init(spotlight: spotlight))
    }
}
