//
//  MFPOIData.h
//  Map4dMap
//
//  Created by Huy Dang on 29/12/2020.
//

#ifndef MFPOIData_h
#define MFPOIData_h

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface MFPOIData : NSObject

@property (nonatomic, strong, nullable) NSString* id;

@property (nonatomic) CLLocationCoordinate2D position;

@property (nonatomic, strong, nullable) NSString* title;

@property (nonatomic, strong, nullable) UIColor* titleColor;

@property (nonatomic, strong, nullable) NSString* type;

@property (nonatomic, strong, nullable) NSURL* iconUrl;

@property (nonatomic) float zIndex;

- (instancetype _Nonnull)initWithId:(NSString* _Nonnull)id position:(CLLocationCoordinate2D)position title:(NSString* _Nullable)title;

@end

#endif /* MFPOIData_h */
