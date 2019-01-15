//
//  AnimateViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import map4dsdk

class AnimateViewController: UIViewController {

  @IBOutlet weak var map4d: MFMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    map4d.setMyLocationEnabled(true)
    self.navigationItem.title = "Animate & Move"
    
    let target = CLLocationCoordinate2DMake(10.772603,106.702309)
    let cameraPosition = MFCameraPosition.init(target: target, zoom: 17, tilt: 50, bearing: 10)
    map4d.move(cameraPosition)
    
  }
  
  @IBAction func btnAnimate(_ sender: Any) {
    let target = CLLocationCoordinate2DMake(16.050928,108.225117)
    let cameraUpdate = MFCameraUpdate.setTarget(target, zoom: 16, tilt: 30, bearing: 50)
    map4d.animate(with: cameraUpdate)
    // Clear All Annotation
    map4d.clear()
    // Add Marker
    let marker = MFMarker.init()
    marker.position = target
    marker.groundAnchor = CGPoint(x: 0.5, y: 1.0)
    marker.map = map4d
    
  }
  
  
  @IBAction func btnMove(_ sender: Any) {
    let target = CLLocationCoordinate2DMake(10.772603,106.702309)
    let cameraPosition = MFCameraPosition.init(target: target, zoom: 17, tilt: 50, bearing: 10)
    map4d.move(cameraPosition)
    
    // Clear All Annotation
    map4d.clear()
    // Add Marker
    let marker = MFMarker.init()
    marker.groundAnchor = CGPoint(x: 0.5, y: 1.0)
    marker.position = target
    marker.map = map4d
  }
  
}
