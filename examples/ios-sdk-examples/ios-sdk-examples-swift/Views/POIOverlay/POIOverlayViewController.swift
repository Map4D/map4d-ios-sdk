//
//  POIOverlayViewController.swift
//  ios-sdk-examples
//
//  Created by Huy Dang on 27/01/2021.
//  Copyright © 2021 tantv. All rights reserved.
//

import Foundation
import UIKit
import Map4dMap

struct PositionJson : Codable {
  var lat: Double = 0
  var lng: Double = 0
}

struct POIJson : Codable {
  var id: String?
  var title: String?
  var position: PositionJson?
}

struct POIsJson : Codable {
  var pois: [POIJson]?
}

class POIOverlayViewController : UIViewController {
  
  @IBOutlet weak var mapView: MFMapView!
  
  private var poiOverlay: MFURLPOILayer!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.title = "POI Overlay"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    createPOIOverlay()
    addPOIOverlay()
  }
  
  private func createPOIOverlay() {
    let poiURLConstructor = POIURLConstructor()
    let poiOverlay = MFURLPOILayer(urlConstructor: poiURLConstructor, prefixId: "poi-overlay_")
    
    self.poiOverlay = poiOverlay
  }
  
  private func addPOIOverlay() {
    poiOverlay.map = mapView
  }
  
  private func removePOIOverlay() {
    poiOverlay.map = nil
  }
  
  private func hidePOIOverlay() {
    poiOverlay.isHidden = true
  }
  
  private func showPOIOverlay() {
    poiOverlay.isHidden = false
  }
}

extension POIOverlayViewController {
  class POIURLConstructor : NSObject, MFPOIURLConstructor {
    func getPOIUrlWith(x: UInt, y: UInt, zoom: UInt) -> URL? {
      let poiApiUrl = "https://poi-random.herokuapp.com/poi/\(zoom)/\(x)/\(y)"
      return URL(string: poiApiUrl)
    }
    
    func parserPOIData(_ data: String) -> [MFPOIData]? {
      do {
        var poiDatas:[MFPOIData] = []
        let decoder = JSONDecoder()
        let poisJson = try decoder.decode(POIsJson.self, from: data.data(using: .utf8)!)
        
        guard let places = poisJson.pois else { return nil }
        for place in places {
          let position = CLLocationCoordinate2DMake(place.position?.lat ?? 0, place.position?.lng ?? 0)
          let poi = MFPOIData(id: place.id ?? "", position: position, title: place.title)
          poi.titleColor = .blue
          poi.type = "park"
          poiDatas.append(poi)
        }
        
        return poiDatas;
      } catch let err {
        print(err.localizedDescription)
        return nil
      }
    }
  }
}


extension POIOverlayViewController : MFMapViewDelegate {

  func mapView(_ mapView: MFMapView!, didTapPOIWithPlaceID placeID: String!, name: String!, location: CLLocationCoordinate2D) {
    print("Tap Poi: \(placeID!), name: \(name!)")
  }
  
}
