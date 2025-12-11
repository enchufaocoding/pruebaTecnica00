//
//  CharacterPersistence.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation
import SwiftData

@Model
final class CharacterPersistence {
    var id: Int
    var name: String
    var birthYear: String
    var gender: String
    var filmsID: [Int]
    var updated: Date?
    
    init(id: Int, name: String, birthYear: String, gender: String, filmsID: [Int], updated: Date? = Date()) {
        self.id = id
        self.name = name
        self.birthYear = birthYear
        self.gender = gender
        self.filmsID = filmsID
        self.updated = updated
    }
}
