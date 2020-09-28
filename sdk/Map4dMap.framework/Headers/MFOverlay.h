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

#define ANNOTATION_ID_NONE 0
#define OVERLAY_ID_NONE 0

@class MFMapView;

@interface MFOverlay: NSObject {
  @protected UInt32 _Id;
}

@property(nonatomic, weak, nullable) MFMapView* map;
@property(nonatomic, readonly) UInt32 Id;
@property(nonatomic, setter=setIsHidden:) bool isHidden;
@property(nonatomic, setter=setZIndex:) float zIndex;
@property(nonatomic, setter=setUserData:) NSObject* _Nullable userData;

- (UInt32) getId;
-(instancetype _Nonnull) init;

@end

#endif /* MFOverlay_h */
