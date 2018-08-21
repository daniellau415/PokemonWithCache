//
//  FileManager.swift
//  PokemonAPICache
//
//  Created by Daniel Lau on 8/21/18.
//  Copyright © 2018 Daniel Lau. All rights reserved.
//

import UIKit

class FileHelper {
    
    static var fileManager = FileManager.default
    
    
    static var pokedexDirectory : URL {
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let pokedexDirectory = documentDirectory.
    }
}

