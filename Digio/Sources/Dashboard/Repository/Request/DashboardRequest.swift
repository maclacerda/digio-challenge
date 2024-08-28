//
//  DashboardRequest.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

enum DashboardRequest: NetworkRequest {
    case products

    var path: String {
        switch self {
        case .products: "/products"
        }
    }

    var method: HTTPMethod {
        .get
    }
}
