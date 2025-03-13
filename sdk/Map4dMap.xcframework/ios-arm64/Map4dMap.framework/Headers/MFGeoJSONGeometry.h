//
//  MFGeoJSONGeometry.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONGeometry_h
#define MFGeoJSONGeometry_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * The type of the geometry.
 */
typedef NS_ENUM(NSUInteger, MFGeoJSONGeometryType) {
  MFGeoJSONGeometryTypePoint,
  MFGeoJSONGeometryTypeMultiPoint,
  MFGeoJSONGeometryTypeLineString,
  MFGeoJSONGeometryTypeMultiLineString,
  MFGeoJSONGeometryTypePolygon,
  MFGeoJSONGeometryTypeMultiPolygon,
  MFGeoJSONGeometryTypeGeometryCollection
} NS_SWIFT_NAME(MFGeoJSON.GeometryType);

/**
 * Generic geometry object.
 */
NS_SWIFT_NAME(MFGeoJSON.Geometry)
@protocol MFGeoJSONGeometry <NSObject>

/**
 * The type of the geometry.
 */
@property(nonatomic, readonly) MFGeoJSONGeometryType type;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGeoJSONGeometry_h */
