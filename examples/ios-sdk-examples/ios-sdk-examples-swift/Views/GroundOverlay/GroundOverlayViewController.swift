//
//  GroundOverlayViewController.swift
//  ios-sdk-examples
//
//  Created by Huy Dang on 27/01/2021.
//  Copyright © 2021 tantv. All rights reserved.
//

import Foundation
import UIKit
import Map4dMap

class GroundOverlayViewController : UIViewController {
  @IBOutlet weak var mapView: MFMapView!
  
  private var groundOverlay: MFGroundOverlay?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.title = "Ground Overlay"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.moveCamera(MFCameraUpdate.setCamera(MFCameraPosition(target: mapView.camera!.target, zoom: 14)))
    createGroundOverlay()
    addGroundOverlay()
  }
  
  private func createGroundOverlay() {
    let bounds = MFCoordinateBounds(
      coordinate: CLLocationCoordinate2D(latitude: 16.059547034047146, longitude: 108.22125434875488),
      coordinate1: CLLocationCoordinate2D(latitude: 16.075630202564316, longitude: 108.23086738586424)
    )
    let urlConstructor = GroundURLConstructor()
    groundOverlay = MFGroundOverlay(bounds: bounds, tileURLConstructor: urlConstructor, overrideBaseMap: true)
  }
  
  private func addGroundOverlay() {
    groundOverlay?.map = mapView
  }
  
  private func removeGroundOverlay() {
    groundOverlay?.map = nil
  }
  
  private func hideGroundOverlay() {
    groundOverlay?.isHidden = true
  }
  
  private func showGroundOverlay() {
    groundOverlay?.isHidden = false
  }
}


extension GroundOverlayViewController {
  class GroundURLConstructor : NSObject, MFTileURLConstructor {
    func getTileUrlWith(x: UInt, y: UInt, zoom: UInt, is3dMode: Bool) -> URL? {
      let url = "https://a.tile.opentopomap.org/\(zoom)/\(x)/\(y).png"
      return URL(string: url)
    }
  }
}
