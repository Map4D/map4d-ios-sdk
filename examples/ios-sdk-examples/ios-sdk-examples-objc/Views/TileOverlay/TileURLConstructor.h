//
//  TileURLConstructor.h
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 27/01/2021.
//

#ifndef TileURLConstructor_h
#define TileURLConstructor_h

#import <Map4dMap/Map4dMap.h>

@interface TileURLConstructor : NSObject<MFTileURLConstructor>

- (NSURL * _Nullable)getTileUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom is3dMode:(bool)is3dMode;

@end

#endif /* TileURLConstructor_h */
