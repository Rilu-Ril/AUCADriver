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

class MapDriverVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 42.8746, longitude: 74.5698, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 42.8746, longitude: 74.5698)
        marker.title = "Bishkek"
        marker.snippet = "Kyrgyzstan"
        marker.map = mapView
        
    }

}
extension MapDriverVC: CLLocationManagerDelegate {
    
}
