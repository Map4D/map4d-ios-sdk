//
//  MFObject.h
//  Map4D
//
//  Created by tantv on 12/6/18.
//

#ifndef MFObject_h
#define MFObject_h
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MFCameraPosition;
@class MFModel;
@interface MFObject: NSObject
  @property(nonatomic, strong) NSString* _Nullable Id;
  @property(nonatomic, strong) NSString* _Nullable name;
  @property(nonatomic, strong, nullable) NSMutableArray* places;
  @property(nonatomic) double  scale;
  @property(nonatomic) double  bearing;
  @property(nonatomic) CLLocationCoordinate2D coordinate;
  @property(nonatomic) double elevation;
  @property(nonatomic) double heightScale;
  @property(nonatomic, strong) MFCameraPosition* _Nullable camera;
  @property(nonatomic, strong) MFModel* _Nullable model;
  @property(nonatomic, strong, nullable) NSMutableArray* types;
  @property(nonatomic) bool isVerified;
  @property(nonatomic) double minZoom;
  @property(nonatomic) double maxZoom;
  @property(nonatomic) NSDate* _Nullable startDate;
  @property(nonatomic) NSDate* _Nullable endDate;
@end

#endif /* MFObject_h */
