//
//  cellvIEW.swift
//  videoManager
//
//  Created by admin on 05/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit

class cellvIEW: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI (_cellModel : cellModel){
        videoTitle.text = _cellModel.videoTitle
        
        //add the code to download images
        let url = URL (string : _cellModel.imageURL)
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url!)
                //dispatching the URL
                DispatchQueue.global().sync {
                    self.videoImage.image = UIImage(data: data)
                }
            }
            catch{
                print ("Error!")
            }
        }
    }

}
