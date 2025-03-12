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
#import "MFStrokePattern.h"

@class MFPath;

@interface MFPolyline : MFOverlay
@property(nonatomic, strong, nullable) MFPath *path;
@property(nonatomic) CGFloat width;
@property(nonatomic) CGFloat opacity DEPRECATED_MSG_ATTRIBUTE("This property will be removed in future versions. Use 'color' instead of.");
@property(nonatomic) MFPolylineStyle style DEPRECATED_MSG_ATTRIBUTE("This property will be removed in future versions. Use 'strokePattern' instead of.");
@property(nonatomic, strong, nullable) MFStrokePattern *strokePattern;
@property(nonatomic, strong, nonnull) UIColor* color;
/** A Boolean value that determines whether user events are ignored and removed from the event queue. */
@property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;

- (instancetype _Nonnull ) init;

- (instancetype _Nonnull ) init: (nullable MFPath*) path __deprecated_msg("This method will be removed in future versions.  Use 'init:' instead of.");

@end

#endif /* MFPolyline_h */
