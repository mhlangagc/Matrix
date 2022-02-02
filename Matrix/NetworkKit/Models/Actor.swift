//
//  Actor.swift
//  Matrix
//
//  Created by Gugulethu Mhlanga on 2022/02/01.
//

import Foundation

struct Actor: Codable, Comparable {
    
    static func < (lhs: Actor, rhs: Actor) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String?
    var image: String?
    var name, asCharacter: String?
}
