//
//  battlescene.swift
//  Play
//
//  Created by admin on 07/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

//this file will work with the game scene

import UIKit
import SpriteKit

public class battlescene : SKScene, SKPhysicsContactDelegate{
    var pokemon : Pokemon!
    var pokemonSprite : SKSpriteNode!
    var pokeballSprite : SKSpriteNode!
    
    //defining constants
    let kPokemonSize = CGSize(width : 100, height : 100)
    let kPokeballSize = CGSize(width : 100, height : 100)
    
    //define bitCategories
    
    //physicas variable setup
    
    //we have didLoad in any ViewController, but here we have a game scene 
    //and hence, we use the following function which checks if there was any movement in the current gamescene:
    
    public override func didMove(to view: SKView) {
        print ("Gotta catch 'em all")
        //print(pokemon.name)
        
        //Background code:
        let battleBg = SKSpriteNode (imageNamed: "bggg")
        battleBg.size = self.size
        battleBg.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        battleBg.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        battleBg.zPosition = -1
        
        //adding the battle background to the scene:
        self.addChild(battleBg)
        
        self.perform(#selector(setupPokemon), with: nil, afterDelay: 2.0)
        self.perform(#selector(setuppPokeball), with: nil, afterDelay: 2.0)
    }
    
    
    //setting up pokemon and pokeball separately to avoid complexity in reading and understanding the code snippet while debugging
    func setupPokemon(){
        self.pokemonSprite = SKSpriteNode(imageNamed: pokemon.imageFileName!)
        self.pokemonSprite.size = kPokemonSize
        self.pokemonSprite.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        
        self.pokemonSprite.zPosition = 0
        
        //adding physics i.e.movement to the pokemon:
        let moveRight = SKAction.moveBy(x:100 , y: 0, duration: 3.0)
        let sequence = SKAction.sequence([moveRight,moveRight.reversed(),moveRight.reversed(),moveRight])
        
        //Adding sequence action to the pokemon
        self.pokemonSprite.run(SKAction.repeatForever(sequence))
        
        
        //Adding the pokemon to BattleScene
        self.addChild(pokemonSprite)
        
    }
    
    func setuppPokeball(){
        self.pokeballSprite = SKSpriteNode(imageNamed: "pokeball")
        self.pokeballSprite.size = kPokeballSize
        self.pokeballSprite.position = CGPoint(x: self.size.width/2, y: 55)
        
        self.pokeballSprite.zPosition = 0
        
        //Adding the pokeball to BattleScene
        self.addChild(pokeballSprite)
    }
    
}
