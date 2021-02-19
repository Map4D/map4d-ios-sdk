//
//  ViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/5/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import Map4dMap

class ViewController: UIViewController {
  @IBOutlet weak var viewCollections: UIView!
  @IBOutlet weak var mapView: MFMapView!
  @IBOutlet weak var modeButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addListener()
    self.navigationItem.title = "Explorer"
  }
  
  @IBAction func didTapModeButton(_ sender: Any) {
    mapView.enable3DMode(!mapView.is3DMode())
    modeButton.setTitle(mapView.is3DMode() ? "2D" : "3D", for: .normal)
  }
  
  func addListener() {
    // View Collection
    let tapViewCollectionGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewCollectionTapped(tapGestureRecognizer:)))
    viewCollections.isUserInteractionEnabled = true
    viewCollections.addGestureRecognizer(tapViewCollectionGestureRecognizer)
  }
  
  
  
  @objc func image2DTapped(tapGestureRecognizer: UITapGestureRecognizer)
  {
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let map2DUIViewController = storyBoard.instantiateViewController(withIdentifier: "map2dStoryBoard") as! Map2dViewController
    self.navigationController?.pushViewController(map2DUIViewController, animated: true)
    
  }
  
  @objc func image3DTapped(tapGestureRecognizer: UITapGestureRecognizer)
  {
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let map3DUIViewController = storyBoard.instantiateViewController(withIdentifier: "map3dStoryBoard") as! Map3dViewController
    self.navigationController?.pushViewController(map3DUIViewController, animated: true)
  }
  
  @objc func viewCollectionTapped(tapGestureRecognizer: UITapGestureRecognizer)
  {
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    let collectionUIViewController = storyBoard.instantiateViewController(withIdentifier: "collectionsStoryBoard") as! CollectionsViewController
    self.navigationController?.pushViewController(collectionUIViewController, animated: true)
    
  }
}

