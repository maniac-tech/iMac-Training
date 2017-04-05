//
//  cellModel.swift
//  videoManager
//
//  Created by admin on 05/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import Foundation
class cellModel{
    private var _imageURL : String  //DECLARING a private variable to store a value of imageurl
    private var _videoTitle : String
    private var _videoURL : String
    
    var imageURL : String {
        return _imageURL
    }
    
    var videoTitle : String {
        return _videoTitle
    }
    
    var videoURL : String {
        return _videoURL
    }
    
    init (imageURL : String, videoURL : String , videoTitle : String){
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
}
