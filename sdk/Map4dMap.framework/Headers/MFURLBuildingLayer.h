//
//  MFURLBuildingLayer.h
//  Map4dMap
//
//  Created by Huy Dang on 6/23/20.
//

#ifndef MFURLBuildingLayer_h
#define MFURLBuildingLayer_h

#import "MFOverlay.h"
#import "MFBuildingData.h"

@protocol MFBuildingURLConstructor <NSObject>

- (NSURL* _Nullable) getBuildingUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom;

- (NSArray<MFBuildingData*>* _Nullable) parserBuildingData:(NSString* _Nonnull)data;

@end

@interface MFURLBuildingLayer : MFOverlay

@property(nonatomic, copy, readonly, nullable) NSString* prefixId;

+ (instancetype _Nonnull) buildingLayerWithURLConstructor:(id<MFBuildingURLConstructor> _Nonnull)constructor;
+ (instancetype _Nonnull) buildingLayerWithURLConstructor:(id<MFBuildingURLConstructor> _Nonnull)constructor prefixId:(NSString* _Nullable)prefixId;

- (void) clearBuildingCache;

@end


#endif /* MFURLBuildingLayer_h */
