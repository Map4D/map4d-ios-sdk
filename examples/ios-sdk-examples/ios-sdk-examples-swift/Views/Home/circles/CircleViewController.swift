//
//  CircleViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import Map4dMap

class CircleViewController: UIViewController {
  
  @IBOutlet weak var lbTitle: UILabel!
  @IBOutlet weak var map4d: MFMapView!
  @IBOutlet weak var lbHide: UIButton!
  var circle: MFCircle?
  var isAddCircle = false
  var posCicle1 = CLLocationCoordinate2DMake(16.040159,108.220690)
  var posCicle2 = CLLocationCoordinate2DMake(16.057145,108.217026)
  var posCicle3 = CLLocationCoordinate2DMake(16.056545,108.168142)
  var enumUpdateCircle = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Circle"
    addCircle()
    map4d.delegate = self
  }
  
  override func viewDidLayoutSubviews() {
    guard let target = circle?.position else { return } 
    let cameraPosition = MFCameraPosition(target: target, zoom: 17, tilt: 50, bearing: 0)
    map4d.moveCamera(MFCameraUpdate.setCamera(cameraPosition))
  }
  
  func addCircle(){
    if (!isAddCircle){
      circle = MFCircle()
      circle!.position = posCicle1
      circle?.radius = 1000.0
      circle?.fillColor = .blue
      circle?.map = map4d
      guard let target = circle?.position else { return }
      let cameraPosition = MFCameraPosition(target: target , zoom: 17, tilt: 50, bearing: 0)
      map4d.moveCamera(MFCameraUpdate.setCamera(cameraPosition))
      isAddCircle = true
    }
  }
  @IBAction func add(_ sender: Any) {
    addCircle()
    guard let target = circle?.position else { return }
    let cameraPosition = MFCameraPosition(target: target , zoom: 17, tilt: 50, bearing: 0)
    map4d.moveCamera(MFCameraUpdate.setCamera(cameraPosition))
  }
  @IBAction func remove(_ sender: Any) {
    if (isAddCircle){
      circle?.map = nil
      isAddCircle = false
    }
  }
  
  @IBAction func hide(_ sender: Any) {
    circle?.isHidden = !(circle?.isHidden)!
    if ((circle?.isHidden)!){
      lbHide.setTitle("Hide", for: .normal)
    } else {
      lbHide.setTitle("Show", for: .normal)
    }
  }
  
  @IBAction func update(_ sender: Any) {
    if (isAddCircle){
      enumUpdateCircle+=1
      switch enumUpdateCircle {
        case 1:
          circle?.position = posCicle2
          circle?.radius = 3000
          break
        case 2:
          circle?.position = posCicle3
          circle?.radius = 6000
          break
        default:
          circle?.position = posCicle1
          circle?.radius = 9000
          enumUpdateCircle = 0
      }
      circle?.fillColor = .red
      
      guard let target = circle?.position else { return }
      let cameraPosition = MFCameraPosition(target: target , zoom: 13, tilt: 50, bearing: 0)
      map4d.moveCamera(MFCameraUpdate.setCamera(cameraPosition))
    }
  }
}

extension CircleViewController: MFMapViewDelegate {
  func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!) {
    lbTitle.text = "Circle clicked Id= " + String(circle.id)
  }
  func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
    lbTitle.text = "Map clicked: " + String(coordinate.latitude) + " , " + String(coordinate.longitude)
  }
}
