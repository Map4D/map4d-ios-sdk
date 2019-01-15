//
//  ViewController.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/5/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit
import map4dsdk

class ViewController: UIViewController {
  @IBOutlet weak var img2DMap: UIImageView!
  @IBOutlet weak var img3DMap: UIImageView!
  @IBOutlet weak var viewCollections: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addListener()
    self.navigationItem.title = "Explorer"
  }
  
  func addListener() {
    // 2D map
    let tap2DGestureRecognizer = UITapGestureRecognizer(target: self,
                                                      action: #selector(image2DTapped(tapGestureRecognizer:)))
    img2DMap.isUserInteractionEnabled = true
    img2DMap.addGestureRecognizer(tap2DGestureRecognizer)
    
    // 3D map
    let tap3DGestureRecognizer = UITapGestureRecognizer(target: self,
                                                      action: #selector(image3DTapped(tapGestureRecognizer:)))
    img3DMap.isUserInteractionEnabled = true
    img3DMap.addGestureRecognizer(tap3DGestureRecognizer)
    
    // View Collection
    let tapViewCollectionGestureRecognizer = UITapGestureRecognizer(target: self,
                                                        action: #selector(viewCollectionTapped(tapGestureRecognizer:)))
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

