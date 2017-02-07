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

    // Set up a variable for the sent segue info to be saved into
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
    }
}
