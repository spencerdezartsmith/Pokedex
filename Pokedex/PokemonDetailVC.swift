//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by spencerdezartsmith on 2/6/17.
//  Copyright © 2017 spencerdezartsmith. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    // Set up a variable for the sent segue info to be saved into
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(pokemon.name)

        // Do any additional setup after loading the view.
    }
}
