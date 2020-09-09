//
//  DelegateViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import Map4dMap

class DelegateViewController: UIViewController {
  
  @IBOutlet weak var lb2D3D: UIButton!
  @IBOutlet weak var map4d: MFMapView!
  
  @IBOutlet weak var lbContent: UILabel!
  @IBOutlet weak var tvNotice: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Delegate"
    
    // Set Switch Mode
    // Auto switch 3D when zoom >= 17
    map4d.switchMode = MFSwitchMode.auto
    
    // Delegate
    map4d.delegate = self
    
    // Move To Camera
    let camera = MFCameraPosition(target: CLLocationCoordinate2DMake(16.060166,108.222713), zoom: 14)
    map4d.moveCamera(MFCameraUpdate.setCamera(camera))
    
    // Enable My Location
    map4d.setMyLocationEnabled(true)
  }
  
  @IBAction func switchMode(_ sender: Any) {
    let isSwitchMode = !map4d.is3DMode()
    map4d.enable3DMode(isSwitchMode)
  }
  
}

extension DelegateViewController: MFMapViewDelegate {
  
  func mapView(_ mapView: MFMapView!, willMove gesture: Bool) {
    tvNotice.text = "delegate will mode"
  }
  func mapView(_ mapView: MFMapView!, didTap building: MFBuilding!) {
    tvNotice.text = "delegate tap object: \(building.name ?? "")"
  }
  func mapView(_ mapView: MFMapView!, didTapMyLocation location: CLLocationCoordinate2D) {
    tvNotice.text = "delegate tap on my location "
  }
  func mapView(_ mapView: MFMapView!, onModeChange is3dMode: Bool) {
    if (is3dMode){
      lb2D3D.setTitle("2D Mode", for: .normal)
    } else {
      lb2D3D.setTitle("3D Mode", for: .normal)
    }
  }
  func mapView(_ mapView: MFMapView!, idleAt position: MFCameraPosition!) {
    tvNotice.text = "delegate idle At"
  }
  func mapView(_ mapView: MFMapView!, moving position: MFCameraPosition!) {
    tvNotice.text = "delegate moving"
  }
  func mapView(_ mapView: MFMapView!, didChange position: MFCameraPosition!) {
    lbContent.text = "Did change camera zoom=" + String(position.zoom) + " bearing = " + String(position.bearing) + " tilt= " + String(position.tilt)
    
  }
  func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
    tvNotice.text = "map click: " + String(coordinate.latitude) + "," + String(coordinate.longitude)
  }
  
  func didTapMyLocationButton(for mapView: MFMapView!) -> Bool {
    lbContent.text = "tap button my location"
    return false
  }
  
}
