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
    }
}
