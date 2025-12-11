//
//  CharacterCardView.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import SwiftUI

struct CharacterCardView: View {
    
    let characterInfo: CharacterModel

    var body: some View {
        HStack {
            Image(systemName: characterInfo.gender == "male" ? "person.fill" : "person.crop.circle")
                .resizable()
                .frame(width: 36, height: 36)
                .padding(.trailing, 8)

            VStack(alignment: .leading) {
                Text(characterInfo.name).font(.headline)
                Text(characterInfo.birth_year).font(.caption)
            }
            Spacer()
        }.padding(.vertical, 6)
    }
}

#Preview {
    CharacterCardView(characterInfo: .dataPreview)
}
