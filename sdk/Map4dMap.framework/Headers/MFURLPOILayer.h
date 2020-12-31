//
//  MFURLPOILayer.h
//  Map4dMap
//
//  Created by Huy Dang on 9/17/20.
//

#ifndef MFURLPOILayer_h
#define MFURLPOILayer_h

#import "MFOverlay.h"
#import "MFPOIData.h"

@protocol MFPOIURLConstructor <NSObject>

- (NSURL* _Nullable) getPOIUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom;

- (NSArray<MFPOIData*>* _Nullable) parserPOIData:(NSString* _Nonnull)data;

@end

@interface MFURLPOILayer : MFOverlay

@property(nonatomic, copy, readonly, nullable) NSString* prefixId;

+ (instancetype _Nonnull) poiLayerWithURLConstructor:(id<MFPOIURLConstructor> _Nonnull)constructor;
+ (instancetype _Nonnull) poiLayerWithURLConstructor:(id<MFPOIURLConstructor> _Nonnull)constructor prefixId:(NSString* _Nullable)prefixId;

- (void) clearPOICache;

@end

#endif /* MFURLPOILayer_h */
