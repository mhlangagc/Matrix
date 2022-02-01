//
//  APIError.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

enum APIError: Error {
    case `default`
    case invalidURL
    case network
    case custom(String)
}
