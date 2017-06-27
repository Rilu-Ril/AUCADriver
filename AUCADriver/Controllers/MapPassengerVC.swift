//
//  MapPassengerVC.swift
//  AUCADriver
//
//  Created by ITLabAdmin on 6/26/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapPassengerVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var txtAddress: UITextView!
    
    var locationManager: CLLocationManager!
    var previousAddress: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
        
        
    }

    @IBAction func request(_ sender: UIButton) {
        //make a request
    }
    
}
