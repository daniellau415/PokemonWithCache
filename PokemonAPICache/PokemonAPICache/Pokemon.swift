//
//  Pokemon.swift
//  PokemonAPICache
//
//  Created by Daniel Lau on 8/21/18.
//  Copyright © 2018 Daniel Lau. All rights reserved.
//

import Foundation


struct PokemonDictionary: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case pokemon = "pokemon_entries"
    }
    
    let pokemon: [Pokemon]
}

struct Pokemon: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case number = "entry_number"
        case species = "pokemon_species"
    }
    
    let number: Int
    let species: Species
    
    struct Species: Decodable {
        let name: String
    }
    
    var name: String {
        return species.name
    }
}




