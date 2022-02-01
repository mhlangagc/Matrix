//
//  MovieSearch.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

struct MovieResultsModel: Codable {
    var searchType, expression: String?
    var results: [SearchResults]?
    var errorMessage: String?
}

// MARK: - Search Result
struct SearchResults: Codable {
    var id, resultType: String?
    var image: String?
    var title, resultDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, resultType, image, title
        case resultDescription = "description"
    }
}
