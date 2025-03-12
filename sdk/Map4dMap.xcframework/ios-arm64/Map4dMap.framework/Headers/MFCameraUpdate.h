//
//  MFCameraUpdate.h
//  Map4D
//
//  Created by tantv on 10/15/18.
//

#ifndef MFCameraUpdate_h
#define MFCameraUpdate_h
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class MFCoordinateBounds;
@class MFCameraPosition;

@interface MFCameraUpdate : NSObject
  // Setter
  + (MFCameraUpdate *) fitBounds: (MFCoordinateBounds *) _bounds;
  + (MFCameraUpdate *) fitBounds:(MFCoordinateBounds *) _bounds withEdgeInsets:(UIEdgeInsets) _edgeInsets;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom bearing: (double) bearing;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (double) zoom tilt :(double) tilt bearing: (double) bearing;
  + (MFCameraUpdate *)setCamera:(MFCameraPosition *) camera;
@end

#endif /* MFCameraUpdate_h */
