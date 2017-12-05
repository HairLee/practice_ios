//
//  MapViewController.swift
//  AmBi
//pod 'RealmSwift'
//pod 'GoogleMaps'
//pod 'GooglePlaces'
//  Created by Dreamup on 10/26/17.
//  Copyright © 2017 Dreamup. All rights reserved.
//

import UIKit
import RealmSwift
import CoreLocation
import MapKit
class MapViewController: BaseViewController, CLLocationManagerDelegate {

    
    
    
    @IBOutlet weak var navigationView: BaseHeaderUIView!
    
    @IBOutlet var headerDistance: NSLayoutConstraint!
    
    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet var topDistance: NSLayoutConstraint!
    
    
    var manager = CLLocationManager()
    var isFromTab3 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.navigationController?.isNavigationBarHidden = true
        
        if isFromTab3 {
             topDistance.constant = 0
             headerDistance.constant = 0
        }
        print("Go to MapViewController viewDidLoad")
      
        
    }
    
    func hideBar(){
         isFromTab3 = true
    }
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        let initial = CLLocation(latitude: 21.028511 , longitude: 105.804817) // not used
        createMap(location: initial)
    }
    
    
    let regionRadius: CLLocationDistance = 1000
    func createMap(location: CLLocation){
        
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
        let coor = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        mapView.setRegion(coor, animated: true)
        
        
    }
    
    @IBAction func btnGoToCurrentLocation(_ sender: Any) {
        
        // get Current Coor
        let currentLocation: CLLocationCoordinate2D = (manager.location?.coordinate)!
      
        
        // make maker
        let maker = MKPointAnnotation()
        maker.coordinate = CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
        

        //
        let coor = MKCoordinateRegionMakeWithDistance(currentLocation, regionRadius, regionRadius)
        mapView.setRegion(coor, animated: true)
        mapView.addAnnotation(maker)
        
        
    }

    override func doAutoLogin() {
        
        navigationView.backAction = {
            self.navigationController?.popViewController(animated: true)

        }
        
    }

}
