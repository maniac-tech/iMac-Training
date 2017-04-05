//
//  ViewController.swift
//  videoManager
//
//  Created by admin on 05/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tablevIEW: UITableView!
    
    var items = [cellModel]() //created an array
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        performSegue(withIdentifier: "segue", sender:item )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC{
            if let singleitem = sender as? cellModel{
                destination.item = singleitem
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if let cell = tablevIEW.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? cellvIEW {
            let item = items[indexPath.row]
            cell.updateUI(_cellModel : item)
            return cell
            
        }
        else{
            return UITableViewCell()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablevIEW.delegate=self; // assigning the current view
        tablevIEW.dataSource=self;
        
        //HARDCODED THE VIDEO DETAILS FOR #1
        let p1 = cellModel(imageURL: "https://i.ytimg.com/vi/ztnfN1ONcos/hqdefault.jpg?custom=true&w=246&h=138&stc=true&jpg444=true&jpgq=90&sp=68&bri=0.3&sigh=x9_IlgZng7MI8dBPQoguVMii4ZU", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ztnfN1ONcos\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Marvel's Iron Man 3 JARVIS Second Screen App Review")
        
        let p2 = cellModel(imageURL: "https://i.ytimg.com/vi/g4M2QQPatoU/hqdefault.jpg?custom=true&w=246&h=138&stc=true&jpg444=true&jpgq=90&sp=68&bri=0.3&sigh=0i7YNAAdbl-Ph7P8l7KseNm-9Q0", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/g4M2QQPatoU\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Iron Man Suits Up (and other favourite scenes) | J.A.R.V.I.S.")
        
        let p3 = cellModel(imageURL: "https://i.ytimg.com/vi/7LLbqGRQPc4/hqdefault.jpg?custom=true&w=246&h=138&stc=true&jpg444=true&jpgq=90&sp=68&bri=0.3&sigh=g4fkQ9aEIl_wvFXNre10EitDE78", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7LLbqGRQPc4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Mark Zuckerberg's JARVIS is Amazing!")
        let p4 = cellModel(imageURL: "https://i.ytimg.com/vi/Wx7RCJvoCMc/hqdefault.jpg?custom=true&w=246&h=138&stc=true&jpg444=true&jpgq=90&sp=68&bri=0.3&sigh=WBneNm0WeKTxK-iTBN7WbkpvrlA", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Wx7RCJvoCMc\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Jarvis iterface and voice")
        let p5 = cellModel(imageURL: "https://i.ytimg.com/vi/gIpAj9BRrfE/hqdefault.jpg?custom=true&w=246&h=138&stc=true&jpg444=true&jpgq=90&sp=68&bri=0.3&sigh=v4JCgmQz88143UB3fOXBhFVna60", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gIpAj9BRrfE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle:"Ultron Destroys Jarvis | Avengers Age of Ultron (2015) | 4K ULTRA HD" )
        
        items.append(p1)
        items.append(p2)
        items.append(p3)
        items.append(p4)
        items.append(p5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

