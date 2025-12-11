//
//  PersistenceManager.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation
import SwiftData

struct PersistenceManager {
    static let shared = PersistenceManager()

    let container: ModelContainer

    init(inMemory: Bool = false) {
        let models = try! ModelContainer(for: CharacterPersistence.self, FilmPersistence.self)
        self.container = models
    }
}
