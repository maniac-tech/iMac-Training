//
//  CDHelper.swift
//  Play
//
//  Created by admin on 06/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func makeAllPokemons(){
    makePokemon(name: "Abra", withThe: "abra")
    makePokemon(name: "Pikachu", withThe: "pikachu-2")
    makePokemon(name: "Psyduck", withThe: "psyduck")
    makePokemon(name: "Jigglypuff", withThe: "jigglypuff")
    makePokemon(name: "Bullbasaur", withThe: "bullbasaur")
    
}

func makePokemon(name : String, withThe image : String){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let pokemon = Pokemon(context:context)
    pokemon.name = name
    pokemon.imageFileName = image
}
