//
//  ProductsFlowLayout.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import UIKit

final class ProductsFlowLayout: UICollectionViewFlowLayout {
    // MARK: - Public methods
    class func buildLayout() -> ProductsFlowLayout {
        let layout = ProductsFlowLayout()

        layout.itemSize = CGSize(width: 120, height: 120)
        layout.minimumLineSpacing = 24
        layout.minimumInteritemSpacing = 24
        layout.scrollDirection = .horizontal

        return layout
    }
}
