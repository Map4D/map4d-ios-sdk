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

  ```swift
  @interface MFCameraPosition: NSObject
    - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
    - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom duration: (long) duration;
    - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt ;
    - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (float) bearing;
    - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (float) bearing;
    @property(nonatomic) CLLocationCoordinate2D target;
    @property(nonatomic) double zoom;
    @property(nonatomic) float bearing;
    @property(nonatomic) double tilt;
    @property(nonatomic) long duration;
  @end
 
  @interface MFCameraUpdate : NSObject
    // Setter
    + (MFCameraUpdate *) fitBounds: (MFCoordinateBounds *) _bounds;
    + (MFCameraUpdate *) fitBounds:(MFCoordinateBounds *) _bounds withEdgeInsets:(UIEdgeInsets) _edgeInsets;
    + (MFCameraUpdate *) fitBounds: (MFCoordinateBounds *) _bounds withEdgeInsets:(UIEdgeInsets) _edgeInsets duration: (long) _duration;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom tilt :(float) tilt ;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom bearing: (float) bearing;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom tilt :(float) tilt bearing: (float) bearing;
    + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom duration: (long) duration;
    + (MFCameraUpdate *)setCamera:(MFCameraPosition *) camera;
    + (MFCameraUpdate *)setCamera:(MFCameraPosition *) camera duration: (long) duration;
    // Getter
    - (MFCoordinateBounds *) getBounds;
    - (UIEdgeInsets) getEdgeInsets;
    - (CLLocation*) getTarget;
    - (float) getZoom;
    - (long) getDuration;
    - (float) getTilt;
    - (float) getBearing;
  @end
 
  @interface MFCircle : MFOverlay
    @property(nonatomic, assign) bool visible;
    @property(nonatomic, assign) CGFloat fillOpacity;
    @property(nonatomic, strong) UIColor* _Nullable fillColor;
    @property(nonatomic, assign) CLLocationCoordinate2D position;
    @property(nonatomic, assign) CLLocationDistance radius;
    - (instancetype _Nonnull ) init NS_UNAVAILABLE;
    - (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (CLLocationDistance) radius;
    - (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (CLLocationDistance) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity;
  @end
 
  @interface MFCoordinateBounds : NSObject
    @property(nonatomic, readonly, getter=northEast) CLLocationCoordinate2D northEast;
    @property(nonatomic, readonly, getter=southWest) CLLocationCoordinate2D southWest;
    - (instancetype) initWithCoordinate:(CLLocationCoordinate2D)coord coordinate1:(CLLocationCoordinate2D)coord1;
    - (instancetype) initWithPath: (MFPath *)path;
    - (id)includingCoordinate:(CLLocationCoordinate2D)coordinate;
    - (id)includingBounds:(MFCoordinateBounds *)other;
    - (id)includingPath:(MFPath *)path;
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
    @property (nonatomic, strong, setter=setMapUrl:) NSString* _Nullable mapUrl;
    @property(nonatomic, weak, nullable) IBOutlet id<MFMapViewDelegate> delegate;
    @property(nonatomic, readonly) MFProjection * _Nullable projection;
    @property(nonatomic) MFSwitchMode switchMode;
    @property(nonatomic, copy) MFCameraPosition * _Nullable camera;
    - (instancetype _Nonnull )initWithFrame: (CGRect)frame;
    - (void) setMyLocationEnabled: (bool) _isMyLocationEnable;
    - (void) setMaxNativeZoom: (double) zoom;
    - (void) enable3dMode: (bool) enabled;
    - (bool) is3dMode;
    - (void) setMinZoom: (double) minZoom maxZoom: (double) maxZoom;
    - (void) clear;
    - (void) setTime: (nullable NSDate*) date;
  @end
 
  @interface MFMapView (Annimation)
    // Animation
    - (void) animateWithCameraUpdate:(MFCameraUpdate *) cameraUpdate;
    - (void) animateToCameraPosition:(MFCameraPosition *) cameraPosition;
    - (void) animateToLocation:(CLLocationCoordinate2D) position;
    - (void) animateToZoom: (float) zoom;
    // Move To
    - (void) moveTo: (CLLocationCoordinate2D) latLng zoom: (double) zoom duration: (long) duration;
    - (void) moveTo: (CLLocationCoordinate2D) latLng zoom: (double) zoom;
    - (void) moveTo: (CLLocationCoordinate2D) latLng ;
    - (void) moveCamera: (MFCameraUpdate* ) cameraUpdate;
    - (void) moveCameraPosition: (MFCameraPosition* ) position;
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
    - (void)mapView: (MFMapView*)  mapView onModeChange: (bool) is3dMode;
    - (void)mapView: (MFMapView*)  mapView didTapObject: (MFObject*) object;
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
    @property(nonatomic, assign) float zIndex;
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
    @property(nonatomic) double heightScale;
    @property(nonatomic, strong) MFCameraPosition* _Nullable camera;
    @property(nonatomic, strong) MFModel* _Nullable model;
    @property(nonatomic, strong, nullable) NSMutableArray* types;
    @property(nonatomic) bool isVerified;
    @property(nonatomic) double minZoom;
    @property(nonatomic) double maxZoom;
    @property(nonatomic) NSDate* _Nullable startDate;
    @property(nonatomic) NSDate* _Nullable endDate;
  @end

  @interface MFOverlay: NSObject
    @property(nonatomic, weak) MFMapView * _Nullable map;
    @property(nonatomic, readonly, getter=getId) long Id;
    - (long) getId;
  @end
  
  @interface MFPath: NSObject
  @end
 
  @interface MFPolygon : MFOverlay
    @property(nonatomic, strong, nullable) MFPath *path;
    @property(nonatomic, strong, nullable) NSArray<MFPath *> *holes;
    @property(nonatomic, assign) bool visible;
    @property(nonatomic, assign) CGFloat fillOpacity;
    @property(nonatomic, strong) UIColor* _Nullable fillColor;
    - (instancetype _Nonnull ) init NS_UNAVAILABLE;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path holes: (NSArray<MFPath *>* _Nonnull) holes;
    - (instancetype _Nonnull ) init: (MFPath* _Nullable) path fillColor: (UIColor* _Nonnull) color;
  @end

  @interface MFProjection : NSObject
    - (instancetype _Nonnull ) init NS_UNAVAILABLE;
    - (instancetype _Nonnull ) init: (MFMapView* _Nonnull ) mapView;
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate;
    - (CGPoint) pointForCoordinate:(CLLocationCoordinate2D) coordinate withElevation: (double) elevation;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point;
    - (CLLocationCoordinate2D) coordinateForPoint:(CGPoint) point withElevation: (double) elevation;
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
  ```
  
