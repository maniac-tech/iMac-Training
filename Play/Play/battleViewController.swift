//
//  battleViewController.swift
//  Play
//
//  Created by admin on 07/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit
import SpriteKit

class battleViewController: UIViewController {

    var pokemon : Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //we are initialzing the scene here with its dimensions:
        let scene = battlescene(size: CGSize(width:self.view.frame.size.width, height: self.view.frame.size.height))
        
        self.view = SKView() //setting the current view to SKview
        
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        
        skView.presentScene(scene) //loading the battlescene into the ViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
