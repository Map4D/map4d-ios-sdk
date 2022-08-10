//
//  MFGroundOverlay.h
//  Map4dMap
//
//  Created by Huy Dang on 8/26/20.
//

#ifndef MFGroundOverlay_h
#define MFGroundOverlay_h

#import "MFURLTileLayer.h"
#import "MFCoordinateBounds.h"

NS_ASSUME_NONNULL_BEGIN

@interface MFGroundOverlay : MFOverlay

@property(nonatomic, readonly, strong) MFCoordinateBounds *bounds;
@property(nonatomic, readonly) BOOL overrideBaseMap;
@property(nonatomic) CGFloat opacity;

+ (instancetype)groundOverlayWithBounds:(MFCoordinateBounds *)bounds mapUrl:(NSString *)url;
+ (instancetype)groundOverlayWithBounds:(MFCoordinateBounds *)bounds mapUrl:(NSString *)url
                        overrideBaseMap:(BOOL) enabled;

+ (instancetype)groundOverlayWithBounds:(MFCoordinateBounds *)bounds
                     tileURLConstructor:(id<MFTileURLConstructor>)constructor;

+ (instancetype)groundOverlayWithBounds:(MFCoordinateBounds *)bounds
                     tileURLConstructor:(id<MFTileURLConstructor>)constructor
                        overrideBaseMap:(BOOL) enabled;

@end

NS_ASSUME_NONNULL_END

#endif /* MFGroundOverlay_h */
