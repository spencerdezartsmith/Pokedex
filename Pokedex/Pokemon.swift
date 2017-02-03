//
//  Pokemon.swift
//  Pokedex
//
//  Created by spencerdezartsmith on 2/3/17.
//  Copyright © 2017 spencerdezartsmith. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    // Set up getters
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
    }
}
