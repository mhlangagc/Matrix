//
//  BaseURL.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

enum URLCenter {
    
    case searchMovie(expression: String)
    case fullCast(movieID: String)
    
    public func buildURL(withPath path: String) -> String {
        switch self {
        case .searchMovie(let expression):
            return "\(AppConfiguration.secureApiProtocol)://\(AppConfiguration.imdbURI)/SearchMovie/\(AppConfiguration.imdbAPIKey)/\(expression)"
        case .fullCast(let movieID):
            return "\(AppConfiguration.secureApiProtocol)://\(AppConfiguration.imdbURI)/FullCast/\(AppConfiguration.imdbAPIKey)/\(movieID)"
        }
        
    }
}
