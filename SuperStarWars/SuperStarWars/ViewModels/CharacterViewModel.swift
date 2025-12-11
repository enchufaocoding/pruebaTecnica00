//
//  CharacterViewModel.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//


import Foundation
import Combine

@MainActor
final class CharacterViewModel: ObservableObject {
    @Published var character: [CharacterModel] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    @Published var sortByBirthYear: Bool = false

    private var currentPage = 1
    private var canLoadMore = true
    private var fetchedPages = Set<Int>()

    private var filmCache: [Int: FilmsModel] = [:]

    func loadNextPageWhenIsNeeded(currentItem: CharacterModel?) {
        guard !isLoading, canLoadMore else { return }
        guard let currentItem else {
            Task { await loadCharacterPage() }
            return
        }
        
        guard let characterIndex = character.firstIndex(where: { $0.id == currentItem.id }) else { return }
        
        if characterIndex >= character.count - 5 {
            Task { await loadCharacterPage() }
        }
    }

    func loadCharacterPage() async {
        guard !isLoading, canLoadMore, !fetchedPages.contains(currentPage) else { return }
        isLoading = true
        do {
            let resp = try await APIServices.fetchCharacter(pageNum: currentPage)
            character.append(contentsOf: resp.results)
            canLoadMore = resp.next != nil
            fetchedPages.insert(currentPage)
            currentPage += 1
            await persistenceCharacter(resp.results)
        } catch {
            print("Failed to load people: \(error)")
        }
        isLoading = false
    }

    var filteredPeople: [CharacterModel] {
        var list = character
        if !searchText.isEmpty {
            list = list.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        // ordenar la lista por año nacimiento
        if sortByBirthYear {
            list.sort { $0.birth_year < $1.birth_year }
        }
        return list
    }
    
    private func persistenceCharacter(_ dtos: [CharacterModel]) async {
        for dto in dtos {
            let id = dto.id
            let filmIds = dto.films.compactMap { Int($0.lastPathComponent) }
            let entity = CharacterPersistence(id: id, name: dto.name, birthYear: dto.birth_year, gender: dto.gender, filmsID: filmIds)
        }
    }
    
    
}
