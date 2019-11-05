//
//  MapView.h
//  mapes
//
//  Created by Sua Le on 8/10/18.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MFMapViewDelegate;
@protocol LocationManagerDelegate;
@class MFProjection;
@class MFCameraPosition;
@class MFCoordinateBounds;


typedef NS_ENUM(NSUInteger, MFSwitchMode) {
  MFSwitchModeDefault,
  MFSwitchModeAuto2DTo3D,
  MFSwitchModeAuto3DTo2D,
  MFSwitchModeAuto,
  MFSwitchModeManual
};

@interface MFMapView : UIView
  // Delegate
  @property(nonatomic, weak, nullable) IBOutlet id<MFMapViewDelegate> delegate;

  //Projection
  @property(nonatomic, readonly) MFProjection * _Nullable projection;

  //SwitchMode
  @property(nonatomic) MFSwitchMode switchMode;

  // Camera
  @property(nonatomic, copy) MFCameraPosition * _Nullable camera;

  - (instancetype _Nonnull )initWithFrame: (CGRect)frame;

  // Enable My Location
  - (void) setMyLocationEnabled: (bool) _isMyLocationEnable;

  // Set selected place
  - (void) setSelectedPlace: (NSString* _Nullable) placeId;

  // Get selected place
  - (NSString* _Nullable) getSelectedPlace;

  // Set filter places place
  - (void) setFilterPlaces: (NSArray<NSString*>* _Nullable) filterPlaces;
  
  // Get filter places place
- (NSArray<NSString*>* _Nonnull) getFilterPlaces;
  
  // Set place enabled
  - (void) setPlacesEnabled: (bool) enabled;
  
  // Is places enabled
  - (bool) isPlacesEnabled;

  // Native Zoom
  - (void) setMaxNativeZoom: (double) zoom;

  - (void) enable3DMode: (bool) enabled;

  // Get Mode
  - (bool) is3DMode;

  - (void) setMinZoom: (double) minZoom maxZoom: (double) maxZoom;

  /*
  * Clears all markup that has been added to the map, including markers, polylines and ground
  * overlays.  This will not clear the visible location dot or reset the current mapType.
  */
  - (void) clear;

  /*
   * Set time display for map
   * Default curent time
   * return  current time if date is NULL
   */
  - (void) setTime: (nullable NSDate*) date;

/**
 Enable Water Effect on 3D Mode
 */
  - (void) enableWaterEffect: (bool) enabled;

/**
 Build a MFCameraPosition that presents bounds with padding.
 */
- (nullable MFCameraPosition*) cameraForBounds: (nonnull MFCoordinateBounds*) bounds insets: (UIEdgeInsets) insets;

/**
 Build a MFCameraPosition that presents bounds.
 */
- (nullable MFCameraPosition*) cameraForBounds: (nonnull MFCoordinateBounds*) bounds;

@end
