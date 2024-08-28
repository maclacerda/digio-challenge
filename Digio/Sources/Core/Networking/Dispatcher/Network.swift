//
//  Network.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

/// Protocol to defines the Network request logic
public protocol NetworkLogic {
    /// Method to allow request any data in specific path
    func request(
        _ networkRequest: NetworkRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    )
}

public final class Network: NetworkLogic {
    // MARK: Public properties
    public static let shared = Network()

    // MARK: Initialization
    private init() {}

    // MARK: Public methods
    public func request(
        _ networkRequest: NetworkRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        guard let request = networkRequest.toRequest() else {
            completion(.failure(NSError(domain: "Can't convert NetworkRequest into URLRequest", code: -1)))
            return
        }

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }

            guard let data else {
                completion(.failure(NSError(domain: "No data found", code: -1)))
                return
            }

            DispatchQueue.main.async {
                completion(.success(data))
            }
        }.resume()
    }
}
