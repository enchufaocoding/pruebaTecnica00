//
//  FilmsViewModel.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class FilmsViewModel: ObservableObject {
    @Published var films: [FilmsModel] = []

    func loadFilms(urls: [URL]) async {
        let tasks = await withTaskGroup(of: FilmsModel?.self) { group -> [FilmsModel] in
            for url in urls {
                group.addTask {
                    try? await APIServices.fetchFilms(url: url)
                }
            }
            var results: [FilmsModel] = []
            for await result in group {
                if let films = result { results.append(films) }
            }
            return results
        }
        films = tasks.sorted { $0.release_date < $1.release_date }
    }
}
