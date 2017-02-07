//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by spencerdezartsmith on 2/6/17.
//  Copyright © 2017 spencerdezartsmith. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var defenseLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var pokedexLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var attackLabel: UILabel!
    @IBOutlet var currentEvoImg: UIImageView!
    @IBOutlet var nextEvoImg: UIImageView!
    @IBOutlet var nextEvoLabel: UILabel!
    
    // Set up a variable for the sent segue info to be saved into
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        pokedexLabel.text = String(pokemon.pokedexId)
        
        let img = UIImage(named: String(pokemon.pokedexId))
        
        mainImage.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails {
            // Whatever we write here will only be called after the network call is complete
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        attackLabel.text = pokemon.attack
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
