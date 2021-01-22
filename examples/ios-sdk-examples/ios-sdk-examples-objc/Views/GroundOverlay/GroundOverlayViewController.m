//
//  GroundOverlayViewController.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 27/01/2021.
//

#import "GroundOverlayViewController.h"
#import <Map4dMap/Map4dMap.h>
#import "GroundURLConstructor.h"

@interface GroundOverlayViewController()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;

@property (strong, nonatomic, nullable) MFGroundOverlay *groundOverlay;

@end

@implementation GroundOverlayViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self createGroundOverlay];
  [self addGroundOverlay];
}

- (void)createGroundOverlay {

  CLLocationCoordinate2D coor0 = CLLocationCoordinate2DMake(16.059547034047146, 108.22125434875488);
  CLLocationCoordinate2D coor1 = CLLocationCoordinate2DMake(16.075630202564316, 108.23086738586424);
  MFCoordinateBounds *bounds = [[MFCoordinateBounds alloc] initWithCoordinate:coor0 coordinate1:coor1];
  GroundURLConstructor *urlConstructor = [[GroundURLConstructor alloc] init];
  MFGroundOverlay *groundOverlay = [MFGroundOverlay groundOverlayWithBounds:bounds tileURLConstructor:urlConstructor overrideBaseMap:YES];
  
  self.groundOverlay = groundOverlay;
}

- (void)addGroundOverlay {
  self.groundOverlay.map = self.mapView;
}

- (void)removeGroundOverlay {
  self.groundOverlay.map = nil;
}

- (void)hideGroundOverlay {
  self.groundOverlay.isHidden = YES;
}

- (void)showGroundOverlay {
  self.groundOverlay.isHidden = NO;
}

@end
