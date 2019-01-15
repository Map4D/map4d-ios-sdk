//
//  MFPolyline.h
//  mapes
//
//  Created by tantv on 9/20/18.
//

#ifndef MFPolyline_h
#define MFPolyline_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MFOverlay.h"
@class MFPath;

@interface MFPolyline : MFOverlay
  @property(nonatomic, strong, nullable) MFPath *path;
  @property(nonatomic, assign) bool visible;
  @property(nonatomic, assign) CGFloat width;
  @property(nonatomic, assign) CGFloat opacity;
  @property(nonatomic, strong) UIColor* _Nullable color;
  @property(nonatomic, assign, readonly) bool closedPolyline;

  - (instancetype _Nonnull ) init NS_UNAVAILABLE;
  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path;
  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path closedPolyline: (bool) closedPolyline;
  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path color: (UIColor* _Nullable) color width: (CGFloat) width opacity: (CGFloat) opacity closedPolyline: (bool) closedPolyline;

@end

#endif /* MFPolyline_h */
