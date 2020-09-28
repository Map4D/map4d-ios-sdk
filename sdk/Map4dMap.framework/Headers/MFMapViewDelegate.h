//
//  MFMapViewDelegate.h
//  mapes
//
//  Created by tantv on 9/19/18.
//

#ifndef MFMapViewDelegate_h
#define MFMapViewDelegate_h
#import <CoreLocation/CoreLocation.h>

@class MFMapView;
@class MFMarker;
@class MFCameraPosition;
@class MFBuilding;
@class MFPOI;
@class MFPolyline;
@class MFPolygon;
@class MFCircle;

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
/* Called after a building annotation has been tapped */
- (void)mapView: (MFMapView*)  mapView didTapBuilding: (MFBuilding*) building;
/* Called after a base map building has been tapped */
- (void)mapView: (MFMapView*)  mapView didTapBuildingWithBuildingID: (NSString*) buildingID name: (NSString*) name location: (CLLocationCoordinate2D) location;
/* Called after a POI annotation has been tapped */
- (void)mapView: (MFMapView*)  mapView didTapPOI: (MFPOI*) poi;
/* Called after a base map POI has been tapped */
- (void)mapView: (MFMapView*)  mapView didTapPOIWithPlaceID: (NSString*) placeID name: (NSString*) name location: (CLLocationCoordinate2D) location;
- (void)mapView: (MFMapView*)  mapView didTapMyLocation: (CLLocationCoordinate2D) location;

- (BOOL)shouldChangeMapModeForMapView: (MFMapView*)  mapView;
- (BOOL)didTapMyLocationButtonForMapView: (MFMapView*) mapView;
- (UIView *) mapView: (MFMapView *) mapView markerInfoWindow: (MFMarker *) marker;

@end

#endif /* MFMapViewDelegate_h */
