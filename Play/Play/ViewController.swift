//
//  ViewController.swift
//  Play
//
//  Created by admin on 06/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    //function to recenter the user
    @IBAction func userRecenter(_ sender: AnyObject) {
        let region = MKCoordinateRegionMakeWithDistance(self.manager.location!.coordinate, 400, 400) //Adding region to be set on the map
        self.mapView.setRegion(region, animated: true)
    }
    var manager = CLLocationManager()
    var update = 0 //to store the count of updates
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.manager.delegate = self
        
        // Checking the authorization status of the map, required for the app:
        if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse){
            self.mapView.showsUserLocation = true //this function shows the current location as blue stop on the map
            self.manager.startUpdatingLocation() //it will start to look for updates on the location
        }
        else {
            //Requesting authorization when not found:
            self.manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if update<4{ //to avoid update every second:
            let region = MKCoordinateRegionMakeWithDistance(self.manager.location!.coordinate, 400, 400) //Adding region to be set on the map
            self.mapView.setRegion(region, animated: true)
           update+=1
        }
        else{
           self.manager.stopUpdatingLocation()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

