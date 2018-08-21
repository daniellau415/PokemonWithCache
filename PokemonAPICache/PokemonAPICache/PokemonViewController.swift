//
//  PokemonViewController.swift
//  PokemonAPICache
//
//  Created by Daniel Lau on 8/21/18.
//  Copyright © 2018 Daniel Lau. All rights reserved.
//

import UIKit


class PokemonViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var pokemons : [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func fetchButtonTapped(_ sender: Any) {

        
        PokemonController.fetchPokemon { (pokemons) in
            DispatchQueue.main.async {
                guard let pokemons = pokemons else { return }
                self.pokemons = pokemons
                self.tableView.reloadData()
            }
        }
    }
}

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as! PokemonCell
        let pokemon = pokemons[indexPath.row]
        cell.pokemonName.text = pokemon.name
        PokemonController.fetchPokemonImage(pokemon: pokemon) { (image) in
            DispatchQueue.main.async {
                 cell.pokemonImage.image = image
            }
           
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
