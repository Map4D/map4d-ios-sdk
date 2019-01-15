//
//  TileAreaViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import map4dsdk

class TileAreaViewController: UIViewController {
  @IBOutlet weak var lbTitle: UILabel!
  @IBOutlet weak var tvHide: UIButton!
  
  @IBOutlet weak var map4d: MFMapView!
  
  var tileArea: MFTileArea?
  var isAddTileArea = false
  var tileUrlDefault  = "http://api-dev.map4d.vn/v2/api/tile/{z}/{x}/{y}"
  var tileUrlOther    = "http://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png"
  var bounds : MFCoordinateBounds?
  var isInitBounds = false
  override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationItem.title = "Tile Area"
    initBounds()
    addTileArea()
  }
  
  func initBounds(){
    if (!isInitBounds){
      let northEast = CLLocationCoordinate2DMake(16.290772,109.094152)
      let southWest = CLLocationCoordinate2DMake(9.311770,103.751299)
      bounds = MFCoordinateBounds.init(coordinate: northEast, coordinate1: southWest)
      isInitBounds = true
    }
  }
  func addTileArea(){
    if (!isAddTileArea){
      tileArea = MFTileArea.init(bounds, mapUrl: tileUrlDefault)
      tileArea?.map = map4d
      isAddTileArea = true
      lbTitle.text = tileUrlDefault
    }
  }
  
  @IBAction func add(_ sender: Any) {
    initBounds()
    addTileArea()
  }
  
  @IBAction func remove(_ sender: Any) {
    if (isAddTileArea){
      tileArea?.map = nil
      isAddTileArea = false
      isInitBounds = false
    }
  }
  
  @IBAction func update(_ sender: Any) {
    if (isAddTileArea){
      let northEast = CLLocationCoordinate2DMake(23.442459,110.064812)
      let southWest = CLLocationCoordinate2DMake(16.260822,100.460358)
      bounds = MFCoordinateBounds.init(coordinate: northEast, coordinate1: southWest)
      tileArea?.bounds = bounds
      tileArea?.mapUrl = tileUrlOther
      lbTitle.text = tileUrlOther
    }
  }
  
}
