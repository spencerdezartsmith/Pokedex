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
    
    // Add rounded corners to each of the cells
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        pokeNameLabel.text = self.pokemon.name.capitalized
        pokeThumbnail.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
    }
}
