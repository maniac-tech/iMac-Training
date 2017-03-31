//
//  ViewController.swift
//  lost-and-found
//
//  Created by admin on 31/03/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit
import MapKit //to use MapKitView
import CoreLocation //to use Core location

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    //MKMapViewDelegate: used to only display the map contents
    //CLLocationManagerDelegate: to use Core library of location
    
    @IBOutlet weak var lattitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var attitude: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    var locationManagingVar = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //locationManager function:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

