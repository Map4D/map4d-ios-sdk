//
//  MarkesViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import map4dsdk

class MarkesViewController: UIViewController {

  @IBOutlet weak var map4d: MFMapView!
  @IBOutlet weak var tvNotice: UILabel!
  var listMarker: NSMutableArray = []
  var isAddMarker = false
  var arrIconMarkerLatLngs = [[Double]]()
  var arrIconViewMarkerLatLngs = [[Double]]()
  var pathCoordinateFromMarker = MFMutablePath.init()
  var isInitInforWindows = false
  var totalIconMarker  = 0
  @IBOutlet weak var btnRemoveAllMarker: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Marker"
        initDataMarker()
        addAllMarker()
        getLatLngBound()
        map4d.delegate = self
    }
  
  func initDataMarker(){
    
    // Add Icon Marker
    arrIconMarkerLatLngs.append([16.049349,108.222181])
    arrIconMarkerLatLngs.append([16.040297,108.246669])
    arrIconMarkerLatLngs.append([16.028088,108.226070])
    arrIconMarkerLatLngs.append([15.978163,108.273010])
    arrIconMarkerLatLngs.append([15.923045,108.315445])
    arrIconMarkerLatLngs.append([15.881828,108.343116])
    
    // Add IconView Marker
    arrIconViewMarkerLatLngs.append([15.758159,108.373215])
    arrIconViewMarkerLatLngs.append([15.828975,108.168769])
    arrIconViewMarkerLatLngs.append([15.659966,108.077995])
    arrIconViewMarkerLatLngs.append([15.497333,108.344910])
    arrIconViewMarkerLatLngs.append([15.507095,108.502220])
    arrIconViewMarkerLatLngs.append([15.504097,108.595539])
  }
  
  func addAllMarker(){
    if (!isAddMarker){

      // add icon marker
      for x in 0..<arrIconMarkerLatLngs.count {
        let lat = arrIconMarkerLatLngs[x][0];
        let lng = arrIconMarkerLatLngs[x][1];
        let image = UIImage(named: "ic_marker_pin")
        let position = CLLocationCoordinate2DMake(lat, lng)
        let marker = initIconMarker(image: image!, position: position, anchor: CGPoint(x: 0.5, y: 1.0), elevation: 0)
        listMarker.add(marker)
        totalIconMarker+=1;
        pathCoordinateFromMarker.add(position)
        marker.map = map4d
      }
      
      // add iconView marker
      for x in 0..<arrIconViewMarkerLatLngs.count {
        let lat = arrIconViewMarkerLatLngs[x][0];
        let lng = arrIconViewMarkerLatLngs[x][1];
        let image = UIImage(named: "ic_marker_custom")
        let uiView = UIImageView(image: image)
        let position = CLLocationCoordinate2DMake(lat, lng)
        let marker = initIconViewMarker(image: uiView, position: position, anchor: CGPoint(x: 0.5, y: 1.0), elevation: 0)
        listMarker.add(marker)
        pathCoordinateFromMarker.add(position)
        marker.map = map4d
      }
      
      isAddMarker = true
      let totalMarker = arrIconMarkerLatLngs.count + arrIconViewMarkerLatLngs.count
      tvNotice.text = String(totalMarker) + " markers"
    }
    
  }
  
  func removeAllMarker(){
    if (isAddMarker){
      isAddMarker = false
      totalIconMarker = 0
      map4d.clear()
      isInitInforWindows = false
      pathCoordinateFromMarker.removeAllCoordinates()
      listMarker.removeAllObjects()
      tvNotice.text = "0 marker"
    }
  }
  
  func initIconMarker(image: UIImage, position: CLLocationCoordinate2D, anchor: CGPoint, elevation: Double) -> MFMarker {
    let marker = MFMarker()
    marker.icon = image
    marker.position = position
    marker.groundAnchor = anchor
    marker.elevation = elevation
    return marker
  }
  
  func initIconViewMarker(image: UIView, position: CLLocationCoordinate2D, anchor: CGPoint, elevation: Double) -> MFMarker {
    let marker = MFMarker()
    marker.iconView = image
    marker.position = position
    marker.groundAnchor = anchor
    marker.elevation = elevation
    return marker
  }
  
  @IBAction func btnRemoveAllMarker(_ sender: Any) {
    if (isAddMarker){
      //remove
      removeAllMarker()
      btnRemoveAllMarker.setTitle("Add all Marker", for: .normal)
    } else {
      //add
      addAllMarker()
      btnRemoveAllMarker.setTitle("Remove all Marker", for: .normal)
      getLatLngBound()
    }
  }
  
  @IBAction func btnLatLngBounds(_ sender: Any) {
    getLatLngBound()
  }
  
  func getLatLngBound(){
    if (isAddMarker){
      let latLngBounds = MFCoordinateBounds.init(path: pathCoordinateFromMarker)
      
      let cameraUpdate = MFCameraUpdate.fit(latLngBounds)
      
      map4d.moveCamera(cameraUpdate)
  
    }
  }
  
  @IBAction func updateInforWindows(_ sender: Any) {
    if (!isInitInforWindows && isAddMarker){
      for x in 0..<listMarker.count {
        let marker = listMarker.object(at: x) as! MFMarker
        if (x < totalIconMarker){
          // Icon marker
          marker.title = "Location"
          marker.snippet = String(marker.position.latitude) + " , " + String(marker.position.longitude)
        } else {
          break;
        }
      }
      tvNotice.text = "Please tap on marker"
      isInitInforWindows = true
    }
    
  }
  
}


extension MarkesViewController: MFMapViewDelegate {
  func mapview(_ mapView: MFMapView!, didTap marker: MFMarker!) -> Bool {
    // Tap on marker
    // Return true if you want to override this method
    if (marker != nil){
      tvNotice.text = "marker: " + String(marker.position.latitude) + " , " + String(marker.position.longitude)
    }
    return false
  }
  
  func mapView(_ mapView: MFMapView!, markerInfoWindow marker: MFMarker!) -> UIView! {
    let image = UIImage(named: "ic_marker_custom")
    let uiView = UIImageView(image: image)
    var isIconViewMarker = false
    for x in 0..<listMarker.count {
      // search marker iconView
      if (x >= totalIconMarker){
       let lcMarker = listMarker.object(at: x) as! MFMarker
        if (lcMarker == marker){
          isIconViewMarker = true
          break
        }
      }
    }
    if (isIconViewMarker == true){
      return uiView
    }
    return nil
  }
}
