//
//  Pokemon.swift
//  PokemonAPICache
//
//  Created by Daniel Lau on 8/21/18.
//  Copyright © 2018 Daniel Lau. All rights reserved.
//

import Foundation

struct PokemonDictionary: Decodable {
    
    let pokemon: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case pokemon = "pokemon_entries"
    }
}

struct Pokemon: Decodable {
    
    let number: Int
    let species: Species
    
    enum CodingKeys: String, CodingKey {
        case number = "entry_number"
        case species = "pokemon_species"
    }
}

struct Species: Decodable {
    let name: String
}


