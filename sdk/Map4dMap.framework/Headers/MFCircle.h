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
@property(nonatomic, assign) bool visible;
@property(nonatomic, assign) CGFloat fillOpacity;
/** The fill color. Defaults to blueColor. */
@property(nonatomic, strong) UIColor* _Nullable fillColor;
/** Position on Earth of circle center. */
@property(nonatomic, assign) CLLocationCoordinate2D position;
/** Radius of the circle in meters; must be positive. */
@property(nonatomic, assign) double radius;
/** The width of the circle's outline in screen points.  */
@property(nonatomic, assign) double strokeWidth;
/** The color of this circle's outline. */
@property(nonatomic, strong) UIColor* _Nullable strokeColor;

- (instancetype _Nonnull ) init NS_UNAVAILABLE;

- (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (double) radius;

- (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (double) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity;

- (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (double) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity strokeWidth: (double) strokeWidth strokeColor: (UIColor*) strokeColor;

- (instancetype _Nonnull ) init: (CLLocationCoordinate2D) position radius: (double) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity strokeWidth: (double) strokeWidth strokeColor: (UIColor*) strokeColor zIndex: (float) zIndex;
@end

NS_ASSUME_NONNULL_END
