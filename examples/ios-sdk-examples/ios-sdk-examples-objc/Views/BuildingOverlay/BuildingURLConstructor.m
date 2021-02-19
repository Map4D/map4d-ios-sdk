//
//  BuildingURLConstructor.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 28/01/2021.
//

#import "BuildingURLConstructor.h"

@implementation BuildingURLConstructor

- (NSURL * _Nullable)getBuildingUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom {
  NSString *url = [NSString stringWithFormat:@"https://poi-random.herokuapp.com/poi/%lu/%lu/%lu", zoom, x, y];
  return [NSURL URLWithString:url];
}

- (NSArray<MFBuildingData *> * _Nullable)parserBuildingData:(NSString * _Nonnull)data {
  @try {
    NSData* jsonData = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSError *jsonError;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&jsonError];
    
    if (jsonObject != nil) {
      NSArray *places = [jsonObject valueForKey:@"pois"];

      if (places != nil && places.count > 0) {
        NSMutableArray *buildingDatas = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < places.count; i++) {
          NSDictionary *place = [places objectAtIndex:i];
          if (place == nil) {
            continue;
          }
          
          NSString *placeId = [place valueForKey:@"id"];
          NSString *title = [place valueForKey:@"title"];
          NSDictionary *positionObject = [place valueForKey:@"position"];
          if (placeId == nil || title == nil || positionObject == nil) {
            continue;
          }
          
          NSNumber *latObject = [positionObject valueForKey:@"lat"];
          NSNumber *lngObject = [positionObject valueForKey:@"lng"];
          if (latObject == nil || lngObject == nil) {
            continue;
          }
          
          MFBuildingData *buildingData = [[MFBuildingData alloc] init];
          buildingData.id = placeId;
          buildingData.name = title;
          buildingData.position = CLLocationCoordinate2DMake(latObject.doubleValue, lngObject.doubleValue);
          buildingData.model = @"https://sw-hcm-1.vinadata.vn/v1/AUTH_d0ecabcbdcd74f6aa6ac9a5da528eb78/sdk/models/5b21d9a5cd18d02d045a5e99";
          buildingData.texture = @"https://sw-hcm-1.vinadata.vn/v1/AUTH_d0ecabcbdcd74f6aa6ac9a5da528eb78/sdk/textures/0cb35e1610c34e55946a7839356d8f66.jpg";
          [buildingDatas addObject:buildingData];
          break;
        }
        
        return buildingDatas;
      }
    }

    return nil;
  }
  @catch (NSException *exception) {
    return nil;
  }
}

@end
