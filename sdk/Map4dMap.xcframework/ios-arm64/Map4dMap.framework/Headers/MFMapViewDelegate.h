//
//  MFMapViewDelegate.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2018 IOTLink LLC.
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
@class MFDirectionsRenderer;
@class MFGeoJSON;
@class MFGeoJSONFeature;
@class MFDataSourceFeature;

@protocol MFMapViewDelegate <NSObject>
@optional
- (BOOL)mapview:(MFMapView *)mapView didTapMarker:(MFMarker *)marker;
- (void)mapview:(MFMapView *)mapView didBeginDraggingMarker:(MFMarker *)marker;
- (void)mapview:(MFMapView *)mapView didEndDraggingMarker:(MFMarker *)marker;
- (void)mapview:(MFMapView *)mapView didDragMarker:(MFMarker *)marker;
- (void)mapview:(MFMapView *)mapView didTapInfoWindowOfMarker:(MFMarker *)marker;
- (void)mapview:(MFMapView *)mapView didTapPolyline:(MFPolyline *)polyline;
- (void)mapview:(MFMapView *)mapView didTapPolygon:(MFPolygon *)polygon;
- (void)mapview:(MFMapView *)mapView didTapCircle:(MFCircle *)circle;
- (void)mapView:(MFMapView *)mapView willMove:(BOOL)gesture;
- (void)mapView:(MFMapView *)mapView movingCameraPosition:(MFCameraPosition *)position;
- (void)mapView:(MFMapView *)mapView didChangeCameraPosition:(MFCameraPosition *)position;
- (void)mapView:(MFMapView *)mapView idleAtCameraPosition:(MFCameraPosition *)position;
- (void)mapView:(MFMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate;
- (void)mapView:(MFMapView *)mapView onModeChange:(bool)is3DMode DEPRECATED_MSG_ATTRIBUTE("This method is no longer support, which is subject to removal in a future versions.");
- (void)mapView:(MFMapView *)mapView didReachLimitedZoom:(double)zoom;
/* Called after a building annotation has been tapped */
- (void)mapView:(MFMapView *)mapView didTapBuilding:(MFBuilding *)building;
/* Called after a base map building has been tapped */
- (void)mapView:(MFMapView *)mapView didTapBuildingWithBuildingID:(NSString *)buildingID name:(NSString *)name location:(CLLocationCoordinate2D)location;
/* Called after a POI annotation has been tapped */
- (void)mapView:(MFMapView *)mapView didTapPOI:(MFPOI *)poi;
/* Called after a base map POI has been tapped */
- (void)mapView:(MFMapView *)mapView didTapPOIWithPlaceID:(NSString *)placeID name:(NSString *)name location:(CLLocationCoordinate2D)location;
- (void)mapView:(MFMapView *)mapView didTapPlaceWithName:(NSString *)name location:(CLLocationCoordinate2D)location;
- (void)mapView:(MFMapView *)mapView didTapMyLocation:(CLLocationCoordinate2D)location;

- (void)mapView:(MFMapView *)mapView didTapDirectionsRenderer:(MFDirectionsRenderer *)renderer routeIndex:(NSUInteger)routeIndex;
- (void)mapView:(MFMapView *)mapView didTapGeoJSON:(MFGeoJSON *)geoJSON feature:(MFGeoJSONFeature *)feature;
- (void)mapView:(MFMapView *)mapView didTapDataSourceFeature:(MFDataSourceFeature *)feature location:(CLLocationCoordinate2D)location;

- (BOOL)shouldChangeMapModeForMapView:(MFMapView *)mapView DEPRECATED_MSG_ATTRIBUTE("This method is no longer support. It is recommended that the 'didReachLimitedZoom' delegate be used instead. This method is subject to removal in a future versions.");
- (BOOL)didTapMyLocationButtonForMapView:(MFMapView *)mapView;
- (UIView *)mapView:(MFMapView *)mapView markerInfoWindow:(MFMarker *)marker;

@end

#endif /* MFMapViewDelegate_h */
