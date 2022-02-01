//
//  AppConfiguration.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

public class AppConfiguration {
    
    private enum InfoPlistKey: String {
        case secureApiProtocol
        case imdbURI
        case imdbAPIKey
    }
    
    static let infoDictionary = Bundle.main.infoDictionary
    
    static var secureApiProtocol: String {
        return infoDictionary?[InfoPlistKey.secureApiProtocol.rawValue] as? String ?? ""
    }
    
    static var imdbURI: String {
        infoDictionary?[InfoPlistKey.imdbURI.rawValue] as? String ?? ""
    }
    
    static var imdbAPIKey: String {
        infoDictionary?[InfoPlistKey.imdbAPIKey.rawValue] as? String ?? ""
    }
}
