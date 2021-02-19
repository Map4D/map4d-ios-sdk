//
//  PolylineViewController.m
//  ios-sdk-examples-objc
//
//  Created by iMacbook on 2/2/21.
//

#import "PolylineViewController.h"
#import <Map4dMap/Map4dMap.h>

@interface PolylineViewController ()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

@end

@interface PolylineViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation PolylineViewController {
  MFPolyline *polyline;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [[self navigationItem] setTitle: @"POLYLINE"];
  [_mapView setPOIsEnabled: NO];
  [_mapView setDelegate: self];
  polyline = [[MFPolyline alloc] init];
  [self draw: polyline];
}

- (IBAction)didTapAdd:(id)sender {
  [_removeButton setHidden: NO];
  [_titleLabel setHidden: YES];
  if (polyline != nil) {
    return;
  }
  polyline = [[MFPolyline alloc] init];
  [self draw:polyline];
}

- (IBAction)didTapRemove:(id)sender {
  [_titleLabel setHidden: YES];
  [_removeButton setHidden: YES];
  [polyline setMap: nil];
  polyline = nil;
}

- (void) draw: (MFPolyline*) polyline {
  MFMutablePath *path = [[MFMutablePath alloc] init];
  [path addCoordinate: CLLocationCoordinate2DMake(16.075370898415514, 108.22887796703878)];
  [path addCoordinate: CLLocationCoordinate2DMake(16.072266586439582, 108.22896530020222)];
  [path addCoordinate: CLLocationCoordinate2DMake(16.07181296817015, 108.22398711335603)];
  [path addCoordinate: CLLocationCoordinate2DMake(16.07548312266711, 108.22345067080795)];
  [polyline setPath: path];
  [polyline setWidth: 10.0];
  [polyline setColor: [self randomColor]];
  [polyline setMap: _mapView];
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

@implementation PolylineViewController(MFMapViewDelegate)
- (void)mapview:(MFMapView *)mapView didTapPolyline:(MFPolyline *)polyline {
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"PolylineId: %u", (unsigned int)polyline.Id]];
}

@end
