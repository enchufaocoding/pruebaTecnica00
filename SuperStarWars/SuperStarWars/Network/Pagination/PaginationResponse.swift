//
//  PaginationResponse.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation

struct PaginationResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [CharacterModel]
}
