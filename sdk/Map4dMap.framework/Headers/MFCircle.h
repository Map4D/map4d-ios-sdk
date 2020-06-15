//
//  MFCircle.h
//  Map4D
//
//  Created by Sua Le on 12/28/18.
//

#import <Foundation/Foundation.h>
#import "MFOverlay.h"

NS_ASSUME_NONNULL_BEGIN

@interface MFCircle : MFOverlay

@property(nonatomic) CGFloat fillOpacity DEPRECATED_MSG_ATTRIBUTE("This property will be removed in future versions. Use 'fillColor' instead of.");

/** The fill color. Defaults to redColor. */
@property(nonatomic, strong, nonnull) UIColor* fillColor;

/** The color of this circle's outline. Defaults to blackColor */
@property(nonatomic, strong, nonnull) UIColor* strokeColor;

/** Position on Earth of circle center. */
@property(nonatomic) CLLocationCoordinate2D position;

/** Radius of the circle in meters; must be positive. */
@property(nonatomic) double radius;

/** The width of the circle's outline in screen points.  */
@property(nonatomic) double strokeWidth;

/** A Boolean value that determines whether user events are ignored and removed from the event queue. */
@property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;

- (instancetype _Nonnull) init;

- (instancetype _Nonnull) init: (CLLocationCoordinate2D) position radius: (double) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity __deprecated_msg("This method will be removed in future versions.  Use 'init:' instead of.");
@end

NS_ASSUME_NONNULL_END
