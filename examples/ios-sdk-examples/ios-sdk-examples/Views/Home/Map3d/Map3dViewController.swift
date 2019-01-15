//
//  Map3dViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/5/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import map4dsdk

class Map3dViewController: UIViewController {
  let hcmCoordinate = CLLocationCoordinate2DMake(10.770223, 106.704023)
  @IBOutlet weak var map4d: MFMapView!
  override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationItem.title = "Map 3D"
    
    // Enable My Location Button
    map4d.setMyLocationEnabled(true)
    // Move To Camera
    let camera = MFCameraPosition(target: hcmCoordinate, zoom: 15)
    map4d.move(camera)
    
    let markerInCamera = MFMarker.init()
    markerInCamera.position = hcmCoordinate
    // Anchor
    markerInCamera.groundAnchor = CGPoint(x: 0.5, y: 1.0)
    markerInCamera.map = map4d
    map4d.switchMode = MFSwitchMode.manual
    // Set 3D Map
    map4d.enable3dMode(true)
    }

}
