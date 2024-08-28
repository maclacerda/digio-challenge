//
//  DashboardResponse.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

struct DashboardResponse: Codable {
    let spotlight: [DashboardSpotlight]
    let products: [DashboardProducts]
    let cash: DashboardCash
}

struct DashboardSpotlight: Codable {
    let name: String
    let bannerURL: String
    let description: String
}

struct DashboardProducts: Codable {
    let name: String
    let imageURL: String
    let description: String
}

struct DashboardCash: Codable {
    let title: String
    let bannerURL: String
    let description: String
}
