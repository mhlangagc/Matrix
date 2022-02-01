//
//  APIKitProtocol.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation
import Alamofire

protocol APIKitProtocol {
    func fetchAPIData<Model: Decodable>(withURL url: String,
                                        parameters: Parameters,
                                        headers: HTTPHeaders?,
                                        method: HTTPMethod,
                                        encodedURL: Bool,
                                        model: Model.Type,
                                        completion: @escaping (Model?, APIError?) -> Void)
}
