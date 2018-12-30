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
  + (MFCameraUpdate *) fitBounds:(MFCoordinateBounds *) _bounds
                withEdgeInsets:(UIEdgeInsets) _edgeInsets;
  + (MFCameraUpdate *) fitBounds: (MFCoordinateBounds *) _bounds withEdgeInsets:(UIEdgeInsets) _edgeInsets duration: (long) _duration;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom tilt :(float) tilt ;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom bearing: (float) bearing;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom tilt :(float) tilt bearing: (float) bearing;
  + (MFCameraUpdate *)setTarget:(CLLocationCoordinate2D) target zoom: (float) zoom duration: (long) duration;
  + (MFCameraUpdate *)setCamera:(MFCameraPosition *) camera;
  + (MFCameraUpdate *)setCamera:(MFCameraPosition *) camera duration: (long) duration;
  // Getter
  - (MFCoordinateBounds *) getBounds;
  - (UIEdgeInsets) getEdgeInsets;
  - (CLLocation*) getTarget;
  - (float) getZoom;
  - (long) getDuration;
  - (float) getTilt;
  - (float) getBearing;
  
@end

#endif /* MFCameraUpdate_h */
