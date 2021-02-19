//
//  CellItem.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 02/02/2021.
//

#import <Foundation/Foundation.h>
#import "CellItem.h"

typedef NS_ENUM(NSUInteger, Item) {
  setting,
  marker,
  polyline,
  polygon,
  circle,
  myLocation,
  delegate,
  annimation,
  tileOverlay,
  groundOverlay,
  poiOverlay,
  buildingOverlay,
  poi,
  buildling,
  
  /* max */
  MaximumItem
};

@interface CellItem()
@property (nonatomic, strong) NSMutableArray * items;
@end

@implementation CellItem

- (instancetype)init {
  if (self = [super init]) {
    _items = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < MaximumItem; i++) {
      [_items addObject:[NSNumber numberWithUnsignedInteger:i]];
    }
  }
  return self;
}

- (NSUInteger)count {
  return [_items count];
}

- (NSString*)nameOfItemAtIndex:(NSUInteger)index {
  Item item = index;
  switch (item) {
    case setting:
      return @"Setting";
      break;
    case marker:
      return @"Marker";
      break;
    case polyline:
      return @"Polyline";
      break;
    case polygon:
      return @"Polygon";
      break;
    case circle:
      return @"Circle";
      break;
    case myLocation:
      return @"My Location";
      break;
    case delegate:
      return @"Delegate";
      break;
    case annimation:
      return @"Annimation & Move";
      break;
    case tileOverlay:
      return @"Tile Overlay";
      break;
    case groundOverlay:
      return @"Ground Overlay";
      break;
    case poiOverlay:
      return @"POI Overlay";
      break;
    case buildingOverlay:
      return @"Building Overlay";
      break;
    case poi:
      return @"POI";
      break;
    case buildling:
      return @"Building";
      break;

    default:
      return nil;
      break;
  }
}
- (UIImage*)iconOfItemAtIndex:(NSUInteger)index {
  Item item = index;
  switch (item) {
    case setting:
      return [UIImage imageNamed:@"ic_setting"];
      break;
    case marker:
      return [UIImage imageNamed:@"ic_marker"];
      break;
    case polyline:
      return [UIImage imageNamed:@"ic_polyline"];
      break;
    case polygon:
      return [UIImage imageNamed:@"ic_polygon"];
      break;
    case circle:
      return [UIImage imageNamed:@"ic_circle"];
      break;
    case myLocation:
      return [UIImage imageNamed:@"ic_my_location"];
      break;
    case delegate:
      return [UIImage imageNamed:@"ic_delegate"];
      break;
    case annimation:
      return [UIImage imageNamed:@"ic_animation"];
      break;
    case tileOverlay:
      return [UIImage imageNamed:@"ic_tile"];
      break;
    case groundOverlay:
      return [UIImage imageNamed:@"ic_tile"];
      break;
    case poiOverlay:
      return [UIImage imageNamed:@"ic_tile"];
      break;
    case buildingOverlay:
      return [UIImage imageNamed:@"ic_tile"];
      break;
    case poi:
      return [UIImage imageNamed:@"ic_marker"];
      break;
    case buildling:
      return [UIImage imageNamed:@"ic_tile"];
      break;
      
    default:
      return nil;
      break;
  }
}

- (UIViewController*)viewControllerOfItemAtIndex:(NSUInteger)index {
  UIStoryboard *sb = nil;
  Item item = index;
  switch (item) {
    case setting:
    case annimation:
    case myLocation:
      sb = [UIStoryboard storyboardWithName: @"SettingViewController" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"SettingViewController"];
      break;
    case marker:
      sb = [UIStoryboard storyboardWithName: @"MarkerViewController" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"MarkerViewController"];
      break;
    case polyline:
      sb = [UIStoryboard storyboardWithName: @"PolylineViewController" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"PolylineViewController"];
      break;
    case polygon:
      sb = [UIStoryboard storyboardWithName: @"PolygonViewController" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"PolygonViewController"];
      break;
    case circle:
      sb = [UIStoryboard storyboardWithName: @"CircleViewController" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"CircleViewController"];
      break;
    case delegate:
      sb = [UIStoryboard storyboardWithName:@"Delegate" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"DelegateViewController"];
      break;
    case tileOverlay:
      sb = [UIStoryboard storyboardWithName:@"TileOverlay" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"TileOverlayViewController"];
      break;
    case groundOverlay:
      sb = [UIStoryboard storyboardWithName:@"GroundOverlay" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"GroundOverlayViewController"];
      break;
    case poiOverlay:
      sb = [UIStoryboard storyboardWithName:@"POIOverlay" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"POIOverlayViewController"];
      break;
    case buildingOverlay:
      sb = [UIStoryboard storyboardWithName:@"BuildingOverlay" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"BuildingOverlayViewController"];
      break;
    case poi:
      sb = [UIStoryboard storyboardWithName: @"POIViewController" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"POIViewController"];
      break;
    case buildling:
      sb = [UIStoryboard storyboardWithName: @"BuildingViewController" bundle:nil];
      return [sb instantiateViewControllerWithIdentifier:@"BuildingViewController"];
      break;
    
    default:
      return nil;
      break;
  }
}

@end
