//
//  DashboardRepository.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

protocol DashboardRepositoryProtocol {
    func getProducts(_ completion: @escaping (Result<DashboardResponse, Error>) -> Void)
}

final class DashboardRepository {
    // MARK: - Properties
    private let network: NetworkLogic

    // MARK: - Initializer
    init(network: NetworkLogic) {
        self.network = network
    }
}

// MARK: - DashboardRepositoryProtocol

extension DashboardRepository: DashboardRepositoryProtocol {
    public func getProducts(_ completion: @escaping (Result<DashboardResponse, Error>) -> Void) {
        let request: DashboardRequest = .products

        network.request(request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()

                do {
                    let response = try decoder.decode(DashboardResponse.self, from: data)

                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
