//
//  Map2dViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/5/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import map4dsdk

class Map2dViewController: UIViewController {

  @IBOutlet weak var map4d: MFMapView!
  let hcmCoordinate = CLLocationCoordinate2DMake(10.770223, 106.704023)
  
  override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Map 2D"
        // Set 2D Map
        map4d.enable3dMode(false)
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
    
        // set only 2D Mode
        map4d.switchMode = MFSwitchMode.manual
    }
  

}
