//
//  PolylineViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import Map4dMap

class PolylineViewController: UIViewController {
  
  @IBOutlet weak var labelHide: UIButton!
  @IBOutlet weak var tvNotice: UILabel!
  @IBOutlet weak var map4d: MFMapView!
  var polyline: MFPolyline?
  var isAddPolyline = false
  var pathPolyline = MFMutablePath()
  var sizePath = 4;
  var isInitPolyline = false
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Polyline"
    initData()
    addPolyline()
    map4d.delegate = self
  }
  func initData(){
    if (!isInitPolyline){
      pathPolyline.removeAllCoordinates()
      pathPolyline.add(CLLocationCoordinate2DMake(16.061583,108.234463))
      pathPolyline.add(CLLocationCoordinate2DMake(16.038148,108.243031))
      pathPolyline.add(CLLocationCoordinate2DMake(16.032951,108.224449))
      pathPolyline.add(CLLocationCoordinate2DMake(16.031512,108.208902))
      sizePath = 4
      isInitPolyline = true
    }
  }
  func addPolyline(){
    if (sizePath < 4){
      isInitPolyline = false
      if (isAddPolyline){
        polyline?.map = nil
        isAddPolyline = false
      }
      initData()
    }
    if (!isAddPolyline){
      // Move Camera To Polyline Position Before Draw
      let bounds = MFCoordinateBounds().includingPath(pathPolyline)
      let cameraUpdate = MFCameraUpdate.fit(bounds)
      map4d.moveCamera(cameraUpdate)
      
      // Init Polyline
      polyline = MFPolyline()
      polyline?.path = pathPolyline
      polyline?.color = .blue
      polyline?.width = 4
      polyline?.map = map4d
      
      isAddPolyline = true
    }
  }
  
  func removePolyline(){
    polyline?.map = nil
    isAddPolyline = false
  }
  
  
  @IBAction func addPolyline(_ sender: Any) {
    addPolyline()
  }
  
  @IBAction func removePolyline(_ sender: Any) {
    removePolyline()
  }
  
  @IBAction func updatePolyline(_ sender: Any) {
    if (!isAddPolyline){
      addPolyline()
    }
    polyline?.color = .red
    polyline?.width = 10
    // Remove last coordinate
    if (sizePath > 1){
      sizePath-=1;
      pathPolyline.removeLastCoordinate()
    } else {
      isInitPolyline = false
      initData()
    }
    polyline?.path = pathPolyline
  }
  
  
  @IBAction func hideAndShowPolyline(_ sender: Any) {
    polyline?.isHidden = !(polyline?.isHidden)!
    if ((polyline?.isHidden)!){
      labelHide.setTitle("hide", for: .normal)
    } else {
      labelHide.setTitle("show", for: .normal)
    }
  }
  
}


extension PolylineViewController: MFMapViewDelegate {
  
  func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!) {
    tvNotice.text = "Polyline clicked Id= " + String(polyline.id)
  }
  func mapView(_ mapView: MFMapView!, idleAt position: MFCameraPosition!) {
    NSLog("lat lng:  (" + String(position.target.latitude) + " , " + String(position.target.longitude) + ") ")
    NSLog("zoom :  " + String(position.zoom))
  }
  func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
    tvNotice.text = "Map clicked: " + String(coordinate.latitude) + " , " + String(coordinate.longitude)
  }
}
