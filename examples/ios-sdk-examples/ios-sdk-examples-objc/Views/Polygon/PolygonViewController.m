//
//  PolygonViewController.m
//  ios-sdk-examples-objc
//
//  Created by iMacbook on 2/2/21.
//

#import "PolygonViewController.h"
#import <Map4dMap/Map4dMap.h>

@interface PolygonViewController ()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@end

@interface PolygonViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation PolygonViewController {
  MFPolygon *polygon;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [[self navigationItem] setTitle: @"POLYGON"];
  [_mapView setPOIsEnabled: NO];
  [_mapView setDelegate: self];
  polygon = [[MFPolygon alloc] init];
  [self draw: polygon];
}

- (IBAction)didTapAdd:(id)sender {
  [_removeButton setHidden: NO];
  [_titleLabel setHidden: YES];
  if (polygon != nil) {
    return;
  }
  polygon = [[MFPolygon alloc] init];
  [self draw:polygon];
}

- (IBAction)didTapRemove:(id)sender {
  [_titleLabel setHidden: YES];
  [_removeButton setHidden: YES];
  [polygon setMap: nil];
  polygon = nil;
}

- (void) draw: (MFPolygon*) polygon {
  MFMutablePath *path = [[MFMutablePath alloc] init];
  [path addCoordinate:CLLocationCoordinate2DMake(16.072699584731552, 108.23020984691385)];
  [path addCoordinate:CLLocationCoordinate2DMake(16.07608106276882, 108.22671224150031)];
  [path addCoordinate:CLLocationCoordinate2DMake(16.0730244298952, 108.22336243622124)];
  [path addCoordinate:CLLocationCoordinate2DMake(16.070900670809152, 108.22593736045201)];
  [path addCoordinate:CLLocationCoordinate2DMake(16.070485456927244, 108.22957624088468)];
  [path addCoordinate:CLLocationCoordinate2DMake(16.072699584731552, 108.23020984691385)];

  MFMutablePath *hole = [[MFMutablePath alloc] init];
  [hole addCoordinate:CLLocationCoordinate2DMake(16.073472611109437, 108.22747377269246)];
  [hole addCoordinate:CLLocationCoordinate2DMake(16.071575666602996, 108.22781709595301)];
  [hole addCoordinate:CLLocationCoordinate2DMake(16.072503522154975, 108.22573569886646)];
  [hole addCoordinate:CLLocationCoordinate2DMake(16.073946844408653, 108.22612193750109)];

  NSMutableArray *holes = [[NSMutableArray alloc] init];
  [holes addObject: hole];

  [polygon setPath: path];
  [polygon setHoles: holes];
  [polygon setStrokeWidth:20.0];
  [polygon setStrokeColor:[self randomColor]];
  [polygon setFillColor: [self randomColor]];
  [polygon setMap: _mapView];
}

- (UIColor *)randomColor
{
  double red = random() % 255 / 255.0;
  double green = random() % 255 / 255.0;
  double blue = random() % 255 / 255.0;
  UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
  NSLog(@"%@", color);
  return color;
}
@end

@implementation PolygonViewController(MFMapViewDelegate)
- (void)mapview:(MFMapView *)mapView didTapPolygon:(MFPolygon *)polygon {
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"PolygonId: %u", (unsigned int)polygon.Id]];
}

@end
