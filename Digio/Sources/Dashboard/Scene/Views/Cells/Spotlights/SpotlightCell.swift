//
//  SpotlightCell.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import UIKit

final class SpotlightCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier: String = "SpotlightCell"

    // MARK: - UI
    private var shadowLayer: CAShapeLayer?

    private lazy var containerView: UIView = {
        let containerView = UIView(frame: .zero)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white

        return containerView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        return imageView
    }()

    // MARK: - Reuse methods
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        queuedFatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    func setup(with spotlight: DashboardSpotlightViewModel) {
        imageView.download(with: spotlight.bannerURL, placeHolder: .placeHolderIcon)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        imageView.layer.cornerRadius = 18
        containerView.layer.cornerRadius = 18
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = false
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowColor = UIColor.darkGray.cgColor
    }
}

// MARK: - Private methods
private extension SpotlightCell {
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }

    func setupHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
