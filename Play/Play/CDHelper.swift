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
    makePokemon(name: "Meowth", withThe: "meowth")
    makePokemon(name: "Eevee", withThe: "eevee")
    makePokemon(name: "Squirtle", withThe: "squirtle")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func makePokemon(name : String, withThe image : String){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let pokemon = Pokemon(context:context)
    pokemon.name = name
    pokemon.imageFileName = image
}

func bringAllPokemon() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    do{
        let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon] //creating an array of Pokemons

        if pokemons.count == 0 {
            makeAllPokemons()
            return bringAllPokemon()
        }
        else{
            return pokemons
        }
    } catch{
        print ("Error")
    }
    return []
}

func getAllCaughtPokemon() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon> //NSFetchRequest <type>
    fetchRequest.predicate = NSPredicate(format: "timesCount > %d", 0) //fetch the request and validate if it is greater than 0
    
    do{
     let pokemons = try context.fetch(fetchRequest) as [Pokemon]
     return pokemons
    }catch {
        print ("Error")
    }
    return []
}

func getAllUncaughtPokemon() -> [Pokemon]{
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    fetchRequest.predicate = NSPredicate(format: "timesCount == %d", 0)
    
    do{
        let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        return pokemons
    }catch {
        print ("Error")
    }
    return []
}
