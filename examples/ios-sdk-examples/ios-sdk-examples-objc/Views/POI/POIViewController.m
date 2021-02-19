//
//  POIViewController.m
//  ios-sdk-examples-objc
//
//  Created by iMacbook on 2/1/21.
//

#import "POIViewController.h"
#import <Map4dMap/Map4dMap.h>
#import <UIKit/UIKit.h>

@interface POIViewController ()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *removePOIButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@interface POIViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation POIViewController
{
  NSMutableArray<MFPOI*> *pois;
  int i;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [[self navigationItem] setTitle: @"POI"];
  [_mapView setPOIsEnabled: NO];
  [_mapView setDelegate: self];
  CLLocationCoordinate2D location = _mapView.camera.target;
  pois = [NSMutableArray array];
  i = 0;
  [pois addObject:[self drawPOILocation:location title:@"MAP4D" type:@"cafe"]] ;
  
}

- (IBAction)didTapAdd:(id)sender {
  [_removePOIButton setHidden: NO];
  [_titleLabel setHidden: YES];
  
  double lat = (random() % 500) / 50000.0 - 0.005;
  double lng = (random() % 500) / 50000.0 - 0.005;
  CLLocationCoordinate2D location = _mapView.camera.target;
  location.latitude = location.latitude + lat;
  location.longitude = location.longitude + lng;
  i += 1;
  
  MFPOI * poi = [self drawPOILocation:location title:[NSString stringWithFormat:@"MAP4D - %d", i] type:@"cafe"];
  [pois addObject:poi] ;
}

- (IBAction)didTapRemove:(id)sender {
  [_titleLabel setHidden: YES];
  NSUInteger count = [pois count];
  if (count < 1) {
    return;
  }
  [_removePOIButton setHidden: count < 2];
  [[pois lastObject] setMap: nil];
  [pois removeLastObject];
  
}

- (MFPOI*) drawPOILocation: (CLLocationCoordinate2D) location title: (NSString*) title type: (NSString*) type {
  MFPOI* poi = [[MFPOI alloc] init];
  [poi setPosition: location];
  [poi setTitle: title];
  [poi setType: type];
  [poi setZIndex: 2.0];
  [poi setTitleColor: UIColor.redColor];
  [poi setMap: _mapView];
  return poi;
}
@end

@implementation POIViewController(MFMapViewDelegate)
- (void)mapView:(MFMapView *)mapView didTapPOI:(MFPOI *)poi {
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"title: %@", poi.title]];
}

- (void)mapView:(MFMapView *)mapView didTapPOIWithPlaceID:(NSString *)placeID name:(NSString *)name location:(CLLocationCoordinate2D)location {
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"title: %@", name]];
}
@end
