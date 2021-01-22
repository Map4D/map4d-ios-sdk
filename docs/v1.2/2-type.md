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
    // Setter
    + (MFCameraUpdate *) fitBounds: (MFCoordinateBounds *) _bounds;
    + (MFCameraUpdate *) fitBounds:(MFCoordinateBounds *) _bounds withEdgeInsets:(UIEdgeInsets) _edgeInsets;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom tilt :(float) tilt ;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom bearing: (float) bearing;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom tilt :(float) tilt bearing: (float) bearing;
    + (MFCameraUpdate *)setCamera:(MFCameraPosition *) camera;
  @end
 
  @interface MFCircle : MFOverlay
    @property(nonatomic, assign) bool visible;
    @property(nonatomic, assign) CGFloat fillOpacity;
    /** The fill color. Defaults to blueColor. */
    @property(nonatomic, strong) UIColor* _Nullable fillColor;
    /** Position on Earth of circle center. */
    @property(nonatomic, assign) CLLocationCoordinate2D position;
    /** Radius of the circle in meters; must be positive. */
    @property(nonatomic, assign) double radius;
    /** The width of the circle's outline in screen points. */
    @property(nonatomic, assign) double strokeWidth;
    /** The color of this circle's outline. */
    @property(nonatomic, strong) UIColor* _Nullable strokeColor;
    
    - (instancetype _Nonnull ) init NS_UNAVAILABLE;
    - (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (double) radius;
    - (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (double) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity;
    - (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (double) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity strokeWidth: (double) strokeWidth strokeColor: (UIColor*) strokeColor;
    - (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (double) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity strokeWidth: (double) strokeWidth strokeColor: (UIColor*) strokeColor zIndex: (float) zIndex;
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

  typedef NS_ENUM(NSUInteger, MFSwitchMode) {
    MFSwitchModeDefault,
    MFSwitchModeAuto2DTo3D,
    MFSwitchModeAuto3DTo2D,
    MFSwitchModeAuto,
    MFSwitchModeManual
  };
  
  @interface MFMapView : UIView
    @property(nonatomic, weak, nullable) IBOutlet id<MFMapViewDelegate> delegate;
    @property(nonatomic, readonly) MFProjection * _Nullable projection;
    @property(nonatomic) MFSwitchMode switchMode;
    @property(nonatomic, copy) MFCameraPosition * _Nullable camera;
    
    - (instancetype _Nonnull )initWithFrame: (CGRect)frame;
    - (void) setMyLocationEnabled: (bool) _isMyLocationEnable;
    - (void) setSelectedPlace: (NSString* _Nullable) placeId;
    - (NSString* _Nullable) getSelectedPlace;
    - (void) setFilterPlaces: (NSArray<NSString*>* _Nullable) filterPlaces;
    - (NSArray<NSString*>* _Nonnull) getFilterPlaces;
    - (void) setPlacesEnabled: (bool) enabled;
    - (bool) isPlacesEnabled;
    - (void) setMaxNativeZoom: (double) zoom;
    - (void) enable3DMode: (bool) enabled;
    - (bool) is3DMode;
    - (void) setMinZoom: (double) minZoom maxZoom: (double) maxZoom;
    - (void) clear;
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
    - (void)mapview: (MFMapView*)  mapView didTapPolyline: (MFPolyline*) polyline;
    - (void)mapview: (MFMapView*)  mapView didTapPolygon: (MFPolygon*) polygon;
    - (void)mapview: (MFMapView*)  mapView didTapCircle: (MFCircle*) circle;
    - (void)mapView: (MFMapView*)  mapView willMove: (BOOL) gesture;
    - (void)mapView: (MFMapView*)  mapView movingCameraPosition: (MFCameraPosition*) position;
    - (void)mapView: (MFMapView*)  mapView didChangeCameraPosition:(MFCameraPosition*) position;
    - (void)mapView: (MFMapView*)  mapView idleAtCameraPosition: (MFCameraPosition *) position;
    - (void)mapView: (MFMapView*)  mapView didTapAtCoordinate: (CLLocationCoordinate2D) coordinate;
    - (void)mapView: (MFMapView*)  mapView onModeChange: (bool) is3DMode;
    - (void)mapView: (MFMapView*)  mapView didTapObject: (MFObject*) object;
    - (void)mapView: (MFMapView*)  mapView didTapPlace: (MFPlace*) place;
    - (void)mapView: (MFMapView*)  mapView didTapMyLocation: (CLLocationCoordinate2D) location;
    
    - (BOOL)didTapMyLocationButtonForMapView: (MFMapView*) mapView;
    - (UIView *) mapView: (MFMapView *) mapView markerInfoWindow: (MFMarker *) marker;
  @end
  
  @interface MFMarker: MFOverlay
    @property(nonatomic) CLLocationCoordinate2D position;
    @property(nonatomic) CGPoint groundAnchor;
    @property(nonatomic, strong, setter=setIconView:) UIView * _Nullable iconView;
    @property(nonatomic) double elevation;
    @property(nonatomic, strong) UIImage * _Nullable icon;
    @property(nonatomic, assign, setter=setVisible:) bool isVisible;
    @property(nonatomic, strong, nullable) NSString *title;
    @property(nonatomic, copy, nullable) NSString *snippet;
    @property(nonatomic, assign) CGPoint infoWindowAnchor;
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
  
  @interface MFObject: NSObject
    @property(nonatomic, strong) NSString* _Nullable Id;
    @property(nonatomic, strong) NSString* _Nullable name;
    @property(nonatomic, strong, nullable) NSMutableArray* places;
    @property(nonatomic) double  scale;
    @property(nonatomic) double  bearing;
    @property(nonatomic) CLLocationCoordinate2D coordinate;
    @property(nonatomic) double elevation;
    @property(nonatomic) double height;
    @property(nonatomic, strong) MFCameraPosition* _Nullable camera;
    @property(nonatomic, strong) MFModel* _Nullable model;
    @property(nonatomic, strong, nullable) NSMutableArray* types;
    @property(nonatomic) double minZoom;
    @property(nonatomic) double maxZoom;
    @property(nonatomic) NSDate* _Nullable startDate;
    @property(nonatomic) NSDate* _Nullable endDate;
  @end

  @interface MFOverlay: NSObject
    @property(nonatomic, weak) MFMapView * _Nullable map;
    @property(nonatomic, readonly, getter=getId) long Id;
    @property(nonatomic, setter=setZIndex:) float zIndex;
    - (long) getId;
  @end
  
  @interface MFPath: NSObject
  @end
 
  @interface MFPolygon : MFOverlay
    @property(nonatomic, strong, nullable) MFPath *path;
    @property(nonatomic, strong, nullable) NSArray<MFPath *> *holes;
    @property(nonatomic, assign) bool visible;
    @property(nonatomic, assign) CGFloat fillOpacity;
    /** The fill color. Defaults to blueColor. */
    @property(nonatomic, strong) UIColor* _Nullable fillColor;
  
    - (instancetype _Nonnull ) init NS_UNAVAILABLE;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path holes: (NSArray<MFPath *>* _Nonnull) holes;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path fillColor: (UIColor* _Nonnull) color;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path fillColor: (UIColor* _Nonnull) color zIndex: (float) zIndex;
  @end

  @interface MFPolyline : MFOverlay
    @property(nonatomic, strong, nullable) MFPath *path;
    @property(nonatomic, assign) bool visible;
    @property(nonatomic, assign) CGFloat width;
    @property(nonatomic, assign) CGFloat opacity;
    @property(nonatomic, assign) MFPolylineStyle style;
    @property(nonatomic, strong) UIColor* _Nullable color;
    @property(nonatomic, assign, readonly) bool closed;
    
    - (instancetype _Nonnull ) init NS_UNAVAILABLE;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path closed: (bool) closed;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path color: (UIColor* _Nullable) color width: (CGFloat) width opacity: (CGFloat) opacity style: (MFPolylineStyle) style closed: (bool) closed;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path color: (UIColor* _Nullable) color width: (CGFloat) width opacity: (CGFloat) opacity style: (MFPolylineStyle) style closed: (bool) closed zIndex: (float) zIndex;
  @end

  @interface MFProjection : NSObject
    - (instancetype _Nonnull ) init NS_UNAVAILABLE;
    - (instancetype _Nonnull ) init: (MFMapView* _Nonnull ) mapView;
    
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate;
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate elevation: (double) elevation;
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate camera: (MFCameraPosition* _Nonnull) camera;
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate camera: (MFCameraPosition* _Nonnull) camera elevation: (double) elevation is3DMode: (bool) is3DMode;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point elevation: (double) elevation;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point camera: (MFCameraPosition* _Nonnull) camera;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point camera: (MFCameraPosition* _Nonnull) camera elevation: (double) elevation is3DMode: (bool) is3DMode;
  @end
  
  @interface MFServices : NSObject
    + (BOOL)provideAccessKey:(NSString *) accessKey;
  @end
  
  @interface MFTileArea: MFOverlay
    @property(nonatomic, strong) MFCoordinateBounds* bounds;
    @property(nonatomic, strong) NSString* mapUrl;
    @property(nonatomic, strong) NSNumber* minZoom;
    @property(nonatomic, strong) NSNumber* maxZoom;
    
    - (instancetype) init: (MFCoordinateBounds*) bounds mapUrl: (NSString*) url minZoom: (NSNumber*) minZoom maxZoom: (NSNumber*) maxZoom;
    - (instancetype) init: (MFCoordinateBounds*) bounds mapUrl: (NSString*) url;
    - (void) update: (MFCoordinateBounds*) bounds mapUrl: (NSString*) url minZoom: (NSNumber*) minZoom maxZoom: (NSNumber*) maxZoom;
    - (void) update: (MFCoordinateBounds*) bounds mapUrl: (NSString*) url;
    - (void) update: (MFCoordinateBounds*) bounds;
  @end
  
  @interface MFPlace: NSObject
    @property(nonatomic, strong) NSString* _Nullable Id;
    @property(nonatomic, strong) NSString* _Nullable name;
    @property(nonatomic, strong) NSString* _Nullable address;
    @property(nonatomic) CLLocationCoordinate2D coordinate;
    @property(nonatomic, strong) NSString* _Nullable iconColor;
    @property(nonatomic, strong) NSString* _Nullable iconType;
  @end
  ```
  
##2. Swift

  ```swift
  open class MFCameraPosition : NSObject {
    public init!(target: CLLocationCoordinate2D, zoom: Double)
    public init!(target: CLLocationCoordinate2D, zoom: Double, tilt: Double)
    public init!(target: CLLocationCoordinate2D, zoom: Double, bearing: Double)
    public init!(target: CLLocationCoordinate2D, zoom: Double, tilt: Double, bearing: Double)
    
    open var target: CLLocationCoordinate2D
    open var zoom: Double
    open var bearing: Double
    open var tilt: Double
  }
  
  open class MFCameraUpdate : NSObject {
    // Setter
    open class func fit(_ _bounds: MFCoordinateBounds!) -> MFCameraUpdate!
    open class func fit(_ _bounds: MFCoordinateBounds!, withEdgeInsets _edgeInsets: Any!) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float, tilt: Float) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float, bearing: Float) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float, tilt: Float, bearing: Float) -> MFCameraUpdate!
    open class func setCamera(_ camera: MFCameraPosition!) -> MFCameraUpdate!
  }
  
  open class MFCircle : MFOverlay {
    open var visible: Bool
    open var fillOpacity: CGFloat
    /** The fill color. Defaults to blueColor. */
    open var fillColor: UnsafeMutablePointer<CMColor>?
    /** Position on Earth of circle center. */
    open var position: CLLocationCoordinate2D
    /** Radius of the circle in meters; must be positive. */
    open var radius: Double
    /** The width of the circle's outline in screen points.  */
    open var strokeWidth: Double
    /** The color of this circle's outline. */
    open var strokeColor: UnsafeMutablePointer<Int32>?
    
    public init(_ position: CLLocationCoordinate2D, radius: Double)
    public init(_ position: CLLocationCoordinate2D, radius: Double, fillColor: Any!, fillOpacity: CGFloat)
    public init(_ position: CLLocationCoordinate2D, radius: Double, fillColor: Any!, fillOpacity: CGFloat, strokeWidth: Double, strokeColor: Any!)
    public init(_ position: CLLocationCoordinate2D, radius: Double, fillColor: Any!, fillOpacity: CGFloat, strokeWidth: Double, strokeColor: Any!, zIndex: Float)
  }
  
  open class MFCoordinateBounds : NSObject {
    open var northEast: CLLocationCoordinate2D { get }
    open var southWest: CLLocationCoordinate2D { get }
    public init(coordinate coord: CLLocationCoordinate2D, coordinate1 coord1: CLLocationCoordinate2D)
    public init(path: MFPath)
    open func includingCoordinate(_ coordinate: CLLocationCoordinate2D) -> MFCoordinateBounds
    open func includingBounds(_ other: MFCoordinateBounds) -> MFCoordinateBounds
    open func includingPath(_ path: MFPath) -> MFCoordinateBounds
    open func containsLatitude(_ latitude: Double) -> Bool
    open func containsLongitude(_ longitude: Double) -> Bool
    open func contains(_ coordinate: CLLocationCoordinate2D) -> Bool
  }

  
  public enum MFSwitchMode : UInt {
    case `default`
    case auto2DTo3D
    case auto3DTo2D
    case auto
    case manual
  }
  
  open class MFMapView {
    open var projection: MFProjection? { get }
    open var switchMode: MFSwitchMode
    @NSCopying open var camera: MFCameraPosition?
    public init(frame: CGRect)
    open func setMyLocationEnabled(_ _isMyLocationEnable: Bool)
    open func setSelectedPlace(_ placeId: String?)
    open func getSelectedPlace() -> String?
    open func setFilterPlaces(_ filterPlaces: [String]?)
    open func getFilterPlaces() -> [String]
    open func setPlacesEnabled(_ enabled: Bool)
    open func isPlacesEnabled() -> Bool
    open func setMaxNativeZoom(_ zoom: Double)
    open func enable3DMode(_ enabled: Bool)
    open func is3DMode() -> Bool
    open func setMinZoom(_ minZoom: Double, maxZoom: Double)
    open func clear()
    open func setTime(_ date: Date?)
    open func enableWaterEffect(_ enabled: Bool)
    open func camera(for bounds: MFCoordinateBounds, insets: Any!) -> MFCameraPosition?
    open func camera(for bounds: MFCoordinateBounds) -> MFCameraPosition?
  }
  
  extension MFMapView {
    open func animateCamera(_ cameraUpdate: MFCameraUpdate!)
    open func moveCamera(_ cameraUpdate: MFCameraUpdate!)
  }
  
  public protocol MFMapViewDelegate : NSObjectProtocol {
    optional func mapview(_ mapView: MFMapView!, didTap marker: MFMarker!) -> Bool
    optional func mapview(_ mapView: MFMapView!, didTap polyline: MFPolyline!)
    optional func mapview(_ mapView: MFMapView!, didTap polygon: MFPolygon!)
    optional func mapview(_ mapView: MFMapView!, didTap circle: MFCircle!)
    optional func mapView(_ mapView: MFMapView!, willMove gesture: Bool)
    optional func mapView(_ mapView: MFMapView!, moving position: MFCameraPosition!)
    optional func mapView(_ mapView: MFMapView!, didChange position: MFCameraPosition!)
    optional func mapView(_ mapView: MFMapView!, idleAt position: MFCameraPosition!)
    optional func mapView(_ mapView: MFMapView!, didTapAt coordinate: CLLocationCoordinate2D)
    optional func mapView(_ mapView: MFMapView!, onModeChange is3DMode: Bool)
    optional func mapView(_ mapView: MFMapView!, didTap object: MFObject!)
    optional func mapView(_ mapView: MFMapView!, didTap place: MFPlace!)
    optional func mapView(_ mapView: MFMapView!, didTapMyLocation location: CLLocationCoordinate2D)
    optional func didTapMyLocationButton(for mapView: MFMapView!) -> Bool
    optional func mapView(_ mapView: MFMapView!, markerInfoWindow marker: MFMarker!) -> Any!
  }
  
  open class MFMarker : MFOverlay {
    open var position: CLLocationCoordinate2D
    open var groundAnchor: CGPoint
    open var iconView: UnsafeMutablePointer<Int32>?
    open var elevation: Double
    open var icon: UnsafeMutablePointer<Int32>?
    open var isVisible: Bool
    open var title: String?
    open var snippet: String?
    open var infoWindowAnchor: CGPoint
  }
  
  open class MFMutablePath : MFPath {
    open var count: UInt { get }
    open func add(_ coord: CLLocationCoordinate2D)
    open func addLatitude(_ latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    open func object(at idx: UInt) -> CLLocationCoordinate2D
    open func insert(_ coord: CLLocationCoordinate2D, at index: UInt)
    open func replaceCoordinate(at index: UInt, with coord: CLLocationCoordinate2D)
    open func removeCoordinate(at index: UInt)
    open func removeLastCoordinate()
    open func removeAllCoordinates()
  }
  
  open class MFObject : NSObject {
    open var id: String?
    open var name: String?
    open var places: NSMutableArray?
    open var scale: Double
    open var bearing: Double
    open var coordinate: CLLocationCoordinate2D
    open var elevation: Double
    open var height: Double
    open var camera: MFCameraPosition?
    open var model: MFModel?
    open var types: NSMutableArray?
    open var minZoom: Double
    open var maxZoom: Double
    open var startDate: Date?
    open var endDate: Date?
  }
  
  open class MFOverlay : NSObject {
    weak open var map: MFMapView?
    open var id: Int { get }
    open var zIndex: Float
  }
  
  open class MFPath : NSObject {
  }
  
  open class MFPolygon : MFOverlay {
    open var path: MFPath?
    open var holes: [MFPath]?
    open var visible: Bool
    open var fillOpacity: CGFloat
    /** The fill color. Defaults to blueColor. */
    open var fillColor: UnsafeMutablePointer<Int32>?
    
    public init(_ path: MFPath?)
    public init(_ path: MFPath?, holes: [MFPath])
    public init(_ path: MFPath?, fillColor color: Any!)
    public init(_ path: MFPath?, fillColor color: Any!, zIndex: Float)
  }
 
 open class MFPolyline : MFOverlay {
     open var path: MFPath?
     open var visible: Bool
     open var width: CGFloat
     open var opacity: CGFloat
     open var style: MFPolylineStyle
     open var color: UnsafeMutablePointer<Int32>?
     open var closed: Bool { get }
     
     public init(_ path: MFPath?)
     public init(_ path: MFPath?, closed: Bool)
     public init(_ path: MFPath?, color: Any!, width: CGFloat, opacity: CGFloat, style: MFPolylineStyle, closed: Bool)
     public init(_ path: MFPath?, color: Any!, width: CGFloat, opacity: CGFloat, style: MFPolylineStyle, closed: Bool, zIndex: Float)
 }
  
  open class MFProjection : NSObject {
    public init(_ mapView: MFMapView)
    open func point(for coordinate: CLLocationCoordinate2D) -> CGPoint
    open func point(for coordinate: CLLocationCoordinate2D, elevation: Double) -> CGPoint
    open func point(for coordinate: CLLocationCoordinate2D, camera: MFCameraPosition) -> CGPoint
    open func point(for coordinate: CLLocationCoordinate2D, camera: MFCameraPosition, elevation: Double, is3DMode: Bool) -> CGPoint
    open func coordinate(for point: CGPoint) -> CLLocationCoordinate2D
    open func coordinate(for point: CGPoint, elevation: Double) -> CLLocationCoordinate2D
    open func coordinate(for point: CGPoint, camera: MFCameraPosition) -> CLLocationCoordinate2D
    open func coordinate(for point: CGPoint, camera: MFCameraPosition, elevation: Double, is3DMode: Bool) -> CLLocationCoordinate2D
  }
  
  open class MFServices : NSObject {
    open class func provideAccessKey(_ accessKey: String) -> Bool
  }
  
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
  
  open class MFPlace : NSObject {
    open var id: String?
    open var name: String?
    open var address: String?
    open var coordinate: CLLocationCoordinate2D
    open var iconColor: String?
    open var iconType: String?
  }
  
  ```
  
  
  License
  -------
  
  Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
