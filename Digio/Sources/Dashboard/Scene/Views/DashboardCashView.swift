//
//  DashboardCashView.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import UIKit

protocol DashboardCashViewDelegate: AnyObject {
    func didTapBanner(with title: String, and message: String)
}

final class DashboardCashView: UIView {
    // MARK: - Properties
    weak var delegate: DashboardCashViewDelegate?

    var cash: DashboardCashViewModel? {
        didSet {
            updateView()
        }
    }

    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left

        return titleLabel
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    // MARK: - Initializer
    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupGestures()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        queuedFatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.roundCorners()
    }
}

// MARK: - Private methods
private extension DashboardCashView {
    func setupSubviews() {
        addSubview(titleLabel)
        addSubview(imageView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupGestures() {
        isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapBanner))

        addGestureRecognizer(tapGesture)
    }

    func updateView() {
        guard let cash else { return }

        titleLabel.text = cash.title
        imageView.download(with: cash.bannerURL, placeHolder: .placeHolderIcon)
    }

    @objc
    func didTapBanner() {
        guard let cash else { return }

        delegate?.didTapBanner(with: cash.title, and: cash.description)
    }
}
