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
  
  private let items: [CellItem] = CellItem.allCases
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "Tutorial"
    addListener()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count;
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: CollectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CELL_COLLECTION") as! CollectionTableViewCell
    let item = items[indexPath.row];
    cell.tvTitle.text = item.title()
    cell.imgIcon.image = item.icon()
    return cell;
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var viewController: UIViewController? = nil
    switch items[indexPath.row] {
    case .setting:
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "settingsStoryBoard")
    case .marker:
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "markerStoryBoard")
    case .polyline:
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "polylineStoryBoard")
    case .polygon:
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "polygonStoryBoard")
    case .circle:
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "circleStoryBoard")
    case .myLocation:
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "myLocationStoryBoard")
    case .delegate:
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "delegateStoryBoard")
    case .annimation:
      let storyBoard = UIStoryboard(name: "Main", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "animateStoryBoard")
    case .tileOverlay:
      let storyBoard = UIStoryboard(name: "TileOverlay", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "TileOverlayViewController")
    case .groundOverlay:
      let storyBoard = UIStoryboard(name: "GroundOverlay", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "GroundOverlayViewController")
    case .poiOverlay:
      let storyBoard = UIStoryboard(name: "POIOverlay", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "POIOverlayViewController")
    case .buildingOverlay:
      let storyBoard = UIStoryboard(name: "BuildingOverlay", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "BuildingOverlayViewController")
    case .poi:
      let storyBoard = UIStoryboard(name: "POIViewController", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "POIViewController")
    case .buildling:
      let storyBoard = UIStoryboard(name: "BuildingViewController", bundle: nil)
      viewController = storyBoard.instantiateViewController(withIdentifier: "BuildingViewController")
    }
    
    guard let vc = viewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
    
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
