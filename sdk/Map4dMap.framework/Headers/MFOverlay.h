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

@interface MFOverlay: NSObject {
  @protected long _Id;
}

@property(nonatomic, weak, nullable) MFMapView* map;
@property(nonatomic, readonly) long Id;
@property(nonatomic, setter=setIsHidden:) bool isHidden;
@property(nonatomic, setter=setZIndex:) float zIndex;

- (long) getId;
-(instancetype _Nonnull) init;

@end

#endif /* MFOverlay_h */
