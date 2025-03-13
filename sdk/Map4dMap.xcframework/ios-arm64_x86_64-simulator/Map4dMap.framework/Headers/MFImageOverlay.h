//
//  MFImageOverlay.h
//  Map4dMap
//
//  Created by Huy Dang on 08/08/2022.
//

#ifndef MFImageOverlay_h
#define MFImageOverlay_h

#import "MFOverlay.h"
#import "MFCoordinateBounds.h"

NS_ASSUME_NONNULL_BEGIN

@interface MFImageOverlay : MFOverlay

@property(nonatomic, readonly, strong) UIImage *image;
@property(nonatomic, readonly, strong) MFCoordinateBounds *bounds;
@property(nonatomic) CGFloat opacity;

+ (instancetype)imageOverlayWithImage:(UIImage *)image bounds:(MFCoordinateBounds *)bounds;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithImage:(UIImage *)image bounds:(MFCoordinateBounds *)bounds;

@end

NS_ASSUME_NONNULL_END

#endif /* MFImageOverlay_h */
