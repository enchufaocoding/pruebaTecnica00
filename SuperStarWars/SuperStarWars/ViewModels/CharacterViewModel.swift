//
//  CharacterViewModel.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation
import Combine

@MainActor
final class PeopleViewModel: ObservableObject {
    @Published var people: [CharacterModel] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    @Published var sortByBirthYear: Bool = false

    private var currentPage = 1
    private var canLoadMore = true
    private var fetchedPages = Set<Int>()

    private var filmCache: [Int: FilmsModel] = [:]
    
}
