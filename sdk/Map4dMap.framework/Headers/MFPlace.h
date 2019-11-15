//
//  MFPlace.h
//  Map4D
//
//  Created by tung on 2019.
//

#ifndef MFPlace_h
#define MFPlace_h
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MFCameraPosition;
@interface MFPlace: NSObject
  @property(nonatomic, strong) NSString* _Nullable Id;
  @property(nonatomic, strong) NSString* _Nullable name;
  @property(nonatomic, strong) NSString* _Nullable address;
  @property(nonatomic) CLLocationCoordinate2D coordinate;
  @property(nonatomic, strong) NSString* _Nullable iconColor;
  @property(nonatomic, strong) NSString* _Nullable iconType;
@end

#endif /* MFPlace_h */
