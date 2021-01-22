//
//  BuildingViewController.swift
//  ios-sdk-examples
//
//  Created by iMacbook on 1/27/21.
//  Copyright © 2021 IOT Link. All rights reserved.
//

import UIKit
import Map4dMap

class BuildingViewController: UIViewController {
  
  @IBOutlet weak var mapView: MFMapView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var removeButton: UIButton!
  var pois: [MFBuilding] = []
  var i = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Building"
    self.mapView.delegate = self
    self.mapView.enable3DMode(true)
    self.mapView.setBuildingsEnabled(false)
    mapView.moveCamera(MFCameraUpdate.setTarget(CLLocationCoordinate2D(latitude: 16.08795975082965, longitude: 108.22837829589844)))
    pois.append(draw(location: CLLocationCoordinate2D(latitude: 16.08795975082965, longitude: 108.22837829589844), title: "IOT"))
  }
  
  @IBAction func didTapAddBuilding(_ sender: Any) {
    
    let detal = Double.random(in: 0.0...0.0099999) - 0.0099999 / 2
    let detal1 = Double.random(in: 0.0...0.0099999) - 0.0099999 / 2
    i += 1
    removeButton.isHidden = false
    guard let target = mapView.camera?.target else {return}
    let location = CLLocationCoordinate2D(
      latitude: target.latitude + detal,
      longitude: target.longitude + detal1)
    mapView.moveCamera(MFCameraUpdate.setTarget(location))
    pois.append(draw(location: location, title: "BUILDING \(i)"))
  }
  
  @IBAction func didTapRemoveBuilding(_ sender: Any) {
    
    titleLabel.isHidden = true
    removeButton.isHidden = !(i != 0)
    guard i >= 0 else {
      return}
    pois[i].map = nil
    pois.remove(at: i)
    i -= 1
  }
  
  func draw(location: CLLocationCoordinate2D, title: String?) -> MFBuilding{
    let building = MFBuilding()
    building.position = location
    building.name = title
    building.model = "https://sw-hcm-1.vinadata.vn/v1/AUTH_d0ecabcbdcd74f6aa6ac9a5da528eb78/sdk/models/5b21d9a5cd18d02d045a5e99"
    building.texture = "https://sw-hcm-1.vinadata.vn/v1/AUTH_d0ecabcbdcd74f6aa6ac9a5da528eb78/sdk/textures/0cb35e1610c34e55946a7839356d8f66.jpg"
    building.map = mapView
    return building
  }
}

extension BuildingViewController: MFMapViewDelegate {
  func mapView(_ mapView: MFMapView!, didTapBuildingWithBuildingID buildingID: String!, name: String!, location: CLLocationCoordinate2D) {
    
  }
  
  func mapView(_ mapView: MFMapView!, didTap building: MFBuilding!) {
    titleLabel.isHidden = false
    titleLabel.text = "NAME: \(building.name ?? "")"
  }
}
