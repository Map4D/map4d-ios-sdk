//
//  MFMutablePath.h
//  mapes
//
//  Created by tantv on 9/24/18.
//

#ifndef MFMutablePath_h
#define MFMutablePath_h
#import "MFPath.h"
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MFMutablePath: MFPath

 - (void)addCoordinate:(CLLocationCoordinate2D)coord;
 - (void)addLatitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude;
 - (CLLocationCoordinate2D)objectAtIndex:(NSUInteger)idx;
 - (void)insertCoordinate:(CLLocationCoordinate2D)coord atIndex:(NSUInteger)index;
 - (void)replaceCoordinateAtIndex:(NSUInteger)index withCoordinate:(CLLocationCoordinate2D)coord;
 - (void)removeCoordinateAtIndex:(NSUInteger)index;
 - (void)removeLastCoordinate;
 - (void)removeAllCoordinates;

@end

#endif /* MFMutablePath_h */
