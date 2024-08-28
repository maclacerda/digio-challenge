//
//  DashboardRepositorySpy.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 28/08/24.
//

@testable import Digio
import Foundation

final class DashboardRepositorySpy: DashboardRepositoryProtocol {
    private var requests: [(Result<DashboardResponse, Error>) -> Void] = []

    var requestsCount: Int {
        requests.count
    }

    func getProducts(_ completion: @escaping (Result<DashboardResponse, Error>) -> Void) {
        completion(.success(.fixture()))
        requests.append(completion)
    }

    func completeWithSuccess(response: DashboardResponse, at index: Int = 0) {
        requests[index](.success(response))
    }

    func completeWithError(_ error: NSError = NSError(), at index: Int = 0) {
        requests[index](.failure(error))
    }
}
