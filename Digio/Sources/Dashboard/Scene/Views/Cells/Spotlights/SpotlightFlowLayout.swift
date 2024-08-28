//
//  SpotlightFlowLayout.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 27/08/24.
//

import UIKit

final class SpotlightFlowLayout: UICollectionViewFlowLayout {
    // MARK: - Public methods
    class func buildLayout() -> SpotlightFlowLayout {
        let layout = SpotlightFlowLayout()

        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 172)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.scrollDirection = .horizontal

        return layout
    }
}
