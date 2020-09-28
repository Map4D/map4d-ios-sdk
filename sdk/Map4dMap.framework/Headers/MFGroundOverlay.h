//
//  MFGroundOverlay.h
//  Map4dMap
//
//  Created by Huy Dang on 8/26/20.
//

#ifndef MFGroundOverlay_h
#define MFGroundOverlay_h

#import "MFURLTileLayer.h"

@class MFCoordinateBounds;

@interface MFGroundOverlay : MFOverlay

+ (instancetype _Nonnull)groundOverlayWithBounds:(MFCoordinateBounds* _Nonnull)bounds mapUrl:(NSString* _Nonnull)url;
+ (instancetype _Nonnull)groundOverlayWithBounds:(MFCoordinateBounds* _Nonnull)bounds mapUrl:(NSString* _Nonnull)url overrideBaseMap:(BOOL) enabled;

+ (instancetype _Nonnull)groundOverlayWithBounds:(MFCoordinateBounds* _Nonnull)bounds
                              tileURLConstructor:(id<MFTileURLConstructor> _Nonnull)constructor;

+ (instancetype _Nonnull)groundOverlayWithBounds:(MFCoordinateBounds* _Nonnull)bounds
                              tileURLConstructor:(id<MFTileURLConstructor> _Nonnull)constructor
                                 overrideBaseMap:(BOOL) enabled;

@end

#endif /* MFGroundOverlay_h */
