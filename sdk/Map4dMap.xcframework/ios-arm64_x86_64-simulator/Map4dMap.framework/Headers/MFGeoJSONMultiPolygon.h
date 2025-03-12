//
//  MFGeoJSONMultiPolygon.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONMultiPolygon_h
#define MFGeoJSONMultiPolygon_h

#import "MFGeoJSONGeometry.h"
#import "MFGeoJSONPolygon.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MFGeoJSON.MultiPolygon)
@interface MFGeoJSONMultiPolygon : NSObject<MFGeoJSONGeometry>

@property(nonatomic, readonly) NSArray<MFGeoJSONPolygon *> *polygons;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithPolygons:(NSArray<MFGeoJSONPolygon *> *)polygons;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGeoJSONMultiPolygon_h */
