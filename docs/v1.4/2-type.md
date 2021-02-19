# Type Public Map4D-SDK

  ``` swift
    // Type definitions for map4dsdk
    // Project: https://github.com/iotlinkadmin/map4d-ios-sdk (Does not have to be to GitHub, but prefer linking to a source code repository rather than to a project website.)
    // Definitions by: Sua Le <https://github.com/sua8051>
    // Definitions: https://github.com/DefinitelyTyped/DefinitelyTyped
    
    // Type definitions for map4dsdk 
    // Project: https://github.com/iotlinkadmin/map4d-ios-sdk (Does not have to be to GitHub, but prefer linking to a source code repository rather than to a project website.)
    // Definitions by: Sua Le <https://github.com/sua8051>
    // Definitions: https://github.com/DefinitelyTyped/DefinitelyTyped 
  ```
  
##1. Objective-C

  ```objc
  @interface MFCameraPosition: NSObject
    - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
    - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt ;
    - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (double) bearing;
    - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (double) bearing;

    @property(nonatomic) CLLocationCoordinate2D target;
    @property(nonatomic) double zoom;
    @property(nonatomic) double bearing;
    @property(nonatomic) double tilt;
  @end
 
  @interface MFCameraUpdate : NSObject
    + (MFCameraUpdate *) fitBounds: (MFCoordinateBounds *) _bounds;
    + (MFCameraUpdate *) fitBounds:(MFCoordinateBounds *) _bounds withEdgeInsets:(UIEdgeInsets) _edgeInsets;
    + (MFCameraUpdate *) setTarget:(CLLocationCoordinate2D) target;
    + (MFCameraUpdate *) setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
    + (MFCameraUpdate *) setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt;
    + (MFCameraUpdate *) setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (double) bearing;
    + (MFCameraUpdate *) setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (double) bearing;
    + (MFCameraUpdate *) setCamera:(MFCameraPosition *) camera;
  @end
 
  @interface MFCircle : MFOverlay
    @property(nonatomic) CGFloat fillOpacity DEPRECATED_MSG_ATTRIBUTE("This property will be removed in future versions. Use 'fillColor' instead of.");
    /** The fill color. Defaults to redColor. */
    @property(nonatomic, strong, nonnull) UIColor* fillColor;
    /** The color of this circle's outline. Defaults to blackColor */
    @property(nonatomic, strong, nonnull) UIColor* strokeColor;
    /** Position on Earth of circle center. */
    @property(nonatomic) CLLocationCoordinate2D position;
    /** Radius of the circle in meters; must be positive. */
    @property(nonatomic) double radius;
    /** The width of the circle's outline in screen points.  */
    @property(nonatomic) double strokeWidth;
    /** A Boolean value that determines whether user events are ignored and removed from the event queue. */
    @property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;
    
    - (instancetype _Nonnull) init;
    - (instancetype _Nonnull) init: (CLLocationCoordinate2D) position radius: (double) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity __deprecated_msg("This method will be removed in future versions.  Use 'init:' instead of.");
  @end
 
  @interface MFCoordinateBounds : NSObject
    @property(nonatomic, readonly, getter=northEast) CLLocationCoordinate2D northEast;
    @property(nonatomic, readonly, getter=southWest) CLLocationCoordinate2D southWest;

    - (instancetype _Nonnull ) initWithCoordinate:(CLLocationCoordinate2D)coord coordinate1:(CLLocationCoordinate2D)coord1;
    - (instancetype _Nonnull ) initWithPath: (MFPath * _Nonnull)path;
    - (MFCoordinateBounds* _Nonnull) includingCoordinate:(CLLocationCoordinate2D)coordinate;
    - (MFCoordinateBounds* _Nonnull)includingBounds:(MFCoordinateBounds * _Nonnull) other;
    - (MFCoordinateBounds* _Nonnull) includingPath:(MFPath * _Nonnull)path;
    - (bool)containsLatitude:(double)latitude;
    - (bool)containsLongitude:(double)longitude;
    - (bool)contains:(CLLocationCoordinate2D)coordinate;
  @end
  
  @interface MFMapView : UIView
  
    @property(nonatomic, weak, nullable) IBOutlet id<MFMapViewDelegate> delegate;
    @property(nonatomic, readonly) MFProjection * _Nullable projection;
    @property(nonatomic, copy) MFCameraPosition * _Nullable camera;
    @property(nonatomic, strong, readonly, nonnull) MFUISettings *settings;

    - (instancetype _Nonnull )initWithFrame: (CGRect)frame;
    - (void) setMyLocationEnabled: (bool) _isMyLocationEnable;
    - (void) setSelectedPlace: (NSString* _Nullable) placeId;
    - (NSString* _Nullable) getSelectedPlace;
    - (void) setFilterPlaces: (NSArray<NSString*>* _Nullable) filterPlaces;
    - (NSArray<NSString*>* _Nonnull) getFilterPlaces;
    - (void) setPOIsEnabled: (bool) enabled;
    - (bool) isPOIsEnabled;
    - (void) setBuildingsEnabled: (bool) enabled;
    - (bool) isBuildingsEnabled;
    - (void) setHiddenBuilding: (NSString* _Nonnull) buildingId;
    - (void) setUnhiddenBuilding: (NSString* _Nonnull) buildingId;
    - (void) setSelectedBuildings:(NSArray<NSString*>* _Nullable) buildingIds;
    - (void) setMaxNativeZoom: (double) zoom;
    - (void) enable3DMode: (bool) enabled;
    - (void) setTileUrl: (NSString* _Nonnull) url;
    - (bool) is3DMode;
    - (void) setMinZoom: (double) minZoom maxZoom: (double) maxZoom;

    /*
    * Clears all markup that has been added to the map, including markers, polylines and ground
    * overlays.  This will not clear the visible location dot or reset the current mapType.
    */
    - (void) clear;

    /*
    * Set time display for map
    * Default curent time
    * return  current time if date is NULL
    */
    - (void) setTime: (nullable NSDate*) date;
    - (void) enableWaterEffect: (bool) enabled;
    - (nullable MFCameraPosition*) cameraForBounds: (nonnull MFCoordinateBounds*) bounds insets: (UIEdgeInsets) insets;
    - (nullable MFCameraPosition*) cameraForBounds: (nonnull MFCoordinateBounds*) bounds;
  @end
 
  @interface MFMapView (Animation)
    - (void) animateCamera:(MFCameraUpdate *) cameraUpdate;
    - (void) moveCamera: (MFCameraUpdate* ) cameraUpdate;
  @end
 
  @protocol MFMapViewDelegate<NSObject>
    @optional
    - (BOOL)mapview: (MFMapView*)  mapView didTapMarker: (MFMarker*) marker;
    - (void)mapview: (MFMapView*)  mapView didBeginDraggingMarker: (MFMarker*) marker;
    - (void)mapview: (MFMapView*)  mapView didEndDraggingMarker: (MFMarker*) marker;
    - (void)mapview: (MFMapView*)  mapView didDragMarker: (MFMarker*) marker;
    - (void)mapview: (MFMapView*)  mapView didTapInfoWindowOfMarker: (MFMarker*) marker;
    - (void)mapview: (MFMapView*)  mapView didTapPolyline: (MFPolyline*) polyline;
    - (void)mapview: (MFMapView*)  mapView didTapPolygon: (MFPolygon*) polygon;
    - (void)mapview: (MFMapView*)  mapView didTapCircle: (MFCircle*) circle;
    - (void)mapView: (MFMapView*)  mapView willMove: (BOOL) gesture;
    - (void)mapView: (MFMapView*)  mapView movingCameraPosition: (MFCameraPosition*) position;
    - (void)mapView: (MFMapView*)  mapView didChangeCameraPosition:(MFCameraPosition*) position;
    - (void)mapView: (MFMapView*)  mapView idleAtCameraPosition: (MFCameraPosition *) position;
    - (void)mapView: (MFMapView*)  mapView didTapAtCoordinate: (CLLocationCoordinate2D) coordinate;
    - (void)mapView: (MFMapView*)  mapView onModeChange: (bool) is3DMode;
    - (void)mapView: (MFMapView*)  mapView didTapBuilding: (MFBuilding*) building;
    - (void)mapView: (MFMapView*)  mapView didTapPOI: (MFPOI*) poi;
    - (void)mapView: (MFMapView*)  mapView didTapMyLocation: (CLLocationCoordinate2D) location;

    - (BOOL)shouldChangeMapModeForMapView: (MFMapView*)  mapView;
    - (BOOL)didTapMyLocationButtonForMapView: (MFMapView*) mapView;
    - (UIView *) mapView: (MFMapView *) mapView markerInfoWindow: (MFMarker *) marker;
  @end
  
  @interface MFMarker: MFOverlay
    @property(nonatomic) CLLocationCoordinate2D position;
    @property(nonatomic) CGPoint groundAnchor;
    @property(nonatomic) double elevation;
    @property(nonatomic) double rotation;
    @property(nonatomic) bool draggable;

    /**
    * The info window anchor specifies the point in the icon image at which to anchor the info window,
    * which will be displayed directly above this point. This point is specified within the same space
    * as groundAnchor.
    */
    @property(nonatomic) CGPoint infoWindowAnchor;

    /**
      Title, a short description of the overlay. Some overlays, such as markers, will display the title on the map. The title is also the default accessibility text.
    */
    @property(nonatomic, strong, nullable) NSString *title;

    /** Snippet text, shown beneath the title in the info window when selected. */
    @property(nonatomic, strong, nullable) NSString *snippet;
    @property(nonatomic, strong, nullable, setter=setIconView:) UIView * iconView;
    @property(nonatomic, strong, nullable) UIImage* icon;

    /** A Boolean value that determines whether user events are ignored and removed from the event queue. */
    @property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;
    - (instancetype _Nonnull ) init;
  @end

  @interface MFMutablePath: MFPath
    @property (readonly, getter=getCount) NSUInteger count;
    - (void)addCoordinate:(CLLocationCoordinate2D)coord;
    - (void)addLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude;
    - (CLLocationCoordinate2D)objectAtIndex:(NSUInteger)idx;
    - (void)insertCoordinate:(CLLocationCoordinate2D)coord atIndex:(NSUInteger)index;
    - (void)replaceCoordinateAtIndex:(NSUInteger)index withCoordinate:(CLLocationCoordinate2D)coord;
    - (void)removeCoordinateAtIndex:(NSUInteger)index;
    - (void)removeLastCoordinate;
    - (void)removeAllCoordinates;
  @end

  @interface MFOverlay: NSObject {
    @protected UInt32 _Id;
  }
    @property(nonatomic, weak, nullable) MFMapView* map;
    @property(nonatomic, readonly) UInt32 Id;
    @property(nonatomic, setter=setIsHidden:) bool isHidden;
    @property(nonatomic, setter=setZIndex:) float zIndex;
    @property(nonatomic, setter=setUserData:) NSObject* _Nullable userData;

    - (UInt32) getId;
    -(instancetype _Nonnull) init;
  @end
  
  @interface MFPath: NSObject
  @end
 
  @interface MFPolygon : MFOverlay
    @property(nonatomic, strong, nullable) MFPath *path;
    @property(nonatomic, strong, nullable) NSArray<MFPath *> *holes;

    /** The fill color. Defaults to blueColor. */
    @property(nonatomic, strong, nonnull) UIColor* fillColor;
    @property(nonatomic, strong, nonnull) UIColor* strokeColor;
    @property(nonatomic) CGFloat strokeWidth;

    /** A Boolean value that determines whether user events are ignored and removed from the event queue. */
    @property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;
    - (instancetype _Nonnull) init;
  @end

  typedef NS_ENUM(NSUInteger, MFPolylineStyle) {
      MFPolylineStyleSolid,
      MFPolylineStyleDotted
  };

  @interface MFPolyline : MFOverlay
    @property(nonatomic, strong, nullable) MFPath *path;
    @property(nonatomic) CGFloat width;
    @property(nonatomic) MFPolylineStyle style;
    @property(nonatomic, strong, nonnull) UIColor* color;

    /** A Boolean value that determines whether user events are ignored and removed from the event queue. */
    @property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;

    - (instancetype _Nonnull ) init;
    - (instancetype _Nonnull ) init: (nullable MFPath*) path __deprecated_msg("This method will be removed in future versions.  Use 'init:' instead of.");
    @end

  @interface MFProjection : NSObject
    - (instancetype _Nonnull ) init NS_UNAVAILABLE;
    - (instancetype _Nonnull ) init: (MFMapView* _Nonnull ) mapView;

    /** Maps an Earth coordinate to a point coordinate in the map's view. */
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate;

    /** Maps an Earth coordinate to a point coordinate at the elevation in the map's view. */
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate elevation: (double) elevation;

    /** Maps an Earth coordinate to a point coordinate in the map's view. */
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate camera: (MFCameraPosition* _Nonnull) camera;

    /** Maps an Earth coordinate to a point coordinate in the map's view. */
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate camera: (MFCameraPosition* _Nonnull) camera elevation: (double) elevation is3DMode: (bool) is3DMode;

    /** Maps a point coordinate in the map's view to an Earth coordinate. */
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point elevation: (double) elevation;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point camera: (MFCameraPosition* _Nonnull) camera;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point camera: (MFCameraPosition* _Nonnull) camera elevation: (double) elevation is3DMode: (bool) is3DMode;
  @end
  
  @interface MFServices : NSObject
    + (BOOL)provideAccessKey:(NSString *) accessKey __deprecated_msg("This method will be removed in future versions.  Please provide access key in Info.plist with string key: 'Map4dMapAccessKey'");
  @end
  
  @interface MFBuilding : MFOverlay
    @property(nonatomic, copy, nullable, readonly) NSString* buildingId;
    @property(nonatomic, strong, nullable) NSString* name;
    @property(nonatomic) CLLocationCoordinate2D position;
    @property(nonatomic, strong, nullable) NSString* model;
    @property(nonatomic, strong, nullable) NSString* texture;
    @property(nonatomic, strong, nullable) MFPath* coordinates;
    @property(nonatomic) double height;
    @property(nonatomic) double scale;
    @property(nonatomic) CGFloat bearing;
    @property(nonatomic) double elevation;
    @property(nonatomic, getter=isSelected) bool selected;
    @property(nonatomic, strong, nullable) NSMutableArray* types;
    @property(nonatomic, strong, nullable) NSMutableArray* places;
    @property(nonatomic) double minZoom;
    @property(nonatomic) double maxZoom;
    @property(nonatomic) NSDate* _Nullable startDate;
    @property(nonatomic) NSDate* _Nullable endDate;

    /** A Boolean value that determines whether user events are ignored and removed from the event queue. */
    @property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;
    - (instancetype _Nonnull) init;
  @end


##2. Swift

  ```swift
  class MFCameraPosition: NSObject {
    init(target: CLLocationCoordinate2D, zoom: Double) {}
    init(target: CLLocationCoordinate2D, zoom: Double, tilt: Double) {}
    init(target: CLLocationCoordinate2D, zoom: Double, bearing: Double) {}
    init(target: CLLocationCoordinate2D, zoom: Double, tilt: Double, bearing: Double) {}
    var target: CLLocationCoordinate2D?
    var zoom = 0.0
    var bearing = 0.0
    var tilt = 0.0
  }

  class MFCameraUpdate: NSObject {
    class func fit(_ bounds: MFCoordinateBounds?) -> MFCameraUpdate? {}
    class func fit(_ bounds: MFCoordinateBounds?, with edgeInsets: UIEdgeInsets) -> MFCameraUpdate? {}
    class func setTarget(_ target: CLLocationCoordinate2D) -> MFCameraUpdate? {}
    class func setTarget(_ target: CLLocationCoordinate2D, zoom: Double) -> MFCameraUpdate? {}
    class func setTarget(_ target: CLLocationCoordinate2D, zoom: Double, tilt: Double) -> MFCameraUpdate? {}
    class func setTarget(_ target: CLLocationCoordinate2D, zoom: Double, bearing: Double) -> MFCameraUpdate? {}
    class func setTarget(_ target: CLLocationCoordinate2D, zoom: Double, tilt: Double, bearing: Double) -> MFCameraUpdate? {}
    class func setCamera(_ camera: MFCameraPosition?) -> MFCameraUpdate? {}
  }
  
  class MFCircle: MFOverlay {
    var fillOpacity: CGFloat = 0.0
    /// The fill color. Defaults to redColor.
    var fillColor = UIColor.clear
    /// The color of this circle's outline. Defaults to blackColor
    var strokeColor = UIColor.clear
    /// Position on Earth of circle center.
    var position: CLLocationCoordinate2D?
    /// Radius of the circle in meters; must be positive.
    var radius = 0.0
    /// The width of the circle's outline in screen points.
    var strokeWidth = 0.0
    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    var userInteractionEnabled = false
    override init() {}
    init(_ position: CLLocationCoordinate2D, radius: Double, fill fillColor: UIColor?, fillOpacity: CGFloat) {
    }
  }

  class MFCoordinateBounds: NSObject {
    private(set) var northEast: CLLocationCoordinate2D?
    private(set) var southWest: CLLocationCoordinate2D?
    init(coordinate coord: CLLocationCoordinate2D, coordinate1 coord1: CLLocationCoordinate2D) {}
    init(path: MFPath) {}
    func includingCoordinate(_ coordinate: CLLocationCoordinate2D) -> MFCoordinateBounds {}
    func including(_ other: MFCoordinateBounds) -> MFCoordinateBounds {}
    func including(_ path: MFPath) -> MFCoordinateBounds {}
    func containsLatitude(_ latitude: Double) -> Bool {}
    func containsLongitude(_ longitude: Double) -> Bool {}
    func contains(_ coordinate: CLLocationCoordinate2D) -> Bool {}
  }

  class MFMapView: UIView {
    @IBOutlet weak var delegate: MFMapViewDelegate?
    private(set) var projection: MFProjection?
    var camera: MFCameraPosition?
    private(set) var settings: MFUISettings!

    override init(frame: CGRect) {}
    func setMyLocationEnabled(_ isMyLocationEnable: Bool) {}
    func setSelectedPlace(_ placeId: String?) {}
    func getSelectedPlace() -> String? {}
    func setFilterPlaces(_ filterPlaces: [String]?) {}
    func getFilterPlaces() -> [String] {}
    func setPOIsEnabled(_ enabled: Bool) {}
    func isPOIsEnabled() -> Bool {}
    func setBuildingsEnabled(_ enabled: Bool) {}
    func isBuildingsEnabled() -> Bool {}
    func setHiddenBuilding(_ buildingId: String) {}
    func setUnhiddenBuilding(_ buildingId: String) {}
    func setSelectedBuildings(_ buildingIds: [String]?) {}
    func setMaxNativeZoom(_ zoom: Double) {}
    func enable3DMode(_ enabled: Bool) {}
    func setTileUrl(_ url: String) {}
    func is3DMode() -> Bool {}
    func setMinZoom(_ minZoom: Double, maxZoom: Double) {}

    /*
    * Clears all markup that has been added to the map, including markers, polylines and ground
    * overlays.  This will not clear the visible location dot or reset the current mapType.
    */
    func clear() {}

    /*
    * Set time display for map
    * Default curent time
    * return  current time if date is NULL
    */
    func setTime(_ date: Date?) {}
    func enableWaterEffect(_ enabled: Bool) {}
    func camera(for bounds: MFCoordinateBounds, insets: UIEdgeInsets) -> MFCameraPosition? {}
    func camera(for bounds: MFCoordinateBounds) -> MFCameraPosition? {}
  }
  
  extension MFMapView {
    func animateCamera(_ cameraUpdate: MFCameraUpdate?) {}
    func moveCamera(_ cameraUpdate: MFCameraUpdate?) {}
  } 

  @objc protocol MFMapViewDelegate: NSObjectProtocol {
    @objc optional func mapview(_ mapView: MFMapView?, didTap marker: MFMarker?) -> Bool
    @objc optional func mapview(_ mapView: MFMapView?, didBeginDragging marker: MFMarker?)
    @objc optional func mapview(_ mapView: MFMapView?, didEndDragging marker: MFMarker?)
    @objc optional func mapview(_ mapView: MFMapView?, didDrag marker: MFMarker?)
    @objc optional func mapview(_ mapView: MFMapView?, didTapInfoWindowOf marker: MFMarker?)
    @objc optional func mapview(_ mapView: MFMapView?, didTap polyline: MFPolyline?)
    @objc optional func mapview(_ mapView: MFMapView?, didTap polygon: MFPolygon?)
    @objc optional func mapview(_ mapView: MFMapView?, didTap circle: MFCircle?)
    @objc optional func mapView(_ mapView: MFMapView?, willMove gesture: Bool)
    @objc optional func mapView(_ mapView: MFMapView?, moving position: MFCameraPosition?)
    @objc optional func mapView(_ mapView: MFMapView?, didChange position: MFCameraPosition?)
    @objc optional func mapView(_ mapView: MFMapView?, idleAt position: MFCameraPosition?)
    @objc optional func mapView(_ mapView: MFMapView?, didTapAtCoordinate coordinate: CLLocationCoordinate2D)
    @objc optional func mapView(_ mapView: MFMapView?, onModeChange is3DMode: Bool)
    @objc optional func mapView(_ mapView: MFMapView?, didTap building: MFBuilding?)
    @objc optional func mapView(_ mapView: MFMapView?, didTap poi: MFPOI?)
    @objc optional func mapView(_ mapView: MFMapView?, didTapMyLocation location: CLLocationCoordinate2D)
    @objc optional func shouldChangeMapMode(for mapView: MFMapView?) -> Bool
    @objc optional func didTapMyLocationButton(for mapView: MFMapView?) -> Bool
    @objc optional func mapView(_ mapView: MFMapView?, markerInfoWindow marker: MFMarker?) -> UIView?
  }
    
  class MFMarker: MFOverlay {
    var position: CLLocationCoordinate2D?
    var groundAnchor = CGPoint.zero
    var elevation = 0.0
    var rotation = 0.0
    var draggable = false
    /// The info window anchor specifies the point in the icon image at which to anchor the info window,
    /// which will be displayed directly above this point. This point is specified within the same space
    /// as groundAnchor.
    var infoWindowAnchor = CGPoint.zero
    /// Title, a short description of the overlay. Some overlays, such as markers, will display the title on the map. The title is also the default accessibility text.
    var title: String?
    /// Snippet text, shown beneath the title in the info window when selected.
    var snippet: String?
    var iconView: UIView?
    var icon: UIImage?
    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    var userInteractionEnabled = false

    override init() {}
  }
  
  class MFMutablePath: MFPath {
    private(set) var count = 0
    func addCoordinate(_ coord: CLLocationCoordinate2D) {}
    func addLatitude(_ latitude: CLLocationDegrees, longitude: CLLocationDegrees) {}
    func object(at idx: Int) -> CLLocationCoordinate2D {}
    func insertCoordinate(_ coord: CLLocationCoordinate2D, at index: Int) {}
    func replaceCoordinate(at index: Int, withCoordinate coord: CLLocationCoordinate2D) {}
    func removeCoordinate(at index: Int) {}
    func removeLastCoordinate() {}
    func removeAllCoordinates() {}
  }
  
  class MFOverlay: NSObject {
    weak var map: MFMapView?
    private(set) var anId: UInt32 = 0
    var isHidden = false
    var zIndex: Float = 0.0
    var userData: NSObject?
    func getId() -> UInt32 {}
    override init() {}
  }

  class MFPath: NSObject {
  }
  
  class MFPolygon: MFOverlay {
    var path: MFPath?
    var holes: [MFPath]?
    /// The fill color. Defaults to blueColor.
    var fillColor = UIColor.clear
    var strokeColor = UIColor.clear
    var strokeWidth: CGFloat = 0.0
    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    var userInteractionEnabled = false
    init() {}
  }

  enum MFPolylineStyle : Int {
    case solid
    case dotted
  }

  class MFPolyline: MFOverlay {
    var path: MFPath?
    var width: CGFloat = 0.0
    var style: MFPolylineStyle?
    var color = UIColor.clear
    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    var userInteractionEnabled = false
    init() {}
    init(_ path: MFPath?) {}
  }
  
  class MFProjection: NSObject {
    override init() {}
    init(_ mapView: MFMapView) {}
    /// Maps an Earth coordinate to a point coordinate in the map's view.
    func point(forCoordinate coordinate: CLLocationCoordinate2D) -> CGPoint {}
    /// Maps an Earth coordinate to a point coordinate at the elevation in the map's view.
    func point(forCoordinate coordinate: CLLocationCoordinate2D, elevation: Double) -> CGPoint {}
    /// Maps an Earth coordinate to a point coordinate in the map's view.
    func point(forCoordinate coordinate: CLLocationCoordinate2D, camera: MFCameraPosition) -> CGPoint {}
    /// Maps an Earth coordinate to a point coordinate in the map's view.
    func point(forCoordinate coordinate: CLLocationCoordinate2D, camera: MFCameraPosition, elevation: Double, is3DMode: Bool) -> CGPoint {}
    /// Maps a point coordinate in the map's view to an Earth coordinate.
    func coordinate(for point: CGPoint) -> CLLocationCoordinate2D {}
    func coordinate(for point: CGPoint, elevation: Double) -> CLLocationCoordinate2D {}
    func coordinate(for point: CGPoint, camera: MFCameraPosition) -> CLLocationCoordinate2D {}
    func coordinate(for point: CGPoint, camera: MFCameraPosition, elevation: Double, is3DMode: Bool) -> CLLocationCoordinate2D {}
  } 

  class MFServices: NSObject {
    class func provideAccessKey(_ accessKey: String?) -> Bool {}
  }

  class MFBuilding: MFOverlay {
    private(set) var buildingId: String?
    var name: String?
    var position: CLLocationCoordinate2D?
    var model: String?
    var texture: String?
    var coordinates: MFPath?
    var height = 0.0
    var scale = 0.0
    var bearing: CGFloat = 0.0
    var elevation = 0.0
    var selected = false
    var types: [AnyHashable]?
    var places: [AnyHashable]?
    var minZoom = 0.0
    var maxZoom = 0.0
    var startDate: Date?
    var endDate: Date?
    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    var userInteractionEnabled = false
    init() { }
  }
  

  License
  -------
  
  Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
