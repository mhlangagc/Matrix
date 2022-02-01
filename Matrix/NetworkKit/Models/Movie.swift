//
//  FullMovieCast.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

struct Movie: Codable {
    var imDBID, title, fullTitle, type: String?
    var year: String?
    var directors, writers: Directors?
    var actors: [Actor]?
    var others: [Directors]?
    var errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case imDBID = "imDbId"
        case title, fullTitle, type, year, directors, writers, actors, others, errorMessage
    }
}
