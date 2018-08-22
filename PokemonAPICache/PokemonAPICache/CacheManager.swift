//
//  CacheManager.swift
//  PokemonAPICache
//
//  Created by Daniel Lau on 8/21/18.
//  Copyright © 2018 Daniel Lau. All rights reserved.
//

import UIKit


class CacheManager {
    
    
    static let shared = CacheManager()
    
    var cache = NSCache<NSString, UIImage>()
    
    func cache(image: UIImage, pokemon: Pokemon) {
        
        let key = NSString(string: "\(pokemon.number)")
        cache.setObject(image, forKey: key)
    }
    
    func cacheImage(pokemon: Pokemon) -> UIImage? {
        
        let key = NSString(string: "\(pokemon.number)")
        let image = cache.object(forKey: key)
        
        return image
    }
    
    func removeCache() {
        cache.removeAllObjects()
        FileHelper.deletePokemon()
    }
}
