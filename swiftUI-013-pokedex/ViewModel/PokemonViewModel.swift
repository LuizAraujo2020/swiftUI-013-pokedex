//
//  PokemonViewModel.swift
//  swiftUI-013-pokedex
//
//  Created by Luiz Carlos da Silva Araujo on 15/09/21.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
}
// remover o null da API
extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataString = String(data: self, encoding: .utf8)
        let parseDataString = dataString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
