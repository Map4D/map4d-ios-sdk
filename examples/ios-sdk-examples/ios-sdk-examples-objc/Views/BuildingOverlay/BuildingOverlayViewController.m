//
//  BuildingOverlayViewController.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 28/01/2021.
//

#import "BuildingOverlayViewController.h"
#import <Map4dMap/Map4dMap.h>
#import "BuildingURLConstructor.h"

@interface BuildingOverlayViewController()
@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (strong, nonatomic, nullable) MFURLBuildingLayer * buildingOverlay;
@end

@interface BuildingOverlayViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation BuildingOverlayViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.mapView enable3DMode:YES];
  [self.mapView setDelegate:self];
  [self createBuildingOverlay];
  [self addBuildingOverlay];
}

- (void)createBuildingOverlay {
  BuildingURLConstructor *urlConstructor = [[BuildingURLConstructor alloc] init];
  MFURLBuildingLayer *buildingOverlay = [MFURLBuildingLayer buildingLayerWithURLConstructor:urlConstructor prefixId:@"building-"];
  
  self.buildingOverlay = buildingOverlay;
}

- (void)addBuildingOverlay {
  self.buildingOverlay.map = self.mapView;
}

- (void)removeBuildingOverlay {
  self.buildingOverlay.map = nil;
}

- (void)hideBuildingOverlay {
  self.buildingOverlay.isHidden = YES;
}

- (void)showBuildingOverlay {
  self.buildingOverlay.isHidden = NO;
}

@end


@implementation BuildingOverlayViewController(MFMapViewDelegate)

- (void)mapView: (MFMapView*)  mapView didTapBuildingWithBuildingID: (NSString*) buildingID name: (NSString*) name location: (CLLocationCoordinate2D) location {
  NSLog(@"Tap building %@, name: %@", buildingID, name);
}

@end
