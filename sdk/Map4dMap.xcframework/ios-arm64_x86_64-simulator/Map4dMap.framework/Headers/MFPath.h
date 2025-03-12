//
//  MFPath.h
//  mapes
//
//  Created by tantv on 9/20/18.
//

#ifndef MFPath_h
#define MFPath_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MFPath: NSObject

@property (readonly, getter=getCount) NSUInteger count;

+ (instancetype _Nonnull)pathFromEncodedPath:(NSString * _Nonnull)encodedPath;

- (CLLocationCoordinate2D)coordinateAtIndex:(NSUInteger)index;
  
@end

#endif /* MFPath_h */
