//
//  BuildingOverlayViewController.swift
//  ios-sdk-examples
//
//  Created by Huy Dang on 28/01/2021.
//  Copyright © 2021 tantv. All rights reserved.
//

import Foundation
import UIKit
import Map4dMap

class BuildingOverlayViewController: UIViewController {
  
  @IBOutlet weak var mapView: MFMapView!
  private var buildingOverlay: MFURLBuildingLayer!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.title = "Building Overlay"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    mapView.enable3DMode(true)
    createBuildingOverlay()
    addBuildingOverlay()
  }
  
  private func createBuildingOverlay() {
    let urlConstructor = BuildingURLConstructor()
    let buildingOverlay = MFURLBuildingLayer(urlConstructor: urlConstructor, prefixId: "building-layer-")
    
    self.buildingOverlay = buildingOverlay
  }
  
  private func addBuildingOverlay() {
    buildingOverlay.map = mapView
  }
  
  private func removeBuildingOverlay() {
    buildingOverlay.map = nil
  }
  
  private func hideBuildingOverlay() {
    buildingOverlay.isHidden = true
  }
  
  private func showBuildingOverlay() {
    buildingOverlay.isHidden = false
  }
}

extension BuildingOverlayViewController {
  
  class BuildingURLConstructor : NSObject, MFBuildingURLConstructor {
    func getBuildingUrlWith(x: UInt, y: UInt, zoom: UInt) -> URL? {
      let url = "https://poi-random.herokuapp.com/poi/\(zoom)/\(x)/\(y)"
      return URL(string: url)
    }
    
    func parserBuildingData(_ data: String) -> [MFBuildingData]? {
      do {
        var buildingDatas:[MFBuildingData] = []
        let decoder = JSONDecoder()
        let poisJson = try decoder.decode(POIsJson.self, from: data.data(using: .utf8)!)
        
        guard let places = poisJson.pois else { return nil }
        for place in places {
          guard let placeId = place.id else { continue }
          let position = CLLocationCoordinate2DMake(place.position?.lat ?? 0, place.position?.lng ?? 0)
          let model = "https://sw-hcm-1.vinadata.vn/v1/AUTH_d0ecabcbdcd74f6aa6ac9a5da528eb78/sdk/models/5b21d9a5cd18d02d045a5e99"
          let texture = "https://sw-hcm-1.vinadata.vn/v1/AUTH_d0ecabcbdcd74f6aa6ac9a5da528eb78/sdk/textures/0cb35e1610c34e55946a7839356d8f66.jpg"
          let building = MFBuildingData(id: placeId, position: position, model: model, texture: texture)
          buildingDatas.append(building)
          break;
        }
        
        return buildingDatas;
      } catch let err {
        print(err.localizedDescription)
        return nil
      }
    }
  }
}

extension BuildingOverlayViewController : MFMapViewDelegate {
  func mapView(_ mapView: MFMapView!, didTapBuildingWithBuildingID buildingID: String!, name: String!, location: CLLocationCoordinate2D) {
    print("Tap building: \(buildingID!), name: \(name!)")
  }
}
