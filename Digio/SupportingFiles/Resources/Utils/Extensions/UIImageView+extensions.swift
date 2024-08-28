//
//  UIImageView+extensions.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 08/26/24.
//

import Foundation
import UIKit

extension UIImageView {
    func roundCorners() {
        let height = self.frame.size.height

        DispatchQueue.main.async { [weak self] in
            self?.roundCorners([.allCorners], radius: height)
        }
    }

    func download(with url: String, placeHolder: UIImage? = nil) {
        guard let photoURL = URL(string: url) else { return }

        URLSession.shared.dataTask(with: URLRequest(url: photoURL)) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil,
                let image = UIImage(data: data) else {
                DispatchQueue.main.async() { [weak self] in
                    self?.image = placeHolder
                }
                return
            }

            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
