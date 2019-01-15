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


typedef NS_ENUM(NSUInteger, MFSwitchMode) {
  MFSwitchModeDefault,
  MFSwitchModeAuto2DTo3D,
  MFSwitchModeAuto3DTo2D,
  MFSwitchModeAuto,
  MFSwitchModeManual
};

@interface MFMapView : UIView 

  @property (nonatomic, strong, setter=setMapUrl:) NSString* _Nullable mapUrl;

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

  // Native Zoom
  - (void) setMaxNativeZoom: (double) zoom;

  - (void) enable3dMode: (bool) enabled;

  // Get Mode
  - (bool) is3dMode;

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

@end
