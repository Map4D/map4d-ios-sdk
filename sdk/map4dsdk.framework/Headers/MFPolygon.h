//
//  MFPolygon.h
//  Map4D
//
//  Created by tantv on 12/21/18.
//

#ifndef MFPolygon_h
#define MFPolygon_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MFOverlay.h"

@class MFPath;

@interface MFPolygon : MFOverlay
  @property(nonatomic, strong, nullable) MFPath *path;
  @property(nonatomic, strong, nullable) NSArray<MFPath *> *holes;
  @property(nonatomic, assign) bool visible;
  @property(nonatomic, assign) CGFloat fillOpacity;
  /** The fill color. Defaults to blueColor. */
  @property(nonatomic, strong) UIColor* _Nullable fillColor;

  - (instancetype _Nonnull ) init NS_UNAVAILABLE;
  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path;

  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path holes: (NSArray<MFPath *>* _Nonnull) holes;

  - (instancetype _Nonnull ) init: (MFPath* _Nullable) path fillColor: (UIColor* _Nonnull) color;
@end

#endif /* MFPolygon_h */
