//
//  APIResponse.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

protocol APIResponseProtocol: AnyObject {
    var defaultError: APIError { get }
}

extension APIResponseProtocol {
    
    func handleResponse<T: Codable, APIError>(response: T?,
                                              error: APIError?,
                                              completion: @escaping(Result<T, APIError>) -> Void) {
        if error != nil || response == nil {
            completion(.failure(error!))
        } else if let response = response {
            completion(.success(response))
        } else {
            completion(.failure((self.defaultError as? APIError)!))
        }
    }
}
