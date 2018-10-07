//
//  Pokemon.swift
//  Pokemon
//
//  Created by Fray Pineda on 10/4/18.
//  Copyright © 2018 Fray Pineda. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {

    private var _name:String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    private var _nextEvolutionName: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLevel: String!
    
    var description: String{
        if _description == nil{
            _description = ""
        }
        return _description
    }
    var type: String{
        if _type == nil{
            _type = ""
        }
        return _type
    }
    var defense: String{
        if _defense == nil{
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
    var weight: String{
        if _weight == nil{
            _weight = ""
        }
        return _weight
    }
    
    var attack : String {
        if _attack == nil{
            _attack=""
        }
        return _attack
    }
    var nextEvolutionText: String {
        if _nextEvolutionTxt == nil{
            _nextEvolutionTxt = ""
        }
        return _nextEvolutionTxt
    }
    var name : String{
        return _name
    }
    
    var pokedexId: Int{
        return _pokedexId
    }
    
    init(name: String, PokedexId: Int){
        self._name = name
        self._pokedexId = PokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete){
        
        Alamofire.request(_pokemonURL, method: .get).responseJSON {(response) in
            
            if let dict = response.result.value as? Dictionary<String, Any>{
                if let weight = dict["weight"] as? Int{
                    self._weight = "\(weight)"
                }
                
                if let height = dict["height"] as? Int{
                    self._height = "\(height)"
                }
                if let attack = dict["attack"] as? Int{
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                if let types = dict["types"] as? [Dictionary<String, Any>] , types.count > 0{
                    if let arrayTipo = types[0]["type"] as? Dictionary<String, String>{
                        if let name = arrayTipo["name"]{
                            self._type = name.capitalized
                        }
                    }
                    if types.count > 1 {
                        for x in 1..<types.count{
                            if let tipox = types[x]["type"] as? Dictionary<String, String>, tipox.count > 0{
                                if let name = tipox["name"] {
                                    self._type! += "/\(name.capitalized)"
                                }
                            }
                        }
                    }
                    
                    print("#########\(self._type)")
                }else {
                    self._type = ""
                    print("#########nada\(self._type)")
                }
            }
            completed()
        }
    }
}
