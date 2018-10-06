//
//  PokemonDetailVC.swift
//  Pokemon
//
//  Created by Fray Pineda on 10/5/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
    }

  
    

    

}
