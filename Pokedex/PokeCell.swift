//
//  PokeCell.swift
//  Pokedex
//
//  Created by spencerdezartsmith on 2/3/17.
//  Copyright © 2017 spencerdezartsmith. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet var pokeThumbnail: UIImageView!
    @IBOutlet var pokeNameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        pokeNameLabel.text = self.pokemon.name.capitalized
        pokeThumbnail.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
    }
}
