//
//  Pokemon.swift
//  Pokemon
//
//  Created by Fray Pineda on 10/4/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import Foundation

class Pokemon {

    private var _name:String!
    private var _pokedexId: Int!
    
    var name : String{
        return _name
    }
    
    var pokedexId: Int{
        return _pokedexId
    }
    
    init(name: String, PokedexId: Int){
        self._name = name
        self._pokedexId = PokedexId
    }
}
