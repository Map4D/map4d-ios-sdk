//
//  CollectionsViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/5/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

  @IBOutlet weak var viewExplorer: UIView!
  
  @IBOutlet weak var tableViewCollections: UITableView!
  let icCollection: [String] = ["ic_setting", "ic_marker","ic_polyline", "ic_polygon","ic_circle","ic_tile_area" ,"ic_my_location","ic_delegate","ic_animation"]
  let tvCollection: [String] = ["Setting", "Marker", "Polyline", "Polygon", "Circle", "Tile Area", "My Location", "Delegate", "Annimation & Move"]
  
  let ITEM_SETTING  = 0
  let ITEM_MARKER   = 1
  let ITEM_POLYLINE = 2
  let ITEM_POLYGON  = 3
  let ITEM_CIRCLE   = 4
  let ITEM_TILE_AREA   = 5
  let ITEM_MY_LOCATION = 6
  let ITEM_DELEGATE    = 7
  let ITEM_ANIMATION_MOVE =  8
  
  override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationItem.title = "Tutorial"
    addListener()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return icCollection.count;
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: CollectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CELL_COLLECTION") as! CollectionTableViewCell
    let title = tvCollection[indexPath.row]
    let imageName = icCollection[indexPath.row]
    cell.tvTitle.text = title
    cell.imgIcon.image = UIImage(named: imageName)
    return cell;
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    switch indexPath.row {
      case ITEM_SETTING:
        let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "settingsStoryBoard") as? SettingsViewController
        if (collectionUIViewController != nil){
          self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
        }
        break
    case ITEM_MARKER:
      let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "markerStoryBoard") as? MarkesViewController
      if (collectionUIViewController != nil){
        self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
      break
    case ITEM_POLYLINE:
      let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "polylineStoryBoard") as? PolylineViewController
      if (collectionUIViewController != nil){
        self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
      break
    case ITEM_POLYGON:
      let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "polygonStoryBoard") as? PolygonViewController
      if (collectionUIViewController != nil){
        self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
      break
    case ITEM_CIRCLE:
      let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "circleStoryBoard") as? CircleViewController
      if (collectionUIViewController != nil){
        self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
      break
    case ITEM_TILE_AREA:
      let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "tileAreaStoryBoard") as? TileAreaViewController
      if (collectionUIViewController != nil){
        self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
      break
    case ITEM_MY_LOCATION:
      let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "myLocationStoryBoard") as? MyLocationViewController
      if (collectionUIViewController != nil){
        self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
      break
    case ITEM_DELEGATE:
      let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "delegateStoryBoard") as? DelegateViewController
      if (collectionUIViewController != nil){
        self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
      break
    case ITEM_ANIMATION_MOVE:
      let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "animateStoryBoard") as? AnimateViewController
      if (collectionUIViewController != nil){
        self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
      break
    default:
        let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "settingsStoryBoard") as? SettingsViewController
        if (collectionUIViewController != nil){
          self.navigationController?.pushViewController(collectionUIViewController!, animated: true)
      }
    }
    
  }
  
  func addListener() {
    
    // Explorer
    let tapViewExplorerGestureRecognizer
      = UITapGestureRecognizer(target: self,
                               action: #selector(explorerTapped(tapGestureRecognizer:)))
    viewExplorer.isUserInteractionEnabled = true
    viewExplorer.addGestureRecognizer(tapViewExplorerGestureRecognizer)
    
    tableViewCollections.dataSource = self
    tableViewCollections.delegate = self
  }
  
  @objc func explorerTapped(tapGestureRecognizer: UITapGestureRecognizer)
  {
    navigationController?.popViewController(animated: true)
    
  }

}
