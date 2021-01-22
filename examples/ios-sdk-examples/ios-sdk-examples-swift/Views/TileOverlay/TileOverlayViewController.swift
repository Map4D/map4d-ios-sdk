import UIKit
import Map4dMap

class TileOverlayViewController : UIViewController {
  
  @IBOutlet weak var addRemove: UIButton!
  @IBOutlet weak var hideShow: UIButton!
  @IBOutlet weak var mapView: MFMapView!
  
  private lazy var tileOverlay: MFURLTileLayer = {
    let urlConstructor = TileURLConstructor()
    let tileOverlay = MFURLTileLayer(urlConstructor: urlConstructor)
    return tileOverlay
  }()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.title = "Tile Overlay"
  }
  
  private func addTileOverlay() {
    tileOverlay.map = mapView
    
    showTileOverlay()
    addRemove.setTitle("Remove TileOverlay", for: .normal)
    hideShow.isHidden = false
  }
  
  private func removeTileOverlay() {
    tileOverlay.map = nil
    
    addRemove.setTitle("Add TileOverlay", for: .normal)
    hideShow.isHidden = true
  }
  
  private func hideTileOverlay() {
    tileOverlay.isHidden = true
    
    hideShow.setTitle("Show TileOverlay", for: .normal)
  }
  
  private func showTileOverlay() {
    tileOverlay.isHidden = false
    
    hideShow.setTitle("Hide TileOverlay", for: .normal)
  }
  
  @IBAction func didTapAddRemove(_ sender: Any) {
    if tileOverlay.map != nil {
      removeTileOverlay()
    }
    else {
      addTileOverlay()
    }
  }
  
  @IBAction func didTapShowHide(_ sender: Any) {
    if (tileOverlay.isHidden) {
      showTileOverlay()
    }
    else {
      hideTileOverlay()
    }
  }
  
}

extension TileOverlayViewController {
  class TileURLConstructor : NSObject, MFTileURLConstructor {
    func getTileUrlWith(x: UInt, y: UInt, zoom: UInt, is3dMode: Bool) -> URL? {
      let url = "https://tile.openstreetmap.de/\(zoom)/\(x)/\(y).png"
      return URL(string: url)
    }
  }
}
