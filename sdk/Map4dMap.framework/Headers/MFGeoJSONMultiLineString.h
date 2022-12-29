//
//  MFGeoJSONMultiLineString.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2022 IOTLink LLC.
//

#ifndef MFGeoJSONMultiLineString_h
#define MFGeoJSONMultiLineString_h

#import "MFGeoJSONGeometry.h"
#import "MFGeoJSONLineString.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(MFGeoJSON.MultiLineString)
@interface MFGeoJSONMultiLineString : NSObject<MFGeoJSONGeometry>

@property(nonatomic, readonly) NSArray<MFGeoJSONLineString *> *lineStrings;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithLineStrings:(NSArray<MFGeoJSONLineString *> *)lineStrings;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGeoJSONMultiLineString_h */
