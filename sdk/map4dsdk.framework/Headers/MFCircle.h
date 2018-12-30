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

- (instancetype _Nonnull ) init: (CLLocationCoordinate2D) center radius: (CGFloat) radius;

- (instancetype _Nonnull ) init: (CLLocationCoordinate2D) center radius: (CGFloat) radius fillColor: (UIColor*) fillColor fillOpacity: (CGFloat) fillOpacity;

@end

NS_ASSUME_NONNULL_END
