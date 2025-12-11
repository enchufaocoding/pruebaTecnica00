//
//  CharacterModel.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation
import SwiftUI

struct CharacterModel: Identifiable, Codable, Hashable {
    let name: String
    let birth_year: String
    let gender: String
    let films: [URL]
    let url: String
    
    var id: Int { Int(URL(string: url)!.lastPathComponent) ?? UUID().hashValue}
}


extension CharacterModel {
    static let dataPreview = CharacterModel(
        name: "Luke Skywalker",
        birth_year: "19BBY",
        gender: "male",
        films: [
            URL(string: "https://swapi.dev/api/films/1/")!
        ], url: "https://swapi.dev/api/films/1/"
    )
}
