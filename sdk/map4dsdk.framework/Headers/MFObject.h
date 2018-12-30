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

@interface MFObject: NSObject
  @property(nonatomic, strong) NSString* Id;
  @property(nonatomic, strong) NSString* name;
  @property(nonatomic) CLLocationCoordinate2D position;
  @property(nonatomic) float elevation;
@end

#endif /* MFObject_h */
