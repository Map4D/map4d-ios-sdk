//
//  MFBuildingData.h
//  Map4dMap
//
//  Created by Huy Dang on 29/12/2020.
//

#ifndef MFBuildingData_h
#define MFBuildingData_h

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "MFPath.h"

@interface MFBuildingData : NSObject

@property (nonatomic, strong, nullable) NSString* id;

@property (nonatomic) CLLocationCoordinate2D position;

@property (nonatomic, strong, nullable) NSString* name;

@property (nonatomic) double scale;

@property (nonatomic) float bearing;

@property (nonatomic) double elevation;

@property (nonatomic) double height;

@property (nonatomic, strong, nullable) NSString* model;

@property (nonatomic, strong, nullable) NSString* texture;

@property (nonatomic, strong, nullable) MFPath* coordinates;

@property (nonatomic, strong, nullable) NSDate* startDate;

@property (nonatomic, strong, nullable) NSDate* endDate;

- (instancetype _Nonnull)initWithId:(NSString* _Nonnull)id position:(CLLocationCoordinate2D)position name:(NSString* _Nullable)name;

- (instancetype _Nonnull)initWithId:(NSString* _Nonnull)id position:(CLLocationCoordinate2D)position model:(NSString* _Nonnull)model texture:(NSString* _Nonnull)texture;

- (instancetype _Nonnull)initWithId:(NSString* _Nonnull)id position:(CLLocationCoordinate2D)position coordinates:(MFPath* _Nonnull)coordinates;

@end

#endif /* MFBuildingData_h */
