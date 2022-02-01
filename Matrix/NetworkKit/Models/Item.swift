//
//  Item.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

struct Item: Codable {
    var id, name, itemDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case itemDescription = "description"
    }
}
