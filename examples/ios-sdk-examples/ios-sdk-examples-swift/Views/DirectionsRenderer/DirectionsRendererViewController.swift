import Map4dMap
import UIKit

class DirectionsRendererViewController: UIViewController {
  
  @IBOutlet weak var btnAddRemove: UIButton!
  @IBOutlet weak var mapView: MFMapView!
  
  private lazy var renderer: MFDirectionsRenderer = {
    let renderer = MFDirectionsRenderer();
    
    let route0 = MFMutablePath()
    route0.add(CLLocationCoordinate2DMake(16.078814, 108.221592))
    route0.add(CLLocationCoordinate2DMake(16.078972, 108.223034))
    route0.add(CLLocationCoordinate2DMake(16.075353, 108.223513))
    
    let route1 = MFMutablePath()
    route1.add(CLLocationCoordinate2DMake(16.078814, 108.221592))
    route1.add(CLLocationCoordinate2DMake(16.077491, 108.221735))
    route1.add(CLLocationCoordinate2DMake(16.077659, 108.223212))
    route1.add(CLLocationCoordinate2DMake(16.075353, 108.223513))
    
    renderer.routes = [route0, route1]
    renderer.originPosition = CLLocationCoordinate2DMake(16.079264, 108.220959)
    renderer.originTitle = "Begin Location"
    renderer.originTitleColor = .red
    renderer.destinationTitle = "End Location"
    renderer.destinationTitleColor = .brown
    
    return renderer
  }();
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.title = "Directions Renderer"
    mapView.camera = MFCameraPosition(target: CLLocationCoordinate2DMake(16.077491, 108.221735), zoom: 17, tilt: 0, bearing: 0)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
  }
  
  private func addRenderer() {
    renderer.map = mapView
    btnAddRemove.setTitle("Remove Directions Renderer", for: .normal)
  }
  
  private func removeRenerer() {
    renderer.map = nil
    btnAddRemove.setTitle("Add Directions Renderer", for: .normal)
  }
  
  @IBAction func didTapAddRemove(_ sender: Any) {
    if (renderer.map == nil) {
      addRenderer()
    }
    else {
      removeRenerer()
    }
  }
}

extension DirectionsRendererViewController : MFMapViewDelegate {
  
  func mapView(_ mapView: MFMapView!, didTap renderer: MFDirectionsRenderer!, routeIndex: UInt) {
    renderer.activedIndex = routeIndex
  }
}
