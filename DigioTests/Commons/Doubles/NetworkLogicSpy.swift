//
//  NetworkLogicSpy.swift
//  DigioAppTests
//
//  Created by Marcos Ferreira on 28/08/24.
//

import Foundation
@testable import Digio

final class NetworkLogicSpy: NetworkLogic {
    var networkRequest: NetworkRequest?

    func request(_ networkRequest: NetworkRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        self.networkRequest = networkRequest
    }
}
