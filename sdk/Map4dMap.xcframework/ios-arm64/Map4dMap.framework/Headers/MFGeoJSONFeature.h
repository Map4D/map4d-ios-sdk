//
//  MFGeoJSONFeature.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONFeature_h
#define MFGeoJSONFeature_h

#import <Foundation/Foundation.h>
#import "MFGeoJSONGeometry.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MFGeoJSON.Feature)
@interface MFGeoJSONFeature : NSObject

/**
 * The geometry object in the feature.
 */
@property(nonatomic, readonly) id<MFGeoJSONGeometry> geometry;

/**
 * The properties of the geometry in the feature.
 */
@property(nonatomic, nullable, readonly) NSDictionary<NSString *, NSObject *> *properties;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithGeometry:(id<MFGeoJSONGeometry>)geometry
                      properties:(NSDictionary<NSString *, NSObject *> * _Nullable)properties;

@end

NS_ASSUME_NONNULL_END


#endif /* MFGeoJSONFeature_h */
