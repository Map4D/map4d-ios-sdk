//
//  GroundURLConstructor.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 27/01/2021.
//

#import "GroundURLConstructor.h"

@implementation GroundURLConstructor

- (NSURL * _Nullable)getTileUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom is3dMode:(bool)is3dMode {
  NSString *url = [NSString stringWithFormat:@"https://a.tile.opentopomap.org/%lu/%lu/%lu.png", zoom, x, y];
  return [NSURL URLWithString:url];
}

@end
