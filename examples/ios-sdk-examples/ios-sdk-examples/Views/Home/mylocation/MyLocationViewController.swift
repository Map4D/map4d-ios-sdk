//
//  MyLocationViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import map4dsdk

class MyLocationViewController: UIViewController {
  @IBOutlet weak var tvMyLocation: UILabel!
  
  @IBOutlet weak var lbBtnMyLocation: UIButton!
  @IBOutlet weak var map4d: MFMapView!
  var isEnableMyLocation = false
  
  override func viewDidLoad() {
        super.viewDidLoad()
      self.navigationItem.title = "My Location"
      // Enable My Location
      map4d.setMyLocationEnabled(true)
    
      // Set Delegate
      map4d.delegate = self
    }
    
  @IBAction func disableMyLocation(_ sender: Any) {
    isEnableMyLocation = !isEnableMyLocation
    if (isEnableMyLocation){
      lbBtnMyLocation.setTitle("Enable My Location", for: .normal)
      map4d.setMyLocationEnabled(false)
    } else {
      lbBtnMyLocation.setTitle("Diable My Location", for: .normal)
      map4d.setMyLocationEnabled(true)
    }
  }
  
}

extension MyLocationViewController: MFMapViewDelegate {
  
  func mapView(_ mapView: MFMapView!, didTapMyLocation location: CLLocationCoordinate2D) {
    tvMyLocation.text = "Tap on my location: " + String(location.latitude) + "," + String(location.longitude)
  }
  
  func didTapMyLocationButton(for mapView: MFMapView!) -> Bool {
    tvMyLocation.text = "Tap on button my location "
    // return false if you want to use default, fly to my location
    // return true if you want to custom this method
    return false
  }
  
  func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
    tvMyLocation.text = "Map clicked: " + String(coordinate.latitude) + " , " + String(coordinate.longitude)
  }
  
}