##2. Swift

  ```swift
  open class MFCameraPosition : NSObject {
    public init!(target: CLLocationCoordinate2D, zoom: Double)
    public init!(target: CLLocationCoordinate2D, zoom: Double, duration: Int)
    public init!(target: CLLocationCoordinate2D, zoom: Double, tilt: Double)
    public init!(target: CLLocationCoordinate2D, zoom: Double, bearing: Float)
    public init!(target: CLLocationCoordinate2D, zoom: Double, tilt: Double, bearing: Float)
    open var target: CLLocationCoordinate2D
    open var zoom: Double
    open var bearing: Float
    open var tilt: Double
    open var duration: Int
  }
  
  open class MFCameraUpdate : NSObject {
    // Setter
    open class func fit(_ _bounds: MFCoordinateBounds!) -> MFCameraUpdate!
    open class func fit(_ _bounds: MFCoordinateBounds!, with _edgeInsets: UIEdgeInsets) -> MFCameraUpdate!
    open class func fit(_ _bounds: MFCoordinateBounds!, with _edgeInsets: UIEdgeInsets, duration _duration: Int) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float, tilt: Float) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float, bearing: Float) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float, tilt: Float, bearing: Float) -> MFCameraUpdate!
    open class func setTarget(_ target: CLLocationCoordinate2D, zoom: Float, duration: Int) -> MFCameraUpdate!
    open class func setCamera(_ camera: MFCameraPosition!) -> MFCameraUpdate!
    open class func setCamera(_ camera: MFCameraPosition!, duration: Int) -> MFCameraUpdate!

    // Getter
    open func getBounds() -> MFCoordinateBounds!
    open func getEdgeInsets() -> UIEdgeInsets
    open func getTarget() -> CLLocation!
    open func getZoom() -> Float
    open func getDuration() -> Int
    open func getTilt() -> Float
    open func getBearing() -> Float
  }

  open class MFCircle : MFOverlay {
    open var visible: Bool
    open var fillOpacity: CGFloat
    open var fillColor: UIColor?
    open var position: CLLocationCoordinate2D
    open var radius: CLLocationDistance
    public init(_ position: CLLocationCoordinate2D, radius: CLLocationDistance)
    public init(_ position: CLLocationCoordinate2D, radius: CLLocationDistance, fill fillColor: UIColor, fillOpacity: CGFloat)
  }

  open class MFCoordinateBounds : NSObject {
    open var northEast: CLLocationCoordinate2D { get }
    open var southWest: CLLocationCoordinate2D { get }    
    public init!(coordinate coord: CLLocationCoordinate2D, coordinate1 coord1: CLLocationCoordinate2D)
    public init!(path: MFPath!)
    open func includingCoordinate(_ coordinate: CLLocationCoordinate2D) -> Any!
    open func includingBounds(_ other: MFCoordinateBounds!) -> Any!
    open func includingPath(_ path: MFPath!) -> Any!
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
  
  extension MFMapView {
    // Animation
    open func animate(with cameraUpdate: MFCameraUpdate!)
    open func animate(to cameraPosition: MFCameraPosition!)
    open func animate(toLocation position: CLLocationCoordinate2D)
    open func animate(toZoom zoom: Float)
    
    // Move To
    open func move(to latLng: CLLocationCoordinate2D, zoom: Double, duration: Int)
    open func move(to latLng: CLLocationCoordinate2D, zoom: Double)
    open func move(to latLng: CLLocationCoordinate2D)
    open func moveCamera(_ cameraUpdate: MFCameraUpdate!)
    open func move(_ position: MFCameraPosition!)
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
    optional func mapView(_ mapView: MFMapView!, onModeChange is3dMode: Bool)
    optional func mapView(_ mapView: MFMapView!, didTap object: MFObject!)
    optional func mapView(_ mapView: MFMapView!, didTapMyLocation location: CLLocationCoordinate2D)
    optional func didTapMyLocationButton(for mapView: MFMapView!) -> Bool
    @available(iOS 2.0, *)
    optional func mapView(_ mapView: MFMapView!, markerInfoWindow marker: MFMarker!) -> UIView!
  }

  open class MFMarker : MFOverlay {
    open var position: CLLocationCoordinate2D
    open var groundAnchor: CGPoint
    open var iconView: UIView?
    open var elevation: Double
    open var icon: UIImage?
    open var isVisible: Bool
    open var title: String?
    open var snippet: String?
    open var infoWindowAnchor: CGPoint
    open var zIndex: Float
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
    open var heightScale: Double
    open var camera: MFCameraPosition?
    open var model: MFModel?
    open var types: NSMutableArray?
    open var isVerified: Bool
    open var minZoom: Double
    open var maxZoom: Double
    open var startDate: Date?
    open var endDate: Date?
  }
    
  open class MFOverlay : NSObject {
    weak open var map: MFMapView?
    open var id: Int { get }
  }
  
  open class MFPath : NSObject {
  }
  
  open class MFPolygon : MFOverlay {
    open var path: MFPath?
    open var holes: [MFPath]?
    open var visible: Bool
    open var fillOpacity: CGFloat
    open var fillColor: UIColor?
    public init(_ path: MFPath?)
    public init(_ path: MFPath?, holes: [MFPath])
    public init(_ path: MFPath?, fill color: UIColor)
  }
  
  open class MFPolyline : MFOverlay {
    open var path: MFPath?
    open var visible: Bool
    open var width: CGFloat
    open var opacity: CGFloat
    open var color: UIColor?
    open var closedPolyline: Bool { get }
    public init(_ path: MFPath?)
    public init(_ path: MFPath?, closedPolyline: Bool)
    public init(_ path: MFPath?, color: UIColor?, width: CGFloat, opacity: CGFloat, closedPolyline: Bool)
  }

  open class MFProjection : NSObject {
    public init(_ mapView: MFMapView)
    open func point(for coordinate: CLLocationCoordinate2D) -> CGPoint
    open func point(for coordinate: CLLocationCoordinate2D, withElevation elevation: Double) -> CGPoint
    open func coordinate(for point: CGPoint) -> CLLocationCoordinate2D
    open func coordinate(for point: CGPoint, withElevation elevation: Double) -> CLLocationCoordinate2D
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
  
  ```
  
  
  License
  -------
  
  Copyright (C) 2016 IOT Link Ltd. All Rights Reserved.
