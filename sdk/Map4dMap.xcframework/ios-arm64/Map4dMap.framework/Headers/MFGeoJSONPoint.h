//
//  MFGeoJSONPoint.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONPoint_h
#define MFGeoJSONPoint_h

#import <CoreLocation/CoreLocation.h>
#import "MFGeoJSONGeometry.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MFGeoJSON.Point)
@interface MFGeoJSONPoint : NSObject<MFGeoJSONGeometry>

/**
 * The 2D coordinate of the Point, containing a latitude and longitude.
 */
@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (instancetype)init NS_UNAVAILABLE;

/**
 * Initializes a MFGeoJSON.Point object with a coordinate.
 *
 * @param coordinate A location with a latitude and longitude.
 */
- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGeoJSONPoint_h */
