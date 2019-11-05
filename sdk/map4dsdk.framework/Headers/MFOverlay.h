//
//  MFOverlay.h
//  mapes
//
//  Created by tantv on 9/17/18.
//

#ifndef MFOverlay_h
#define MFOverlay_h
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MFMapView;

@interface MFOverlay: NSObject
  @property(nonatomic, weak) MFMapView * _Nullable map;
  @property(nonatomic, readonly, getter=getId) long Id;
  @property(nonatomic, setter=setZIndex:) float zIndex;
  - (long) getId;
@end

#endif /* MFOverlay_h */
