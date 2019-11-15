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
#import "MFPolylineStyle.h"

@class MFPath;

@interface MFPolyline : MFOverlay
  @property(nonatomic, strong, nullable) MFPath *path;
  @property(nonatomic, assign) bool visible;
  @property(nonatomic, assign) CGFloat width;
  @property(nonatomic, assign) CGFloat opacity;
  @property(nonatomic, assign) MFPolylineStyle style;
  @property(nonatomic, strong) UIColor* _Nullable color;
  @property(nonatomic, assign, readonly) bool closed;

  - (instancetype _Nonnull ) init NS_UNAVAILABLE;
  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path;
  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path closed: (bool) closed;
  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path color: (UIColor* _Nullable) color width: (CGFloat) width opacity: (CGFloat) opacity style: (MFPolylineStyle) style closed: (bool) closed;
  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path color: (UIColor* _Nullable) color width: (CGFloat) width opacity: (CGFloat) opacity style: (MFPolylineStyle) style closed: (bool) closed zIndex: (float) zIndex;

@end

#endif /* MFPolyline_h */
