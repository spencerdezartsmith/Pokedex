//
//  Pokemon.swift
//  Pokedex
//
//  Created by spencerdezartsmith on 2/3/17.
//  Copyright © 2017 spencerdezartsmith. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoText: String!
    private var _nextEvoName: String!
    private var _nextEvoLevel: String!
    private var _nextEvoPokedexID: String!
    private var _pokemonURL: String!
    
    // Set up getters
    
    var description: String {
        
        if _description == nil {
            
            _description = ""
        }
        
        return _description
    }
    
    var type: String {
        
        if _type == nil {
            
            _type = ""
        }
        
        return _type
    }
    
    var defense: String {
        
        if _defense == nil {
            
            _defense = ""
        }
        
        return _defense
    }
    
    var height: String {
        
        if _height == nil {
            
            _height = ""
        }
        
        return _height
    }
    
    var nextEvoPokedexID: String {
        
        if _nextEvoPokedexID == nil {
            
            _nextEvoPokedexID = ""
        }
        
        return _nextEvoPokedexID
    }
    
    var weight: String {
        
        if _weight == nil {
            
            _weight = ""
        }
        
        return _weight
    }
    
    var attack: String {
        
        if _attack == nil {
            
            _attack = ""
        }
        
        return _attack
    }
    
    var nextEvoText: String {
        
        if _nextEvoText == nil {
            
            _nextEvoText = ""
        }
        
        return _nextEvoText
    }
    
    var nextEvoName: String {
        
        if _nextEvoName == nil {
            
            _nextEvoName = ""
        }
        
        return _nextEvoName
    }
    
    var nextEvoLevel: String {
        
        if _nextEvoLevel == nil {
            
            _nextEvoLevel = ""
        }
        return _nextEvoLevel
    }
    
    var name: String {
        
        return _name
    }
    
    var pokedexId: Int {
        
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(closureCompleted: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let attack = dict["attack"] as? Int {
                    
                    self._attack = String(attack)
                }
                
                if let weight = dict["weight"] as? String {
                    
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    
                    self._height = height
                }
                
                if let defense = dict["defense"] as? Int {
                    
                    self._defense = String(defense)
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    
                    if let name = types[0]["name"] {
                        
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        
                        for x in 1..<types.count {
                            
                            if let name = types[x]["name"] {
                                
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                    
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
                    
                    if let url = descArr[0]["resource_uri"] {
                        
                        Alamofire.request("\(URL_BASE)\(url)").responseJSON(completionHandler: { (response) in
                            
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descDict["description"] as? String {
                                    
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "pokemon")
                                    
                                    self._description = newDescription
                                  
                                }
                            }
                            
                            closureCompleted()
                        })
                    }
                }
                
                if let evoArr = dict["evolutions"] as? [Dictionary<String, AnyObject>], evoArr.count > 0 {
                    
                    if let level = evoArr[0]["level"] as? Int {
                        
                        self._nextEvoLevel = String(level)
                    }
                    
                    if let newName = evoArr[0]["to"] as? String {
                        
                        self._nextEvoName = newName
                    }
                    
                    if let uri = evoArr[0]["resource_uri"] as? String {
                        
                        let alteredString = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                        
                        self._nextEvoPokedexID = alteredString.replacingOccurrences(of: "/", with: "")
                    }

                }
            }
            
            closureCompleted()
        }
    }
}
