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

  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom duration: (long) duration;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt ;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (float) bearing;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (float) bearing;

  @property(nonatomic) CLLocationCoordinate2D target;
  @property(nonatomic) double zoom;
  @property(nonatomic) float bearing;
  @property(nonatomic) double tilt;
  @property(nonatomic) long duration;

@end

#endif /* MFCameraPosition_h */
