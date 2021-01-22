//
//  POIOverlayViewController.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 27/01/2021.
//

#import "POIOverlayViewController.h"
#import <Map4dMap/Map4dMap.h>
#import "POIURLConstructor.h"

@interface POIOverlayViewController()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;
@property (strong, nonatomic, nullable) MFURLPOILayer *poiOverlay;

@end

@interface POIOverlayViewController(MFMapViewDelegate) <MFMapViewDelegate>
@end

@implementation POIOverlayViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.mapView.delegate = self;
  [self createPOIOverlay];
  [self addPOIOverlay];
}

- (void)createPOIOverlay {
  POIURLConstructor *urlConstructor = [[POIURLConstructor alloc] init];
  MFURLPOILayer *poiOverlay = [MFURLPOILayer poiLayerWithURLConstructor:urlConstructor prefixId:@"poi-layer-1_"];
  
  self.poiOverlay = poiOverlay;
}

- (void)addPOIOverlay {
  self.poiOverlay.map = self.mapView;
}

- (void)removePOIOverlay {
  self.poiOverlay.map = nil;
}

- (void)hidePOIOverlay {
  self.poiOverlay.isHidden = YES;
}

- (void)showPOIOverlay {
  self.poiOverlay.isHidden = NO;
}

@end



@implementation POIOverlayViewController(MFMapViewDelegate)

- (void)mapView: (MFMapView*)  mapView didTapPOIWithPlaceID: (NSString*) placeID name: (NSString*) name location: (CLLocationCoordinate2D) location {
  NSLog(@"Tap Poi: %@, name %@", placeID, name);
}

@end
