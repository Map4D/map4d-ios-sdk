//
//  TileURLConstructor.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 27/01/2021.
//

#import "TileURLConstructor.h"

@implementation TileURLConstructor

- (NSURL * _Nullable)getTileUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom is3dMode:(bool)is3dMode {
  NSString *url = [NSString stringWithFormat:@"https://tile.openstreetmap.de/%lu/%lu/%lu.png", zoom, x, y];
  return [NSURL URLWithString:url];
}

@end
