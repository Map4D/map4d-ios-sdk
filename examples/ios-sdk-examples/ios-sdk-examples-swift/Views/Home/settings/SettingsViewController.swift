//
//  SettingsViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import Map4dMap

class SettingsViewController: UIViewController {
  @IBOutlet weak var tvX: UILabel!
  @IBOutlet weak var tvY: UILabel!
  @IBOutlet weak var tvTime: UILabel!
  var isTimeMapSwitch = false
  @IBOutlet weak var map4d: MFMapView!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Map Setting"
    
    // Move camera To
    // Han River Bridge in Da Nang
    let camera = MFCameraPosition(target: CLLocationCoordinate2DMake(16.070662,108.224940), zoom:  16)
    map4d.moveCamera(MFCameraUpdate.setCamera(camera))
    
    // set MinZoom, maxZoom
    map4d.setMinZoom(3, maxZoom: 20)
    
    // setMax Native Zoom
    map4d.setMaxNativeZoom(18)
    
    // setMode = 3D, minZoom = 17
    map4d.enable3DMode(true)
    
    // set Mode = 2D
    // map4d.enable3dMode(false)
    
    // Enable delegate
    map4d.delegate = self
    
  }
  
  @IBAction func btnSetTimeMap(_ sender: Any) {
    isTimeMapSwitch = !isTimeMapSwitch
    // Bitexco geometry
    let camera = MFCameraPosition.init(target: CLLocationCoordinate2DMake(10.771767,106.704515), zoom: 17, tilt: (map4d.camera?.tilt)!, bearing: (map4d.camera?.bearing)!)
    tvX.isHidden = true
    tvY.isHidden = true
    tvTime.isHidden = false
    map4d.moveCamera(MFCameraUpdate.setCamera(camera))
    if (isTimeMapSwitch){
      let isoDate = "1900-04-14T10:44:00+0000"
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      let date = dateFormatter.date(from: isoDate)!
      map4d.setTime(date)
      tvTime.text = isoDate
    } else {
      let isoDate = "2020-04-14T10:44:00+0000"
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      let date = dateFormatter.date(from: isoDate)!
      map4d.setTime(date)
      tvTime.text = isoDate
      // get current mode
      let is3DMode = map4d.is3DMode()
      // return true if 3D, false if 2D Mode
    }
  }
  
}

extension SettingsViewController: MFMapViewDelegate {
  // Tap on screen
  public func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
    // Use projection map
    // Convert Coordinate To Screen Coordinate
    let screenCoordinate = mapView.projection?.point(for: coordinate)
    // Set UILabel
    
    tvX.isHidden = false
    tvY.isHidden = false
    tvTime.isHidden = true
    tvX.text = screenCoordinate?.x.description
    tvY.text = screenCoordinate?.y.description
    
    // Convert screenCoordinate to LatLng
    let invertToLatLng = mapView.projection?.coordinate(for: screenCoordinate!)
    NSLog(" latLng = (%lf, %lf)", (invertToLatLng?.latitude)!, (invertToLatLng?.longitude)!)
    
  }
  
}
