#TileArea

Lớp TileArea cho phép người dùng thực hiện thay thế các tile tại một khu vực nào đó bằng các tile khác.

##1. TileArea & TileAreaOptions

  - 
    ```swift
      open class MFTileArea : MFOverlay {
        open var bounds: MFCoordinateBounds!
        open var mapUrl: String!
        open var minZoom: NSNumber!
        open var maxZoom: NSNumber!
        
        public init!(_ bounds: MFCoordinateBounds!, mapUrl url: String!, minZoom: NSNumber!, maxZoom: NSNumber!)
        public init!(_ bounds: MFCoordinateBounds!, mapUrl url: String!)
        open func update(_ bounds: MFCoordinateBounds!, mapUrl url: String!, minZoom: NSNumber!, maxZoom: NSNumber!)
        open func update(_ bounds: MFCoordinateBounds!, mapUrl url: String!)
        open func update(_ bounds: MFCoordinateBounds!)
        }
    ```

## 2. Tạo Tile-area

  - 
    ```swift
      var tileArea: MFTileArea? = nil ;
      let latLngBounds = MFCoordinateBounds.init(coordinate: CLLocationCoordinate2DMake(15.606498,  107.699308), coordinate1: CLLocationCoordinate2DMake(16.567800, 108.974320))
      tileArea = MFTileArea(latLngBounds, mapUrl: "http://a.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png")
      tileArea?.minZoom = 2;
      tileArea?.maxZoom = 22;
      tileArea?.map = mapView
    ```


License
-------

Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.