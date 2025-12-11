//
//  CharacterView.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import SwiftUI
import Combine

struct CharacterView: View {
    @StateObject var viewmodel = CharacterViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewmodel.filteredPeople) { character in
                    NavigationLink(value: character) {
                        CharacterCardView(characterInfo: character)
                            .onAppear {
                                viewmodel.loadNextPageIfNeeded(currentItem: character)
                            }
                    }
                }

                if viewmodel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
            }
            .navigationTitle("Characters")
            .searchable(text: $viewmodel.searchText, placement: .navigationBarDrawer(displayMode: .automatic))
            .toolbar {
                Toggle("Sort by birth", isOn: $viewmodel.sortByBirthYear)
            }
            .task {
                if viewmodel.people.isEmpty {
                    await viewmodel.loadPeoplePage()
                }
            }
            .navigationDestination(for: CharacterModel.self) { character in
                CharacterDetailsView(characterInfo: character)
            }
        }
    }
}


#Preview {
    CharacterView(viewmodel: CharacterViewModel())
}
