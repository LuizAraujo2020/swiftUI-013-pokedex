//
//  PokemonCell.swift
//  swiftUI-013-pokedex
//
//  Created by Luiz Carlos da Silva Araujo on 13/09/21.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)
                    
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }   //ZStack
        .background(Color.green)
        .cornerRadius(12)
        .shadow(color: .green, radius: 6, x: 0.0, y: 0.0)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POKEMON[3])
    }
}
