//
//  MFGeoJSON.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSON_h
#define MFGeoJSON_h

#import <Foundation/Foundation.h>
#import "MFGeoJSONStyle.h"
#import "MFGeoJSONFeature.h"

NS_ASSUME_NONNULL_BEGIN

@class MFMapView;

@interface MFGeoJSON : NSObject

/**
 * The features parsed from the GeoJSON file.
 */
@property(nonatomic, readonly) NSArray<MFGeoJSONFeature *> *features;

@property(nonatomic, readonly) MFGeoJSONPointStyle *pointStyle;

/**
 * The map this GeoJSON is on.
 */
@property(nonatomic, weak, nullable) MFMapView *map;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithJson:(NSString *)json;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGeoJSON_h */
