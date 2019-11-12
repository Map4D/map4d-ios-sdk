//
//  MFCoordinateBounds.h
//  Map4D
//
//  Created by tantv on 10/15/18.
//

#ifndef MFCoordinateBounds_h
#define MFCoordinateBounds_h
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MFPath;

@interface MFCoordinateBounds : NSObject

  @property(nonatomic, readonly, getter=northEast) CLLocationCoordinate2D northEast;

  @property(nonatomic, readonly, getter=southWest) CLLocationCoordinate2D southWest;

- (instancetype _Nonnull ) initWithCoordinate:(CLLocationCoordinate2D)coord coordinate1:(CLLocationCoordinate2D)coord1;

- (instancetype _Nonnull ) initWithPath: (MFPath * _Nonnull)path;

  - (MFCoordinateBounds* _Nonnull) includingCoordinate:(CLLocationCoordinate2D)coordinate;

  - (MFCoordinateBounds* _Nonnull)includingBounds:(MFCoordinateBounds * _Nonnull) other;

  - (MFCoordinateBounds* _Nonnull) includingPath:(MFPath * _Nonnull)path;

  - (bool)containsLatitude:(double)latitude;
  - (bool)containsLongitude:(double)longitude;
  - (bool)contains:(CLLocationCoordinate2D)coordinate;
@end

#endif /* MFCoordinateBounds_h */
