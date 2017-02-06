//
//  ViewController.swift
//  Pokedex
//
//  Created by spencerdezartsmith on 2/3/17.
//  Copyright © 2017 spencerdezartsmith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collection: UICollectionView!
    
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
        parsePokemonCSV()
    }
    
    func parsePokemonCSV() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                
                let newPoke = Pokemon(name: row["identifier"]!, pokedexId: Int(row["id"]!)!)
                
                pokemon.append(newPoke)
                
            }
            
        } catch let error as NSError {
            
            print(error.debugDescription)
        }
        
        
    }

    // Dequeue the cell and sets up new ones
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // The below function loads only how many cells that are going to be displayed at a time
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let poke = pokemon[indexPath.row]
            
            cell.configureCell(poke)
            
            return cell
            
        } else {
            
            return UICollectionViewCell()
            
        }

    }
    
    // Gives instruction of how to act when one is selected
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    }
    
    // Sets the number of items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    
    // Sets the number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Sets the size of each item in the collection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }


}

