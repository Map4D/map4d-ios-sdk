//
//  MFMapView.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2018 IOTLink LLC.
//

#import "MFUISettings.h"
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MFMapViewDelegate;
@protocol LocationManagerDelegate;

@class MFMapID;
@class MFMapStyle;
@class MFProjection;
@class MFCameraPosition;
@class MFCoordinateBounds;

NS_ASSUME_NONNULL_BEGIN

/**
 * Display types for MFMapView.
 */
typedef NS_ENUM(NSUInteger, MFMapType) {
  /** Roadmap maps.  The default. */
  MFMapTypeRoadmap,

  /** Satellite maps. */
  MFMapTypeSatellite,

  /** Mixture of normal and satellite. */
  MFMapTypeHybrid,
};

@interface MFMapView : UIView

/** MFMapView delegate */
@property(nonatomic, weak, nullable) IBOutlet id<MFMapViewDelegate> delegate;

/**
 * Returns a MFProjection object that you can use to convert between screen
 * coordinates and latitude/longitude coordinates.
 */
@property(nonatomic, readonly, nullable) MFProjection *projection;

/** Camera */
@property(nonatomic, copy, nullable) MFCameraPosition *camera;

@property(nonatomic, readonly) MFUISettings *settings;

@property(nonatomic) MFMapType mapType;

@property(nonatomic, nullable) MFMapStyle *mapStyle;

@property(nonatomic) CGFloat nativeScale;

- (instancetype)initWithFrame:(CGRect)frame;

- (instancetype)initWithFrame:(CGRect)frame mapID:(MFMapID *)mapID;

- (void)setMapID:(MFMapID *)mapID;

/** Enable My Location */
- (void)setMyLocationEnabled:(bool)_isMyLocationEnable;
- (CLLocation *_Nullable)getMyLocation;

- (void)setPOIsEnabled:(bool)enabled;
- (bool)isPOIsEnabled;

- (void)setBuildingsEnabled:(bool)enabled;
- (bool)isBuildingsEnabled;

- (void)setSelectedBuildings:(NSArray<NSString *> *_Nullable)buildingIds;

/** Native Zoom */
- (void)setMaxNativeZoom:(double)zoom;

- (void)setMinZoom:(double)minZoom maxZoom:(double)maxZoom;

/**
 * Clears all markup that has been added to the map, including markers,
 * polylines and ground overlays.  This will not clear the visible location dot
 * or reset the current mapType.
 */
- (void)clear;

/**
 * Set time display for map
 * Default curent time
 * return  current time if date is NULL
 */
- (void)setTime:(nullable NSDate *)date;

/** Enable Water Effect */
- (void)enableWaterEffect:(bool)enabled;

/** Build a MFCameraPosition that presents bounds. */
- (nullable MFCameraPosition *)cameraForBounds:(MFCoordinateBounds *)bounds;

/** Build a MFCameraPosition that presents bounds with padding. */
- (nullable MFCameraPosition *)cameraForBounds:(MFCoordinateBounds *)bounds
                                        insets:(UIEdgeInsets)insets;

/** Get current MapView bounds */
- (nullable MFCoordinateBounds *)getBounds;

- (double)metersForPoints:(double)points;
- (double)pointsForMeters:(double)meters;

@end

NS_ASSUME_NONNULL_END

