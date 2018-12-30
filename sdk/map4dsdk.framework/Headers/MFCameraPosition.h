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
@class MFMapView;
@interface MFCameraPosition: NSObject

  - (instancetype) init: (MFMapView*) mapView;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (float) zoom;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (float) zoom duration: (long) duration;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (float) zoom tilt :(float) tilt ;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (float) zoom bearing: (float) bearing;
  - (id)initWithTarget:(CLLocationCoordinate2D) target zoom: (float) zoom tilt :(float) tilt bearing: (float) bearing;
  @property(nonatomic, assign, getter = target) CLLocationCoordinate2D target;
  @property(nonatomic, assign, getter = zoom) float zoom;
  @property(nonatomic, assign, getter = bearing) float bearing;
  @property(nonatomic, assign, getter = tilt) float tilt;
  @property(nonatomic, assign, getter = duration) long duration;

@end

#endif /* MFCameraPosition_h */
