//
//  DashboardProductsView.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import UIKit

protocol DashboardProductsViewDelegate: AnyObject {
    func didTapProduct(with product: DashboardProductsViewModel)
}

final class DashboardProductsView: UIView {
    // MARK: - Properties
    weak var delegate: DashboardProductsViewDelegate?

    var products: [DashboardProductsViewModel] = [] {
        didSet {
            updateView()
        }
    }

    var canShowTitleLabel = true {
        didSet {
            titleLabel.isHidden = !canShowTitleLabel
        }
    }

    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .left
        titleLabel.text = DashboardLocalizable.products.localized

        return titleLabel
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ProductsFlowLayout.buildLayout())

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProductsCell.self, forCellWithReuseIdentifier: ProductsCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 0, left: 8, bottom: 0, right: 8)

        return collectionView
    }()

    // MARK: - Initializer
    init() {
        super.init(frame: .zero)
        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        queuedFatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
private extension DashboardProductsView {
    func setupSubviews() {
        addSubview(titleLabel)
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }

    func updateView() {
        collectionView.reloadData()
    }
}

// MARK: - CollectionView methods
extension DashboardProductsView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCell.identifier, for: indexPath) as? ProductsCell else {
            return UICollectionViewCell()
        }

        cell.setup(with: products[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        delegate?.didTapProduct(with: product)
    }
}
