//
//  MFGeoJSONLineString.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONLineString_h
#define MFGeoJSONLineString_h

#import "MFPath.h"
#import "MFGeoJSONGeometry.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MFGeoJSON.LineString)
@interface MFGeoJSONLineString : NSObject<MFGeoJSONGeometry>

/**
 * The path of the LineString.
 */
@property(nonatomic, readonly) MFPath *path;

- (instancetype)init NS_UNAVAILABLE;

/**
 * Initializes a MFGeoJSON.LineString object with a path.
 *
 * @param path The path of the LineString.
 */
- (instancetype)initWithPath:(MFPath *)path;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGeoJSONLineString_h */
