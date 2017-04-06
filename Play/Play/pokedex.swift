//
//  pokedex.swift
//  Play
//
//  Created by admin on 06/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit

class pokedex: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBAction func mapBackButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil) // to get back to the previous screen
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //this function to hide the status bar of the phone
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Table Functions
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Int()
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        return UITableViewCell()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
