//
//  MapVC.swift
//  AUCADriver
//
//  Created by ITLabAdmin on 6/26/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

class MapDriverVC: UIViewController {
    
    var map: GMSMapView!
    var mapManager: CLLocationManager!
    var driverLocation = CLLocationCoordinate2D()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    
    // An array to hold the list of likely places.
    var likelyPlaces: [GMSPlace] = []
    
    // The currently selected place.
    var selectedPlace: GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIOSMap()
        setupGoogleMaps()
        
    }
    
    func setupIOSMap() {
        mapManager = CLLocationManager()
        mapManager.delegate = self
        mapManager.desiredAccuracy = kCLLocationAccuracyBest
        mapManager.requestAlwaysAuthorization()
        mapManager.distanceFilter = 50
        mapManager.startUpdatingLocation()
        placesClient = GMSPlacesClient.shared()
       // map.showsUserLocation = true
    }
    
    func setupGoogleMaps() {
        let camera = GMSCameraPosition.camera(withLatitude: 42.8746, longitude: 74.5698, zoom: zoomLevel)
        
        map = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        map.settings.myLocationButton = true
        map.isMyLocationEnabled = true
        map.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(map)
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 42.856930, longitude: 74.610255)
        marker.title = "Vefa"
        marker.snippet = "Kyrgyzstan"
        marker.map = map
        
       addRoute()
    }
    
    //
    //TODO: add button to let driver put his route
    //TODO: let driver choose several locations and make a path from it
    //TODO: save this route path
    
    func addRoute() {
        let path = GMSMutablePath()
        path.add(CLLocationCoordinate2DMake(42.813687, 74.630261))
        path.add(CLLocationCoordinate2DMake(42.823718, 74.615222))
        path.add(CLLocationCoordinate2DMake(42.826338, 74.612437))
        
         path.add(CLLocationCoordinate2DMake(42.827853, 74.609949))
        path.add(CLLocationCoordinate2DMake(42.828406, 74.607210))
        path.add(CLLocationCoordinate2DMake(42.856930, 74.610255))
        let rect = GMSPolyline(path: path)
        rect.strokeWidth = 2.0
        rect.strokeColor = UIColor.blue
        rect.map = map
    }
    
}





extension MapDriverVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
       
        map.animate(to: camera)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
           // map.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways:
            print("Location status is OK.")
        case .authorizedWhenInUse:
            print("Location status is OK.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        mapManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
