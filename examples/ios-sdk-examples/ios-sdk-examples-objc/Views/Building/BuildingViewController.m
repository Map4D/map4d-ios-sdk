//
//  BuildingViewController.m
//  ios-sdk-examples-objc
//
//  Created by iMacbook on 2/1/21.
//

#import "BuildingViewController.h"
#import <Map4dMap/Map4dMap.h>
#import <UIKit/UIKit.h>


@interface BuildingViewController ()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

@end

@interface BuildingViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation BuildingViewController {
  NSMutableArray<MFBuilding*> *buildings;
  int i;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [[self navigationItem] setTitle: @"BUILDING"];
  [_mapView setPOIsEnabled: NO];
  [_mapView setDelegate: self];
  [_mapView enable3DMode: YES];
  [_mapView setBuildingsEnabled: NO];
  CLLocationCoordinate2D location = _mapView.camera.target;
  buildings = [NSMutableArray array];
  i = 0;
  [buildings addObject:[self drawPOILocation:location name:@"MAP4D"]] ;
}

- (IBAction)didTapAdd:(id)sender {
  [_removeButton setHidden: NO];
  [_titleLabel setHidden: YES];
  double lat = (random() % 1000) / 100000.0 - 0.005;
  double lng = (random() % 1000) / 100000.0 - 0.005;
  CLLocationCoordinate2D location = _mapView.camera.target;
  location.latitude = location.latitude + lat;
  location.longitude = location.longitude + lng;
  MFCameraUpdate *camera = [MFCameraUpdate setTarget:location];
  [_mapView moveCamera: camera];
  i += 1;
  MFBuilding *building = [self drawPOILocation:location name:[NSString stringWithFormat:@"MAP4D - %d", i]];
  [buildings addObject: building];
}

- (IBAction)didTapRemove:(id)sender {
  [_titleLabel setHidden: YES];
  NSUInteger count = [buildings count];
  if (count < 1) {
    return;
  }
  [_removeButton setHidden: count < 2];
  [[buildings lastObject] setMap: nil];
  [buildings removeLastObject];
}

- (MFBuilding*) drawPOILocation: (CLLocationCoordinate2D) location name: (NSString*) name {
  MFBuilding* building = [[MFBuilding alloc] init];
  [building setPosition: location];
  [building setName:name];
  [building setZIndex: 2.0];
  [building setTexture: @"https://sw-hcm-1.vinadata.vn/v1/AUTH_d0ecabcbdcd74f6aa6ac9a5da528eb78/sdk/textures/0cb35e1610c34e55946a7839356d8f66.jpg"];
  [building setModel: @"https://sw-hcm-1.vinadata.vn/v1/AUTH_d0ecabcbdcd74f6aa6ac9a5da528eb78/sdk/models/5b21d9a5cd18d02d045a5e99"];
  [building setMap: _mapView];
  return building;
}
@end

@implementation BuildingViewController(MFMapViewDelegate)
- (void)mapView:(MFMapView *)mapView didTapBuilding:(MFBuilding *)building {
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"title: %@", building.name]];
}

- (void)mapView:(MFMapView *)mapView didTapBuildingWithBuildingID:(NSString *)buildingID name:(NSString *)name location:(CLLocationCoordinate2D)location {
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"title: %@", name]];
}
@end
