//
//  DetailScreenView.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import UIKit

final class DetailScreenView: UIView {
    // MARK: - Properties
    var viewData: DetailScreenScenarios.Detail.ViewModel? {
        didSet {
            updateView()
        }
    }

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false

        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView(frame: .zero)

        contentView.translatesAutoresizingMaskIntoConstraints = false

        return contentView
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left

        return titleLabel
    }()

    private lazy var spotlightView: DashboardSpotlightView = {
        let spotlightView = DashboardSpotlightView()

        spotlightView.translatesAutoresizingMaskIntoConstraints = false
        spotlightView.isHidden = true

        return spotlightView
    }()

    private lazy var productsView: DashboardProductsView = {
        let productsView = DashboardProductsView()

        productsView.translatesAutoresizingMaskIntoConstraints = false
        productsView.isHidden = true

        return productsView
    }()

    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel(frame: .zero)

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.numberOfLines = 0

        return descriptionLabel
    }()

    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        setupSubviews()
        backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        queuedFatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
private extension DetailScreenView {
    func setupSubviews() {
        setupScrollView()
        setupContentView()
        setupTitleLabel()
        setupSpotlightView()
        setupProductsView()
    }

    func setupScrollView() {
        addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func setupContentView() {
        scrollView.addSubview(contentView)

        let contentViewHeightConstraint = contentView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            contentViewHeightConstraint
        ])
    }

    func setupTitleLabel() {
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    func setupSpotlightView() {
        contentView.addSubview(spotlightView)

        NSLayoutConstraint.activate([
            spotlightView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            spotlightView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            spotlightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            spotlightView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    func setupProductsView() {
        contentView.addSubview(productsView)

        NSLayoutConstraint.activate([
            productsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            productsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productsView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    func setupDescriptionLabel() {
        guard let lastView = contentView.subviews.last else { return }

        contentView.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: lastView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    func updateView() {
        guard let viewData else { return }

        titleLabel.text = viewData.name
        descriptionLabel.text = viewData.description

        switch viewData.sourceType {
        case .spotlights:
            productsView.removeFromSuperview()

            spotlightView.spotlight = makeSpotlightData()
            spotlightView.isHidden = false
        case .products:
            spotlightView.removeFromSuperview()

            productsView.products = makeProductsData()
            productsView.canShowTitleLabel = false
            productsView.isHidden = false
        }

        setupDescriptionLabel()
    }
}

// MARK: - Helpers
private extension DetailScreenView {
    func makeSpotlightData() -> [DashboardSpotlightViewModel] {
        guard let viewData else {
            return []
        }

        return [
            .init(
                name: viewData.name,
                bannerURL: viewData.imageURL,
                description: viewData.description
            )
        ]
    }

    func makeProductsData() -> [DashboardProductsViewModel] {
        guard let viewData else {
            return []
        }

        return [
            .init(
                name: viewData.name,
                imageURL: viewData.imageURL,
                description: viewData.description
            )
        ]
    }
}
