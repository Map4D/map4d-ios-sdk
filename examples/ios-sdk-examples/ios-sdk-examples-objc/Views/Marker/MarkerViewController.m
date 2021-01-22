//
//  MarkerViewController.m
//  ios-sdk-examples-objc
//
//  Created by iMacbook on 2/2/21.
//

#import "MarkerViewController.h"
#import <UIKit/UIKit.h>
#import <Map4dMap/Map4dMap.h>

@interface MarkerViewController ()
@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (weak, nonatomic) IBOutlet UIButton *boundButton;

@end

@interface MarkerViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation MarkerViewController {
  NSMutableArray<MFMarker*> *markers;
  int i;
  bool flag;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [[self navigationItem] setTitle: @"MARKER"];
  [_mapView setPOIsEnabled: NO];
  [_mapView setDelegate: self];
  CLLocationCoordinate2D location = _mapView.camera.target;
  markers = [NSMutableArray array];
  i = 0;
  flag = true;
  [markers addObject:[self drawWithLocation:location title:@"MAP4D"]] ;
}

- (IBAction)didTapAdd:(id)sender {
  [_removeButton setHidden: NO];
  [_boundButton setHidden: NO];
  [_titleLabel setHidden: YES];
  
  double lat = (random() % 500) / 50000.0 - 0.005;
  double lng = (random() % 500) / 50000.0 - 0.005;
  CLLocationCoordinate2D location = _mapView.camera.target;
  location.latitude = location.latitude + lat;
  location.longitude = location.longitude + lng;
  i += 1;
  
  MFMarker * marker = [self drawWithLocation:location title:[NSString stringWithFormat:@"MAP4D - %d", i]];
  [markers addObject:marker] ;
}

- (IBAction)didTapRemove:(id)sender {
  [_titleLabel setHidden: YES];
  NSUInteger count = [markers count];
  if (count < 1) {
    return;
  }
  [_removeButton setHidden: count < 2];
  [_boundButton setHidden: count < 2];
  [[markers lastObject] setMap: nil];
  [markers removeLastObject];
}

- (IBAction)didTapBound:(id)sender {
  NSUInteger count = [markers count];
  if (count < 1) {
    return;
  }
  MFMutablePath *path = [[MFMutablePath alloc] init];
  for (int k = 0; k < count; k++) {
    CLLocationCoordinate2D position = markers[k].position;
    [path addCoordinate:position];
  }
  MFCoordinateBounds *bounds = [[[MFCoordinateBounds alloc]init] includingPath:path];
  [_mapView animateCamera: [MFCameraUpdate fitBounds:bounds]];
}

- (MFMarker*) drawWithLocation: (CLLocationCoordinate2D) location title: (NSString*) title {
  MFMarker* marker = [[MFMarker alloc] init];
  [marker setPosition: location];
  [marker setZIndex: 2.0];
  [marker setIcon: [UIImage imageNamed: @"ic_marker"]];
  [marker setTitle: title];
  [marker setSnippet: @"IOT-Link"];
  [marker setMap: _mapView];
  [marker setDraggable: YES];
  return marker;
}

@end

@implementation MarkerViewController(MFMapViewDelegate)
- (BOOL)mapview:(MFMapView *)mapView didTapMarker:(MFMarker *)marker {
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"Id of marker: %u", (unsigned int)marker.Id]];
  return NO;
}

- (void)mapview:(MFMapView *)mapView didTapInfoWindowOfMarker:(MFMarker *)marker {
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"title: %@", marker.title]];
}

- (void)mapview:(MFMapView *)mapView didDragMarker:(MFMarker *)marker {
  [_titleLabel setHidden: NO];
  NSString *location = [NSString stringWithFormat: @"%f, %f" , marker.position.latitude, marker.position.longitude];
  [_titleLabel setText: [NSString stringWithFormat: @"pos: %@", location]];
}

- (void)mapview:(MFMapView *)mapView didBeginDraggingMarker:(MFMarker *)marker {
  [_titleLabel setHidden: NO];
  NSString *location = [NSString stringWithFormat: @"%f, %f" , marker.position.latitude, marker.position.longitude];
  [_titleLabel setText: [NSString stringWithFormat: @"pos: %@", location]];
}

- (void)mapview:(MFMapView *)mapView didEndDraggingMarker:(MFMarker *)marker {
  [_titleLabel setHidden: NO];
  NSString *location = [NSString stringWithFormat: @"%f, %f" , marker.position.latitude, marker.position.longitude];
  [_titleLabel setText: [NSString stringWithFormat: @"%@", location]];
}
@end
