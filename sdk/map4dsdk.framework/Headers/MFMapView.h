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

@interface MFMapView : UIView 


  @property (nonatomic, strong, setter=setMapUrl:) NSString* _Nullable mapUrl;
  @property (nonatomic, strong, setter=setMinZoom:) NSNumber* _Nullable minZoom;
  @property (nonatomic, strong, setter=setMaxZoom:) NSNumber* _Nullable maxZoom;

  // Delegate
  @property(nonatomic, weak, nullable) IBOutlet id<MFMapViewDelegate> delegate;

  //Projection
  @property(nonatomic, readonly) MFProjection * _Nullable projection;

  // Camera
  @property(nonatomic, copy, setter=setCamera:) MFCameraPosition * _Nullable camera;

  - (instancetype _Nonnull )initWithFrame: (CGRect)frame;
  // Enable My Location
  - (void) setMyLocationEnabled: (bool) _isMyLocationEnable;

  // Native Zoom
  - (void) setMaxNativeZoom: (double) zoom;

  - (void) enable3dMode: (bool) enabled;

  - (bool) is3dMode;

  /*
  * Clears all markup that has been added to the map, including markers, polylines and ground
  * overlays.  This will not clear the visible location dot or reset the current mapType.
  */
  - (void) clear;

@end
