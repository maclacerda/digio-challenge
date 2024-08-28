//
//  DashboardView.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import UIKit

enum DashboardViewState {
    case loading
    case loaded
}

protocol DashboardViewDelegate: DashboardCashViewDelegate, DashboardProductsViewDelegate, DashboardSpotlightViewDelegate {}

final class DashboardView: UIView {
    // MARK: - Properties
    weak var delegate: DashboardViewDelegate? {
        didSet {
            spotlightView.delegate = delegate
            bannerView.delegate = delegate
            productsView.delegate = delegate
        }
    }

    var viewData: DashboardViewModel? {
        didSet {
            updateView()
        }
    }

    var state: DashboardViewState = .loading {
        didSet {
            loadingView.isHidden = state != .loading
            scrollView.isHidden = !loadingView.isHidden
        }
    }

    private lazy var loadingView: UIActivityIndicatorView = {
        let loadingView: UIActivityIndicatorView

        if #available(iOS 13.0, *) {
            loadingView = UIActivityIndicatorView(style: .large)
        } else {
            loadingView = UIActivityIndicatorView()
        }

        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.tintColor = .darkGray
        loadingView.startAnimating()

        loadingView.isHidden = true

        return loadingView
    }()

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

    private lazy var spotlightView: DashboardSpotlightView = {
        let spotlightView = DashboardSpotlightView()

        spotlightView.translatesAutoresizingMaskIntoConstraints = false

        return spotlightView
    }()

    private lazy var bannerView: DashboardCashView = {
        let bannerView = DashboardCashView()

        bannerView.translatesAutoresizingMaskIntoConstraints = false

        return bannerView
    }()

    private lazy var productsView: DashboardProductsView = {
        let productsView = DashboardProductsView()

        productsView.translatesAutoresizingMaskIntoConstraints = false

        return productsView
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
private extension DashboardView {
    func setupSubviews() {
        setupScrollView()
        setupContentView()
        setupLoadingView()
        setupSpotlightView()
        setupBannerView()
        setupProductsView()
    }

    func setupLoadingView() {
        addSubview(loadingView)

        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
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

    func setupSpotlightView() {
        contentView.addSubview(spotlightView)

        NSLayoutConstraint.activate([
            spotlightView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            spotlightView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            spotlightView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            spotlightView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

    func setupBannerView() {
        contentView.addSubview(bannerView)

        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: spotlightView.bottomAnchor, constant: -16),
            bannerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerView.heightAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
    }

    func setupProductsView() {
        contentView.addSubview(productsView)

        NSLayoutConstraint.activate([
            productsView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 24),
            productsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productsView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    func updateView() {
        guard let viewData = self.viewData else { return }

        spotlightView.spotlight = viewData.spotlight
        bannerView.cash = viewData.cash
        productsView.products = viewData.products
    }
}
