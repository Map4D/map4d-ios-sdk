//
//  PolygonViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import map4dsdk

class PolygonViewController: UIViewController {
  @IBOutlet weak var lbTitle: UILabel!
  
  @IBOutlet weak var lbHide: UIButton!
  @IBOutlet weak var map4d: MFMapView!
  var pathPolygon = MFMutablePath.init()
  var hole = MFMutablePath.init()
  var isInitPolygon = false
  var polygon: MFPolygon?
  var isAddPolygon = false
  override func viewDidLoad() {
        super.viewDidLoad()
      self.navigationItem.title = "Polygon"
      addPolygon()
    map4d.delegate = self
  }
  override func viewDidLayoutSubviews() {
    
  }
  func addPolygon(){
    if (!isInitPolygon){
      initData()
    }
    if (!isAddPolygon){
      
      // Move Camera To Polygon Position Before Draw
      let bounds = MFCoordinateBounds().includingPath(pathPolygon)
      let cameraUpdate = MFCameraUpdate.fit((bounds as! MFCoordinateBounds))
      map4d.moveCamera(cameraUpdate)
      
      polygon = MFPolygon.init(pathPolygon, holes: [hole])
      polygon?.map = map4d
      isAddPolygon = true
    }
  }
  func initData(){
    if (!isInitPolygon){
      pathPolygon.removeAllCoordinates()
      // Notice important
      // First point = End Point
      pathPolygon.add(CLLocationCoordinate2DMake(16.061583,108.234463))
      pathPolygon.add(CLLocationCoordinate2DMake(16.038148,108.243031))
      pathPolygon.add(CLLocationCoordinate2DMake(16.032951,108.224449))
      pathPolygon.add(CLLocationCoordinate2DMake(16.031512,108.208902))
      pathPolygon.add(CLLocationCoordinate2DMake(16.061583,108.234463))
      // First point = End Point
      // Init hole
      // Notice important
      // First point = End Point
      hole.removeAllCoordinates()
      hole.add(CLLocationCoordinate2DMake(16.043380,108.227177))
      hole.add(CLLocationCoordinate2DMake(16.036575,108.233614))
      hole.add(CLLocationCoordinate2DMake(16.034430,108.220396))
      hole.add(CLLocationCoordinate2DMake(16.040122,108.220096))
      hole.add(CLLocationCoordinate2DMake(16.043380,108.227177))
      // First point = End Point
      
      isInitPolygon = true
    }
  }
  @IBAction func add(_ sender: Any) {
    addPolygon()
  }
  
  @IBAction func remove(_ sender: Any) {
    if (isAddPolygon){
      polygon?.map = nil
      isAddPolygon = false
      isInitPolygon = false
    }
  }
  
  @IBAction func hide(_ sender: Any) {
    polygon?.visible = !(polygon?.visible)!
    if ((polygon?.visible)!){
      lbHide.setTitle("Hide", for: .normal)
    } else {
      lbHide.setTitle("Show", for: .normal)
    }
  }
  @IBAction func update(_ sender: Any) {
    if (isAddPolygon){
        // update path
        // remove last coordinate
        pathPolygon.removeLastCoordinate()
        // add new coordinatre
        pathPolygon.add(CLLocationCoordinate2DMake(16.046232,108.194873))
        // add first coordinate
        pathPolygon.add(pathPolygon.object(at: 0))
        polygon?.path = pathPolygon
        // update color
        polygon?.fillColor = .red
    }
  }
}


extension PolygonViewController: MFMapViewDelegate {
  func mapview(_ mapView: MFMapView!, didTap polygon: MFPolygon!) {
    lbTitle.text = "Polygon clicked Id= " + String(polygon.id)
  }
  func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
    lbTitle.text = "Map clicked: " + String(coordinate.latitude) + " , " + String(coordinate.longitude)
  }
}
