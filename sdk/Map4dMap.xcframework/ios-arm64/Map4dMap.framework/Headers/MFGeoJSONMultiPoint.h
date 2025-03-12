//
//  MFGeoJSONMultiPoint.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONMultiPoint_h
#define MFGeoJSONMultiPoint_h

#import "MFGeoJSONGeometry.h"
#import "MFGeoJSONPoint.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MFGeoJSON.MultiPoint)
@interface MFGeoJSONMultiPoint : NSObject<MFGeoJSONGeometry>

@property(nonatomic, readonly) NSArray<MFGeoJSONPoint *> *points;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithPoints:(NSArray<MFGeoJSONPoint *> *)points;

@end

NS_ASSUME_NONNULL_END


#endif /* MFGeoJSONMultiPoint_h */
