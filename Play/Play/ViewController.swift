//
//  ViewController.swift
//  Play
//
//  Created by admin on 06/04/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var pokemon : [Pokemon] = []

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
        self.mapView.delegate = self
        self.manager.startUpdatingLocation()
        
        pokemon = bringAllPokemon() //FILLING THE POKEMON ARRAY, WHICH ARE GENERATED FROM THE CORE DATA
        
        // Checking the authorization status of the map, required for the app:
        if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse){
            self.mapView.showsUserLocation = true //this function shows the current location as blue stop on the map
            self.manager.startUpdatingLocation() //it will start to look for updates on the location
            //defining the timer to spawn the pokemon after a particular value:
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block:{
                (timer) in
            
                //extrating the current coordinate
                if let coordinate = self.manager.location?.coordinate{//defined this to provide value to annotations
                    
                    let randompokemon = Int (arc4random_uniform(UInt32(self.pokemon.count)))
                    let pokemon = self.pokemon[randompokemon]
                    
                    let annotation = PokemonAnnotation(coordinate: coordinate, pokemon: pokemon)
                    annotation.coordinate = coordinate
                    //ADDING THE EQUATION BELOW:
                    annotation.coordinate.latitude += (Double (arc4random_uniform(1000))-500)/300000.0
                    annotation.coordinate.longitude += (Double (arc4random_uniform(1000))-500)/300000.0
                    
                    self.mapView.addAnnotation(annotation)
                }
                }
            )
        }
        else {
            //Requesting authorization when not found:
            self.manager.requestWhenInUseAuthorization()
        }
    }
    
    //function to add image to the annotation:
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        //if-else condition check to decide whether it is user's location or not
        if annotation is MKUserLocation {
            annotationView.image = #imageLiteral(resourceName: "player.png")
        }
        else{
            let pokemon = (annotation as! PokemonAnnotation).pokemon
            annotationView.image = UIImage(named: pokemon.imageFileName!)
        }
        
        //the image size maybe be larger than the screen, thus we need to adjust it into the screen by resizing it in the frame
        var frame = annotationView.frame
        frame.size.width = 40
        frame.size.height = 40
        annotationView.frame = frame
        
        return annotationView
    }
    
    //onclick action on the annotation:
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //we write didselect becasue we are implementing a click action, where click = select + deselect:
        mapView.deselectAnnotation(view.annotation!, animated: true)
        
        if view.annotation is MKUserLocation{
            return
        }
        
        //we need to set the annotation's region when the user clicks the respective annotation:
        let region = MKCoordinateRegionMakeWithDistance((view.annotation?.coordinate)!, 150, 150)
        self.mapView.setRegion(region, animated: true)
        
        if let coordinate = self.manager.location?.coordinate{
            if MKMapRectContainsPoint(mapView.visibleMapRect, MKMapPointForCoordinate(coordinate)){
                let battle = battleViewController ()
                
                let pokemon = (view.annotation as! PokemonAnnotation).pokemon //passing value of pokemon from the annotation class to the var here
                
                battle.pokemon = pokemon
                self.present(battle, animated: true, completion: nil)
                print("In Range")
            }
            else{
                print("Out of Range")
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //to avoid update every second:
        if update<4{
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

