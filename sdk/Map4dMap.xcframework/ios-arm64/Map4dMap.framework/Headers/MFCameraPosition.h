//
//  MFCameraPosition.h
//  Map4D
//
//  Created by tantv on 10/12/18.
//

#ifndef MFCameraPosition_h
#define MFCameraPosition_h
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MFCameraPosition: NSObject

  - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
  - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt ;
  - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (double) bearing;
  - (instancetype)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (double) bearing;

  @property(nonatomic) CLLocationCoordinate2D target;
  @property(nonatomic) double zoom;
  @property(nonatomic) double bearing;
  @property(nonatomic) double tilt;

@end

#endif /* MFCameraPosition_h */
