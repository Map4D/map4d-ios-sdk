//
//  CellItem.swift
//  ios-sdk-examples
//
//  Created by Huy Dang on 29/01/2021.
//  Copyright © 2021 tantv. All rights reserved.
//

import UIKit

extension CollectionsViewController {
  
  enum CellItem : CaseIterable {
    case setting,
         marker,
         polyline,
         polygon,
         circle,
         myLocation,
         delegate,
         annimation,
         tileOverlay,
         groundOverlay,
         poiOverlay,
         buildingOverlay,
         poi,
         buildling,
         directionsRenderer
    
    func icon() -> UIImage? {
      switch self {
      case .setting:
        return UIImage(named: "ic_setting")
      case .marker:
        return UIImage(named: "ic_marker")
      case .polyline:
        return UIImage(named: "ic_polyline")
      case .polygon:
        return UIImage(named: "ic_polygon")
      case .circle:
        return UIImage(named: "ic_circle")
      case .myLocation:
        return UIImage(named: "ic_my_location")
      case .delegate:
        return UIImage(named: "ic_delegate")
      case .annimation:
        return UIImage(named: "ic_animation")
      case .tileOverlay:
        return UIImage(named: "ic_tile")
      case .groundOverlay:
        return UIImage(named: "ic_tile")
      case .poiOverlay:
        return UIImage(named: "ic_tile")
      case .buildingOverlay:
        return UIImage(named: "ic_tile")
      case .poi:
        return UIImage(named: "ic_marker")
      case .buildling:
        return UIImage(named: "ic_tile")
      case .directionsRenderer:
        return UIImage(named: "ic_polyline")
      }
    }
    
    func title() -> String {
      switch self {
      case .setting:
        return "Setting"
      case .marker:
        return "Marker"
      case .polyline:
        return "Polyline"
      case .polygon:
        return "Polygon"
      case .circle:
        return "Circle"
      case .myLocation:
        return "My Location"
      case .delegate:
        return "Delegate"
      case .annimation:
        return "Annimation & Move"
      case .tileOverlay:
        return "Tile Overlay"
      case .groundOverlay:
        return "Ground Overlay"
      case .poiOverlay:
        return "POI Overlay"
      case .buildingOverlay:
        return "Building Overlay"
      case .poi:
        return "POI"
      case .buildling:
        return "Building"
      case .directionsRenderer:
        return "Directions Renderer"
      }
    }
    
  }
}
