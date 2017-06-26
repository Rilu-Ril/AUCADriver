//
//  MapVC.swift
//  AUCADriver
//
//  Created by ITLabAdmin on 6/26/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit
import MapKit

class MapDriverVC: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    var mapManager: CLLocationManager!
    var driverLocation = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapManager = CLLocationManager()
        mapManager.delegate = self
        mapManager.desiredAccuracy = kCLLocationAccuracyBest
        mapManager.requestWhenInUseAuthorization()
        mapManager.startUpdatingLocation()
        map.showsUserLocation = true
    }

}
extension MapDriverVC: CLLocationManagerDelegate {
    
}
