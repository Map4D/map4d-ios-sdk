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

#define FPS_PREFERRED_NORMAL 0
#define FPS_LIMITED_3D_EFFECT 15

@protocol MFMapViewDelegate;
@protocol LocationManagerDelegate;

@class MFMapID;
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

  /** Raster maps. */
  MFMapTypeRaster,

  /** Satellite maps. */
  MFMapTypeSatellite,

  /** 3D maps. */
  MFMapTypeMap3D,
};

@interface MFMapView : UIView

/** MFMapView delegate */
@property(nonatomic, weak, nullable) IBOutlet id<MFMapViewDelegate> delegate;

/**
 * Returns a MFProjection object that you can use to convert between screen
 * coordinates and latitude/longitude coordinates.
 */
@property(nonatomic, readonly) MFProjection *_Nullable projection;

/** Camera */
@property(nonatomic, copy) MFCameraPosition *_Nullable camera;

@property(nonatomic, strong, readonly) MFUISettings *settings;

@property(nonatomic, assign) MFMapType mapType;

@property(nonatomic) CGFloat nativeScale;

- (instancetype)initWithFrame:(CGRect)frame;

- (instancetype)initWithFrame:(CGRect)frame mapID:(MFMapID *)mapID;

/** Enable My Location */
- (void)setMyLocationEnabled:(bool)_isMyLocationEnable;
- (CLLocation *_Nullable)getMyLocation;

/** Set filter places place */
- (void)setFilterPlaces:(NSArray<NSString *> *_Nullable)filterPlaces;

/** Get filter places place */
- (NSArray<NSString *> *)getFilterPlaces;

- (void)setPOIsEnabled:(bool)enabled;
- (bool)isPOIsEnabled;
- (void)setBuildingsEnabled:(bool)enabled;
- (bool)isBuildingsEnabled;
- (void)setHiddenBuilding:(NSString *)buildingId;
- (void)setUnhiddenBuilding:(NSString *)buildingId;
- (void)setSelectedBuildings:(NSArray<NSString *> *_Nullable)buildingIds;
- (void)setMapID:(MFMapID *)mapID;

/** Native Zoom */
- (void)setMaxNativeZoom:(double)zoom;

- (void)enable3DMode:(bool)enabled DEPRECATED_MSG_ATTRIBUTE(
                         "This method was intended to set map type map 3D. It "
                         "has been superseded by 'mapType' property. This "
                         "method is subject to removal in a future versions.");

- (bool)is3DMode DEPRECATED_MSG_ATTRIBUTE(
    "This type of mode checking is not recommended. It is recommended that the "
    "'mapType' property be used instead. This method is subject to removal in "
    "a future versions.");

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

/** Enable Water Effect on 3D Mode */
- (void)enableWaterEffect:(bool)enabled;

/** Build a MFCameraPosition that presents bounds with padding. */
- (nullable MFCameraPosition *)cameraForBounds:(MFCoordinateBounds *)bounds
                                        insets:(UIEdgeInsets)insets;

/** Build a MFCameraPosition that presents bounds. */
- (nullable MFCameraPosition *)cameraForBounds:(MFCoordinateBounds *)bounds;

/** Get current MapView bounds */
- (nullable MFCoordinateBounds *)getBounds;

- (double)metersForPoints:(double)points;
- (double)pointsForMeters:(double)meters;

@end

NS_ASSUME_NONNULL_END

