//
//  FilmPersistence.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation
import SwiftData

@Model
final class FilmPersistence {
    var id: Int
    var title: String
    var director: String
    var releaseDate: String
    var updated: Date?
    
    init(id: Int, title: String, director: String, releaseDate: String, updated: Date? = Date()) {
        self.id = id
        self.title = title
        self.director = director
        self.releaseDate = releaseDate
        self.updated = updated
    }
}
