//
//  DirectionsRendererViewController.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 9/27/21.
//

#import "DirectionsRendererViewController.h"
#import <Map4dMap/Map4dMap.h>

@interface DirectionsRendererViewController()
@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnAddRemove;
@property (strong, nonatomic, nullable) MFDirectionsRenderer* renderer;

@end

@interface DirectionsRendererViewController(Delegate) <MFMapViewDelegate>

@end

@implementation DirectionsRendererViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [[self navigationItem] setTitle:@"Directions Renderer"];
  [self buildDirectionsRenderer];
  _mapView.camera = [[MFCameraPosition alloc] initWithTarget:CLLocationCoordinate2DMake(16.077491, 108.221735) zoom:17 tilt:0 bearing:0];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  _mapView.delegate = self;
}

- (void)buildDirectionsRenderer {
  if (_renderer == nil) {
    _renderer = [[MFDirectionsRenderer alloc] init];
    
    MFMutablePath* route0 = [[MFMutablePath alloc] init];
    [route0 addCoordinate:CLLocationCoordinate2DMake(16.078814, 108.221592)];
    [route0 addCoordinate:CLLocationCoordinate2DMake(16.078972, 108.223034)];
    [route0 addCoordinate:CLLocationCoordinate2DMake(16.075353, 108.223513)];
    
    MFMutablePath* route1 = [[MFMutablePath alloc] init];
    [route1 addCoordinate:CLLocationCoordinate2DMake(16.078814, 108.221592)];
    [route1 addCoordinate:CLLocationCoordinate2DMake(16.077491, 108.221735)];
    [route1 addCoordinate:CLLocationCoordinate2DMake(16.077659, 108.223212)];
    [route1 addCoordinate:CLLocationCoordinate2DMake(16.075353, 108.223513)];
    
    _renderer.routes = @[route0, route1];
    _renderer.originPosition = CLLocationCoordinate2DMake(16.079264, 108.220959);
    _renderer.originTitle = @"Begin Location";
    _renderer.originTitleColor = UIColor.redColor;
    _renderer.destinationTitle = @"End Location";
    _renderer.destinationTitleColor = UIColor.brownColor;
  }
}

- (void)addRenderer {
  _renderer.map = _mapView;
  [_btnAddRemove setTitle:@"Remove Directions Renderer" forState:UIControlStateNormal];
}

- (void)removeRenderer {
  _renderer.map = nil;
  [_btnAddRemove setTitle:@"Add Directions Renderer" forState:UIControlStateNormal];
}

- (IBAction)didTapAddRemove:(id)sender {
  if (_renderer.map == nil) {
    [self addRenderer];
  }
  else {
    [self removeRenderer];
  }
}

- (void)mapView:(MFMapView *)mapView didTapDirectionsRenderer:(MFDirectionsRenderer *)renderer routeIndex:(NSUInteger)routeIndex {
  _renderer.activedIndex = routeIndex;
}

@end
