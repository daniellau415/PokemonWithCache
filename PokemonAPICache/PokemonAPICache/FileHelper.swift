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
    
    static var pokemonURL : URL {
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let pokemonFile = documentDirectory.appendingPathComponent("pokemonFile", isDirectory: true)
        
        if fileManager.fileExists(atPath: pokemonFile.path) == false {
            do {
                try fileManager.createDirectory(at: pokemonFile, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("error creating file directory")
            }
        }
        return pokemonFile
    }
    
    //Adds file name
    static func fileURL(pokemon: Pokemon) -> URL {
        let fileName =  "\(pokemon.name)\(pokemon.number)"
        let url = pokemonURL.appendingPathComponent(fileName)
        return url
    }
    
    static func store(image: UIImage, pokemon: Pokemon) {
        let fileURL = self.fileURL(pokemon: pokemon)
        guard fileManager.fileExists(atPath: fileURL.path) == false else { return }
        guard let data = UIImageJPEGRepresentation(image, 1) else { return }
        do {
            try data.write(to: fileURL)
        } catch {
            print("fail to write data" + fileURL.path)
        }
    }
    
    static func retrieve(pokemon: Pokemon) -> UIImage? {
        let fileURL = self.fileURL(pokemon: pokemon)
        guard let data =  fileManager.contents(atPath: fileURL.path) else { return nil}
        let image = UIImage(data: data)
        return image
    }
    
    static func deletePokemon() {
        do {
            try fileManager.removeItem(at: pokemonURL)
        } catch {
            print("error deleting pokemon")
        }
        
    }
}

