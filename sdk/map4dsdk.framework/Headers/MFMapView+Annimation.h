//
//  MFMapView+Annimation.h
//  Map4D
//
//  Created by tantv on 10/15/18.
//

#ifndef MFMapView_Annimation_h
#define MFMapView_Annimation_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MFCameraUpdate.h"
#import "MFCameraPosition.h"
#import "MFMapView.h"

@interface MFMapView (Annimation)

  // Animation
  - (void) animateWithCameraUpdate:(MFCameraUpdate *) cameraUpdate;
  - (void) animateToCameraPosition:(MFCameraPosition *) cameraPosition;
  - (void) animateToLocation:(CLLocationCoordinate2D) position;
  - (void) animateToZoom: (float) zoom;

  // Move To
  - (void) moveTo: (CLLocationCoordinate2D) latLng zoom: (double) zoom duration: (long) duration;

  - (void) moveTo: (CLLocationCoordinate2D) latLng zoom: (double) zoom;

  - (void) moveTo: (CLLocationCoordinate2D) latLng ;

  - (void) moveCamera: (MFCameraUpdate* ) cameraUpdate;
  - (void) moveCameraPosition: (MFCameraPosition* ) position;

@end


#endif /* MFMapView_Annimation_h */
