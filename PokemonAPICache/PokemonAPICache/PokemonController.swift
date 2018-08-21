//
//  PokemonController.swift
//  PokemonAPICache
//
//  Created by Daniel Lau on 8/21/18.
//  Copyright © 2018 Daniel Lau. All rights reserved.
//

import UIKit


class PokemonController {
    
    static func fetchPokemon(completion: @escaping([Pokemon]?) -> Void) {
        
        let baseURL = URL(string: "https://pokeapi.co/api/v2/pokedex/2/")!
    
        let dataTask = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
            
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let pokemonData = try jsonDecoder.decode(PokemonDictionary.self, from: data)
                    let pokemon = pokemonData.pokemon
                    completion(pokemon)
                } catch let error {
                    print(error)
                    completion(nil)
                    return
                }
            }
        }
        dataTask.resume()
    }
    
    static func fetchPokemonImage(pokemon: Pokemon, completion: @escaping(UIImage?)-> Void ){
        
        if let image = CacheManager
        
        guard let imageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.number).png") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                completion(image)
            }
            if let error = error {
                print(error)
                completion(nil)
                return
            }
        
        }
        dataTask.resume()
    }


}
