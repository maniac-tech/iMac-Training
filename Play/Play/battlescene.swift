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
    let kPokemonCategory : UInt32 = 0x01 << 0
    let kPokeballCategory : UInt32 = 0x01 << 1
    let kEdgeCategory : UInt32 = 0x1 << 2
    
    //physicas variable setup
    var velocity : CGPoint = CGPoint.zero
    var touchpoint : CGPoint = CGPoint()
    var canThrowpokeball : Bool = false
    
    //other variables:
    var startCount = false
    var maxTime = 20
    var myTime = 20
    var pokemonCaught = false
    var timelabel = SKLabelNode(fontNamed: "Helvetica")
    
    //we have didLoad in any ViewController, but here we have a game scene 
    //and hence, we use the following function which checks if there was any movement in the current gamescene:
    
    
    
    public override func didMove(to view: SKView) {
        //print ("Gotta catch 'em all")
        //print(pokemon.name)
        
        //Background code:
        let battleBg = SKSpriteNode (imageNamed: "bggg")
        battleBg.size = self.size
        battleBg.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        battleBg.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        battleBg.zPosition = -1
        
        //adding the battle background to the scene:
        self.addChild(battleBg)
        
        self.makeMessageWith(imageName: "battle") //ADDING BATTLE TAG WHILE THE BATTLE STARTS
        
        //adding physics rules for the frame
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.categoryBitMask = kEdgeCategory
        
        //setting up of delegate for collison tasks:
        self.physicsWorld.contactDelegate = self
        
        self.perform(#selector(setupPokemon), with: nil, afterDelay: 2.0)
        self.perform(#selector(setuppPokeball), with: nil, afterDelay: 2.0)
        
        //Adding label to the UI
        self.timelabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.9)
        
        self.addChild(timelabel)
        
        self.startCount = true
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
        
        //setup fo physics for pokemon
        self.pokemonSprite.physicsBody = SKPhysicsBody(rectangleOf: kPokemonSize)
        self.pokemonSprite.physicsBody?.affectedByGravity = false
        self.pokemonSprite.physicsBody?.isDynamic = false
        self.pokemonSprite.physicsBody?.mass = 1
        
        //adding bitmasks
        self.pokemonSprite.physicsBody?.categoryBitMask = kPokemonCategory
        self.pokemonSprite.physicsBody?.collisionBitMask = kEdgeCategory
        self.pokemonSprite.physicsBody?.contactTestBitMask = kPokeballCategory
        
        
        //Adding the pokemon to BattleScene
        self.addChild(pokemonSprite)
        
    }
    
    func setuppPokeball(){
        self.pokeballSprite = SKSpriteNode(imageNamed: "pokeball")
        self.pokeballSprite.size = kPokeballSize
        self.pokeballSprite.position = CGPoint(x: self.size.width/2, y: 55)
        
        self.pokeballSprite.zPosition = 0

        //setup of physics for pokeball:
        self.pokeballSprite.physicsBody = SKPhysicsBody(circleOfRadius: pokeballSprite.size.width/2)
        self.pokeballSprite.physicsBody?.affectedByGravity = true
        self.pokeballSprite.physicsBody?.isDynamic = true
        self.pokeballSprite.physicsBody?.mass = 0.5
        
        //adding bitmasks
        self.pokeballSprite.physicsBody?.categoryBitMask = kPokeballCategory
        self.pokeballSprite.physicsBody?.collisionBitMask = kPokemonCategory | kEdgeCategory
        self.pokeballSprite.physicsBody?.contactTestBitMask = kPokemonCategory
        
        //Adding the pokeball to BattleScene
        self.addChild(pokeballSprite)
    }
    
    //the following three functions are interlinked:
    // i) touchesBegan
    // ii) touchesEnded
    // iii) throwPokeball
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.canThrowpokeball = true
        let touch = touches.first
        let location = touch?.location(in: self)
        
        if self.pokeballSprite.frame.contains(location!){
            self.canThrowpokeball = true
            
        }
    }

    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let location = touch?.location(in: self)
            
        self.touchpoint = location!
        if self.canThrowpokeball {
                throwPokeball()
        }
    }

    func throwPokeball (){
        //all the physics will be added in here, related to throwing the pokeball onto the pokemon
        
        self.canThrowpokeball = false
        let dt : CGFloat = 1.0/50
        let distance = CGVector(dx: self.touchpoint.x - self.pokeballSprite.position.x, dy: self.touchpoint.y - self.pokeballSprite.position.y)
        
        let velocity = CGVector(dx: distance.dx/dt, dy: distance.dy/dt)
        self.pokeballSprite.physicsBody?.velocity = velocity
    }
    
    public func didBegin(_ contact: SKPhysicsContact) {
        let contactmASK = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactmASK{
        case kPokemonCategory | kPokeballCategory :
            print ("Pokemon has been caught!")
            self.pokemonCaught = true
            endGame()
            
        default:
            return
            
        }
    }
    
    
    public override func update(_ currentTime: TimeInterval) {
        if self.startCount{
            self.maxTime = Int(currentTime) + self.maxTime
            self.startCount = false
        }
        self.myTime = self.maxTime  - Int(currentTime)
        self.timelabel.text = "\(self.myTime)"
        
        if self.myTime <= 0 {
            endGame()
        }
    }
    
    func endGame (){
        //after the game has ended, we need to remove the nodes:
        self.pokeballSprite.removeFromParent()
        self.pokemonSprite.removeFromParent()
        
        if self.pokemonCaught {
            
            self.makeMessageWith(imageName: "gotcha")
            self.pokemon.timesCount += 1
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        else {
            self.makeMessageWith(imageName: "footprints")
        }
        self.perform(#selector(endBattle), with: nil, afterDelay: 3.0)
    }
    
    func endBattle (){
        NotificationCenter.default.post(name: NSNotification.Name("CloserBattle"), object: nil)
    }
    
    func makeMessageWith (imageName: String){
        let message = SKSpriteNode (imageNamed: imageName)
        message.size = CGSize(width: 150, height: 150)
        message.position = CGPoint (x: self.size.width/2, y: self.size.height/2)
        
        message.run(SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.removeFromParent()]))
        
        self.addChild(message)
    }
    
}
