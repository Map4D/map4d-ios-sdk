//
//  MFProjection.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2018 IOTLink LLC.
//

#ifndef MFProjection_h
#define MFProjection_h
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MFMapView;
@class MFCameraPosition;

NS_ASSUME_NONNULL_BEGIN

@interface MFProjection : NSObject

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)init:(MFMapView *)mapView;

- (instancetype)initWithMapView:(MFMapView *)mapView;

/** Maps an Earth coordinate to a point coordinate in the map's view. */
- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)coordinate;

/** Maps an Earth coordinate to a point coordinate at the elevation in the map's view. */
- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)coordinate
                    elevation:(double)elevation;

/** Maps an Earth coordinate to a point coordinate in the map's view. */
- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)coordinate
                       camera:(MFCameraPosition *)camera;

/** Maps an Earth coordinate to a point coordinate in the map's view. */
- (CGPoint)pointForCoordinate:(CLLocationCoordinate2D)coordinate
                       camera:(MFCameraPosition *)camera
                    elevation:(double)elevation;

/** Maps a point coordinate in the map's view to an Earth coordinate. */
- (CLLocationCoordinate2D)coordinateForPoint:(CGPoint)point;

- (CLLocationCoordinate2D)coordinateForPoint:(CGPoint)point
                                   elevation:(double)elevation;

- (CLLocationCoordinate2D)coordinateForPoint:(CGPoint)point
                                      camera:(MFCameraPosition *)camera;

- (CLLocationCoordinate2D)coordinateForPoint:(CGPoint)point
                                      camera:(MFCameraPosition *)camera
                                   elevation:(double)elevation;

@end

NS_ASSUME_NONNULL_END

#endif /* MFProjection_h */
