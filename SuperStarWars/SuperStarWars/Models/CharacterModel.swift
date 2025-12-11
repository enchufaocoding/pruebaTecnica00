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
