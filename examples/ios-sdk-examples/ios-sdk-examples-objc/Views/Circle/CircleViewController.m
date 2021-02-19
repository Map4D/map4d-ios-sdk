//
//  CircleViewController.m
//  ios-sdk-examples-objc
//
//  Created by iMacbook on 2/2/21.
//

#import "CircleViewController.h"
#import <Map4dMap/Map4dMap.h>

@interface CircleViewController ()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@end

@interface CircleViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation CircleViewController {
  MFCircle *circle;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [[self navigationItem] setTitle: @"CIRCLE"];
  [_mapView setPOIsEnabled: NO];
  [_mapView setDelegate: self];
  circle = [[MFCircle alloc] init];
  [self draw: circle];
}

- (IBAction)didTapAdd:(id)sender {
  [_removeButton setHidden: NO];
  [_titleLabel setHidden: YES];
  if (circle != nil) {
    return;
  }
  circle = [[MFCircle alloc] init];
  [self draw:circle];
}

- (IBAction)didTapRemove:(id)sender {
  [_titleLabel setHidden: YES];
  [_removeButton setHidden: YES];
  [circle setMap: nil];
  circle = nil;
}

- (void) draw: (MFCircle*) circle {
  [circle setRadius: 100.0];
  [circle setPosition: _mapView.camera.target];
  [circle setStrokeColor:[self randomColor]];
  [circle setStrokeWidth: 10.0];
  [circle setFillColor: [self randomColor]];
  [circle setMap: _mapView];
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

@implementation CircleViewController(MFMapViewDelegate)
- (void)mapview:(MFMapView *)mapView didTapCircle:(MFCircle *)circle{
  [_titleLabel setHidden: NO];
  [_titleLabel setText: [NSString stringWithFormat: @"CircleId: %u", (unsigned int)circle.Id]];
}

@end
