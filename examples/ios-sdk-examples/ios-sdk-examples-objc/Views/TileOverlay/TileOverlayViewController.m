//
//  TileOverlayViewController.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 25/01/2021.
//

#import "TileOverlayViewController.h"
#import <Map4dMap/Map4dMap.h>
#import "TileURLConstructor.h"

@interface TileOverlayViewController()

@property (weak, nonatomic) IBOutlet MFMapView *mapView;

@property (strong, nonatomic, nullable) MFURLTileLayer *tileOverlay;

@end

@implementation TileOverlayViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self createTileOverlay];
  [self addTileOverlay];
}

- (void) createTileOverlay {
  TileURLConstructor * urlConstructor = [[TileURLConstructor alloc] init];
  MFURLTileLayer * tileOverlay = [MFURLTileLayer tileLayerWithURLConstructor:urlConstructor];
//  [tileOverlay setMap:self.mapView];
  self.tileOverlay = tileOverlay;
}

- (void) hideTileOverlay {
  self.tileOverlay.isHidden = true;
}

- (void) showTileOverlay {
  self.tileOverlay.isHidden = false;
}

- (void) addTileOverlay {
  self.tileOverlay.map = self.mapView;
}

- (void) removeTileOverlay {
  self.tileOverlay = nil;
}

@end
