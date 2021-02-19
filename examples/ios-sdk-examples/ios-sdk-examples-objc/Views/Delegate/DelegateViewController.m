//
//  DelegateViewController.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 03/02/2021.
//

#import "DelegateViewController.h"
#import <Map4dMap/Map4dMap.h>

@interface DelegateViewController()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *delegateTitle;
@property (weak, nonatomic) IBOutlet UILabel *delegateSubtitle;
@property (weak, nonatomic) IBOutlet UIButton *modeButton;
@property (weak, nonatomic) IBOutlet UIButton *shouldChangeMapModeButton;

@end

@interface DelegateViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation DelegateViewController
{
  BOOL shouldChangeMode;
}

- (instancetype)init {
  if (self = [super init]) {
    shouldChangeMode = YES;
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
  if (self = [super initWithCoder:coder]) {
    shouldChangeMode = YES;
  }
  return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    shouldChangeMode = YES;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationItem.title = @"Map4D Delegate";
  _delegateTitle.text = @"";
  _delegateSubtitle.text = @"";
  _mapView.delegate = self;
  _mapView.myLocationEnabled = YES;
}

- (IBAction)didTapModeButton:(id)sender {
  [_mapView enable3DMode:!_mapView.is3DMode];
  [_modeButton setTitle:(_mapView.is3DMode ? @"2D" : @"3D") forState:UIControlStateNormal];
}

- (IBAction)didTapShouldChangMapModeButton:(id)sender {
  shouldChangeMode = !shouldChangeMode;
  if (shouldChangeMode) {
    [_shouldChangeMapModeButton setTitle:@"ShouldChangeMapMode: YES" forState:UIControlStateNormal];
  }
  else {
    [_shouldChangeMapModeButton setTitle:@"ShouldChangeMapMode: NO" forState:UIControlStateNormal];
  }
}

@end

@implementation DelegateViewController(MFMapViewDelegate)

- (void)mapView: (MFMapView*)  mapView willMove: (BOOL) gesture {
  [self setDelegateTitle:@"willMove" delegateSubtitle:nil];
}

- (void)mapView: (MFMapView*)  mapView movingCameraPosition: (MFCameraPosition*) position {
  NSString* subtitle = [NSString stringWithFormat:@"target: {%.4f, %.4f}, zoom: %.f, tilt: %.f, bearing: %.f", position.target.latitude, position.target.longitude, position.zoom, position.tilt, position.bearing];
  [self setDelegateTitle:@"movingCameraPosition" delegateSubtitle:subtitle];
}

- (void)mapView: (MFMapView*)  mapView didChangeCameraPosition:(MFCameraPosition*) position {
  NSString* subtitle = [NSString stringWithFormat:@"target: {%.4f, %.4f}, zoom: %.f, tilt: %.f, bearing: %.f", position.target.latitude, position.target.longitude, position.zoom, position.tilt, position.bearing];
  [self setDelegateTitle:@"didChangeCameraPosition" delegateSubtitle:subtitle];
}

- (void)mapView: (MFMapView*)  mapView idleAtCameraPosition: (MFCameraPosition *) position {
  NSString* subtitle = [NSString stringWithFormat:@"target: {%.4f, %.4f}, zoom: %.f, tilt: %.f, bearing: %.f", position.target.latitude, position.target.longitude, position.zoom, position.tilt, position.bearing];
  [self setDelegateTitle:@"idleAtCameraPosition" delegateSubtitle:subtitle];
}

- (void)mapView: (MFMapView*)  mapView didTapAtCoordinate: (CLLocationCoordinate2D) coordinate {
  NSString* subtitle = [NSString stringWithFormat:@"latitude: %f, longitude: %f", coordinate.latitude, coordinate.longitude];
  [self setDelegateTitle:@"didTapAtCoordinate" delegateSubtitle:subtitle];
}

- (void)mapView: (MFMapView*)  mapView onModeChange: (bool) is3DMode {
  [_modeButton setTitle:is3DMode ? @"2D" : @"3D" forState:UIControlStateNormal];
  NSString* subtitle = is3DMode ? @"3D" : @"2D";
  [self setDelegateTitle:@"onModeChange" delegateSubtitle:subtitle];
}


- (void)mapView: (MFMapView*)  mapView didTapBuildingWithBuildingID: (NSString*) buildingID name: (NSString*) name location: (CLLocationCoordinate2D) location {
  NSString* subtitle = [NSString stringWithFormat:@"Building ID: %s", [buildingID UTF8String]];
  [self setDelegateTitle:@"didTapBuildingWithBuildingID" delegateSubtitle:subtitle];
}

- (void)mapView: (MFMapView*)  mapView didTapPOIWithPlaceID: (NSString*) placeID name: (NSString*) name location: (CLLocationCoordinate2D) location {
  NSString* subtitle = [NSString stringWithFormat:@"Place ID: %s", [placeID UTF8String]];
  [self setDelegateTitle:@"didTapPOIWithPlaceID" delegateSubtitle:subtitle];
}

- (void)mapView: (MFMapView*)  mapView didTapMyLocation: (CLLocationCoordinate2D) location {
  NSString* subtitle = [NSString stringWithFormat:@"Location: {lat: %f, lng: %f}", location.latitude, location.longitude];
  [self setDelegateTitle:@"didTapMyLocation" delegateSubtitle:subtitle];
}

- (BOOL)shouldChangeMapModeForMapView: (MFMapView*) mapView {
  [self setDelegateTitle:@"shouldChangeMapMode" delegateSubtitle:nil];
  return shouldChangeMode;
}

- (BOOL)didTapMyLocationButtonForMapView: (MFMapView*) mapView {
  [self setDelegateTitle:@"didTapMyLocationButton" delegateSubtitle:nil];
  return YES;
}

- (void)setDelegateTitle:(NSString *)title delegateSubtitle:(NSString *)subtitle {
  NSMutableString* log = [[NSMutableString alloc]initWithString:@""];
  if ([title length] == 0) {
    [_delegateTitle setText:@""];
    [_delegateTitle setHidden:YES];
  }
  else {
    [_delegateTitle setText:title];
    [_delegateTitle setHidden:NO];
    [log appendString:title];
  }
  
  if ([subtitle length] == 0) {
    [_delegateSubtitle setText:@""];
    [_delegateSubtitle setHidden:YES];
  }
  else {
    [_delegateSubtitle setText:subtitle];
    [_delegateSubtitle setHidden:NO];
    [log appendFormat:@" | %s", [subtitle UTF8String]];
  }
  NSLog(@"%s", log.UTF8String);
}


@end
