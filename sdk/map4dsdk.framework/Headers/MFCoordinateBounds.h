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

  - (instancetype) initWithCoordinate:(CLLocationCoordinate2D)coord coordinate1:(CLLocationCoordinate2D)coord1;

  - (instancetype) initWithPath: (MFPath *)path;

  - (id)includingCoordinate:(CLLocationCoordinate2D)coordinate;

  - (id)includingBounds:(MFCoordinateBounds *)other;

  - (id)includingPath:(MFPath *)path;

  - (bool)containsLatitude:(double)latitude;
  - (bool)containsLongitude:(double)longitude;
  - (bool)contains:(CLLocationCoordinate2D)coordinate;
@end

#endif /* MFCoordinateBounds_h */
