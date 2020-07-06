//
//  MFURLBuildingLayer.h
//  Map4dMap
//
//  Created by Huy Dang on 6/23/20.
//

#ifndef MFURLBuildingLayer_h
#define MFURLBuildingLayer_h

#import "MFOverlay.h"

@protocol MFBuildingURLConstructor <NSObject>

- (NSURL* _Nullable) getBuildingUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom;

@end

@interface MFURLBuildingLayer : MFOverlay

+ (instancetype _Nonnull) buildingLayerWithURLConstructor:(id<MFBuildingURLConstructor> _Nonnull)constructor;

- (void) clearBuildingCache;

@end


#endif /* MFURLBuildingLayer_h */
