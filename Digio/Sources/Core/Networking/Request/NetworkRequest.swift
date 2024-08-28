//
//  NetworkRequest.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Foundation

/// Defines the Request protocol, which can be implemented as a class, struct or enum
public protocol NetworkRequest {
    /// The API's base url
    var baseURL: String { get }

    /// Defines the endpoint we want to hit
    var path: String { get }

    /// Relative to the method we want to call, that was defined with an enum above
    var method: HTTPMethod { get }

    /// Defines the list of headers we want to be passed along with each request
    var headers: [String: String]? { get }
}

public extension NetworkRequest {
    /// Base URL to concate with path
    var baseURL: String {
        "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox"
    }

    /// Allow to send custom headers in request
    var headers: [String: String]? {
        nil
    }

    /// Performs request using the info provides in `NetworkRequest` object
    func toRequest() -> URLRequest? {
        guard let url = URL(string: String(format: "%@%@", baseURL, path)) else {
            return nil
        }

        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue.uppercased()
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let headers {
            headers.keys.forEach {
                if let value = headers[$0] {
                    request.addValue(value, forHTTPHeaderField: $0)
                }
            }
        }

        return request
    }
}
