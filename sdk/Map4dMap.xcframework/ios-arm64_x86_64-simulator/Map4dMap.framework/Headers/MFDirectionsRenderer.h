//
//  MFDirectionsRenderer.h
//  Map4dMap
//
//  Created by Huy Dang on 8/12/21.
//

#ifndef MFDirectionsRenderer_h
#define MFDirectionsRenderer_h

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@class MFPath;
@class MFMapView;

@interface MFDirectionsRenderer : NSObject

@property(nonatomic, weak, nullable) MFMapView* map;

@property(nonatomic, strong, nullable) NSArray<MFPath*>* routes;
@property(nonatomic) NSUInteger activedIndex;

@property(nonatomic) BOOL hideOriginPOI;
@property(nonatomic) CLLocationCoordinate2D originPosition;
@property(nonatomic, strong, nullable) UIImage* originIcon;
@property(nonatomic) CGPoint originGroundAnchor;
@property(nonatomic, strong, nullable) NSString* originTitle;
@property(nonatomic, strong, nonnull) UIColor* originTitleColor;

@property(nonatomic) BOOL hideDestinationPOI;
@property(nonatomic) CLLocationCoordinate2D destinationPosition;
@property(nonatomic, strong, nullable) UIImage* destinationIcon;
@property(nonatomic) CGPoint destinationGroundAnchor;
@property(nonatomic, strong, nullable) NSString* destinationTitle;
@property(nonatomic, strong, nonnull) UIColor* destinationTitleColor;

@property(nonatomic) CGFloat activeStrokeWidth;
@property(nonatomic, strong, nonnull) UIColor* activeStrokeColor;
@property(nonatomic) CGFloat activeOutlineWidth;
@property(nonatomic, strong, nonnull) UIColor* activeOutlineColor;

@property(nonatomic) CGFloat inactiveStrokeWidth;
@property(nonatomic, strong, nonnull) UIColor* inactiveStrokeColor;
@property(nonatomic) CGFloat inactiveOutlineWidth;
@property(nonatomic, strong, nonnull) UIColor* inactiveOutlineColor;

- (void)setRoutesWithJson:(NSString* _Nullable) json;
- (void)setDatas:(NSArray<NSData*>* _Nullable) datas;

@end


#endif /* MFDirectionsRenderer_h */
