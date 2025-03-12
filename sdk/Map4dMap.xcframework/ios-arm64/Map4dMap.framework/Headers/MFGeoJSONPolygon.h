//
//  MFGeoJSONPolygon.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONPolygon_h
#define MFGeoJSONPolygon_h

#import "MFPath.h"
#import "MFGeoJSONGeometry.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MFGeoJSON.Polygon)
@interface MFGeoJSONPolygon : NSObject<MFGeoJSONGeometry>

/**
 * The array of LinearRing paths for the Polygon. The first is the exterior ring of the Polygon; any
 * subsequent rings are holes.
 */
@property(nonatomic, readonly) NSArray<MFPath *> *paths;

- (instancetype)init NS_UNAVAILABLE;

/**
 * Initializes a MFGeoJSON.Polygon object with a set of paths.
 *
 * @param paths The paths of the Polygon.
 */
- (instancetype)initWithPaths:(NSArray<MFPath *> *)paths;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGeoJSONPolygon_h */
