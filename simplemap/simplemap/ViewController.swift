//
//  ViewController.swift
//  simplemap
//
//  Created by Sua Le on 12/29/18.
//  Copyright © 2018 Sua Le. All rights reserved.
//

import UIKit
import map4dsdk

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MFMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView?.enable3DMode(false)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

