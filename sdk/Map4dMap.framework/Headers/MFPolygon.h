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
/** The fill color. Defaults to blueColor. */
@property(nonatomic, strong, nonnull) UIColor* fillColor;
@property(nonatomic) CGFloat fillOpacity DEPRECATED_MSG_ATTRIBUTE("This property will be removed in future versions. Use 'fillColor' instead of.");;
@property(nonatomic, strong, nonnull) UIColor* strokeColor;
@property(nonatomic) CGFloat strokeWidth;
/** A Boolean value that determines whether user events are ignored and removed from the event queue. */
@property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;

- (instancetype _Nonnull) init;

@end

#endif /* MFPolygon_h */
