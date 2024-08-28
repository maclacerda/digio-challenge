//
//  DashboardSpotlightView.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import UIKit

protocol DashboardSpotlightViewDelegate: AnyObject {
    func didTapSpotlight(with spotlight: DashboardSpotlightViewModel)
}

final class DashboardSpotlightView: UIView {
    // MARK: - Properties
    weak var delegate: DashboardSpotlightViewDelegate?

    var spotlight: [DashboardSpotlightViewModel] = [] {
        didSet {
            updateView()
        }
    }

    // MARK: - UI
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: SpotlightFlowLayout.buildLayout())

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SpotlightCell.self, forCellWithReuseIdentifier: SpotlightCell.identifier)
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
private extension DashboardSpotlightView {
    func setupSubviews() {
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 190),
            collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }

    func updateView() {
        collectionView.reloadData()
    }
}

// MARK: - CollectionView methods
extension DashboardSpotlightView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        spotlight.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCell.identifier, for: indexPath) as? SpotlightCell else {
            return UICollectionViewCell()
        }

        cell.setup(with: spotlight[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let spotlight = spotlight[indexPath.row]
        delegate?.didTapSpotlight(with: spotlight)
    }
}
