//
//  FilmsModel.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation
import SwiftUI

struct FilmsModel: Codable, Identifiable {
    let title: String
    let director: String
    let release_date: String
    let url: String

    var id: Int { Int(URL(string: url)!.lastPathComponent) ?? UUID().hashValue }
}
