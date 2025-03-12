//
//  MFBuilding.h
//  Map4dMap
//
//  Created by Huy Dang on 6/11/20.
//

#ifndef MFBuilding_h
#define MFBuilding_h

#import "MFOverlay.h"

@class MFPath;

@interface MFBuilding : MFOverlay

@property(nonatomic, strong, nullable) NSString* name;

@property(nonatomic) CLLocationCoordinate2D position;

@property(nonatomic, strong, nullable) NSString* model;

@property(nonatomic, strong, nullable) NSString* texture;

@property(nonatomic, strong, nullable) MFPath* coordinates;

@property(nonatomic) double height;

@property(nonatomic) double scale;

@property(nonatomic) CGFloat bearing;

@property(nonatomic) double elevation;

@property(nonatomic, getter=isSelected) bool selected;

@property(nonatomic, strong, nullable) NSMutableArray* types;
@property(nonatomic) double minZoom;
@property(nonatomic) double maxZoom;
@property(nonatomic) NSDate* _Nullable startDate;
@property(nonatomic) NSDate* _Nullable endDate;

/** A Boolean value that determines whether user events are ignored and removed from the event queue. */
@property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;

- (instancetype _Nonnull) init;

@end

#endif /* MFBuilding_h */
