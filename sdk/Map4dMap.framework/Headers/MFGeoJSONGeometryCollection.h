//
//  MFGeoJSONGeometryCollection.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONGeometryCollection_h
#define MFGeoJSONGeometryCollection_h

#import "MFPath.h"
#import "MFGeoJSONGeometry.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MFGeoJSON.GeometryCollection)
@interface MFGeoJSONGeometryCollection : NSObject<MFGeoJSONGeometry>

/**
 * The array of geometry objects for the GeometryCollection.
 */
@property(nonatomic, readonly) NSArray<id<MFGeoJSONGeometry>> *geometries;

- (instancetype)init NS_UNAVAILABLE;

/**
 * Initializes a MFGeoJSON.GeometryCollection object with a set of geometry objects.
 *
 * @param geometries The array of geometry objects.
 */
- (instancetype)initWithGeometries:(NSArray<id<MFGeoJSONGeometry>> *)geometries;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGeoJSONGeometryCollection_h */
