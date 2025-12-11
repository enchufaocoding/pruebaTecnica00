//
//  CharacterDetailsView.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    @StateObject private var viewmodel = FilmsViewModel()
    let characterInfo: CharacterModel
    
    var body: some View {
        List {
            Section("Info") {
                Text("Name: \(characterInfo.name)")
                Text("Birth: \(characterInfo.birth_year)")
                Text("Gender: \(characterInfo.gender)")
            }

            Section("Films") {
                if viewmodel.films.isEmpty {
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                }
                ForEach(viewmodel.films) { film in
                    VStack(alignment: .leading) {
                        Text(film.title).font(.headline)
                        Text("Director: \(film.director)")
                        Text("Release: \(film.release_date)").font(.caption)
                    }.padding(.vertical, 6)
                }
            }
        }
        .navigationTitle(characterInfo.name)
        .task {
            await viewmodel.loadFilms(urls: characterInfo.films)
        }
    }
}


#Preview {
    NavigationStack {
        CharacterDetailsView(characterInfo: .dataPreview)
    }
}

