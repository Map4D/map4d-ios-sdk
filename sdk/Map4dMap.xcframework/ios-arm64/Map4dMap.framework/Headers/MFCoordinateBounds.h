//
//  MFCoordinateBounds.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2018 IOTLink LLC.
//

#ifndef MFCoordinateBounds_h
#define MFCoordinateBounds_h

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MFPath;

@interface MFCoordinateBounds : NSObject

/** The North-East corner of these bounds. */
@property(nonatomic, readonly, getter=northEast) CLLocationCoordinate2D northEast;

/** The South-West corner of these bounds. */
@property(nonatomic, readonly, getter=southWest) CLLocationCoordinate2D southWest;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coord1
                        coordinate:(CLLocationCoordinate2D)coord2;

- (instancetype)initWithPath:(MFPath *)path;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coord
                       coordinate1:(CLLocationCoordinate2D)coord1
__deprecated_msg("This init method will be removed in future versions. Use 'init(coordinate:coordinate:)' instead of.");

- (MFCoordinateBounds *)includingCoordinate:(CLLocationCoordinate2D)coordinate;

- (MFCoordinateBounds *)includingBounds:(MFCoordinateBounds *) other;

- (MFCoordinateBounds *)includingPath:(MFPath *)path;

- (BOOL)containsLatitude:(double)latitude;
- (BOOL)containsLongitude:(double)longitude;
- (BOOL)contains:(CLLocationCoordinate2D)coordinate;
@end

NS_ASSUME_NONNULL_END

#endif /* MFCoordinateBounds_h */
