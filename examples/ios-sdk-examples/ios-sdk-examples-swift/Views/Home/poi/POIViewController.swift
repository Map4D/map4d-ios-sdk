//
//  POIViewController.swift
//  ios-sdk-examples
//
//  Created by iMacbook on 1/27/21.
//  Copyright © 2021 iot. All rights reserved.
//

import UIKit
import Map4dMap

class POIViewController: UIViewController {
  
  @IBOutlet weak var mapView: MFMapView!
  @IBOutlet weak var removePOIButton: UIButton!
  @IBOutlet weak var titleLabel: UILabel!
  var pois: [MFPOI] = []
  var i = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.setPOIsEnabled(false)
    self.navigationItem.title = "POI"
    mapView.delegate = self
    guard let location = mapView.camera?.target else {return}
    pois.append(draw(location: location, title: "Map4D", type: "point"))
    
  }
  
  @IBAction func didTapAddPOI(_ sender: Any) {
    let detal = Double.random(in: 0.0...0.0099999) - 0.0099999 / 2
    let detal1 = Double.random(in: 0.0...0.0099999) - 0.0099999 / 2
    let types = ["cafe", "atm", "point"]
    let type = types[Int.random(in: 0...2)]
    i += 1
    removePOIButton.isHidden = false
    guard let location = mapView.camera?.target else {return}
    
    pois.append(draw(location: CLLocationCoordinate2D(
          latitude: location.latitude + detal,
          longitude: location.longitude + detal1), title: "POI\(i)", type: type))
  }
  
  @IBAction func didTapRemovePOI(_ sender: Any) {
    removePOIButton.isHidden = !(i != 0)
    guard i >= 0 else {return}
    pois[i].map = nil
    pois.remove(at: i)
    i -= 1
  }
  
  func draw(location: CLLocationCoordinate2D, title: String?, type: String?) -> MFPOI{
    let poi = MFPOI()
    poi.position = location
    print(location)
    poi.title = title
    poi.zIndex = 2
    poi.type = type
    poi.titleColor = .red
    poi.map = mapView
    return poi
  }
  
}
extension POIViewController: MFMapViewDelegate {
  func mapView(_ mapView: MFMapView!, didTapPOIWithPlaceID placeID: String!, name: String!, location: CLLocationCoordinate2D) {
    titleLabel.isHidden = false
    titleLabel?.text = "ID: \(placeID ?? "") NAME: \(name ?? "")"
  }
  func mapView(_ mapView: MFMapView!, didTap poi: MFPOI!) {
    titleLabel.isHidden = false
    titleLabel?.text = "ID: \(poi.id) NAME: \(poi.title ?? "")"
  }
}
