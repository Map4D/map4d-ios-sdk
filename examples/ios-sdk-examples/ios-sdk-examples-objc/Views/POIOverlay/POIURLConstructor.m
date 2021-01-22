//
//  POIURLConstructor.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 27/01/2021.
//

#import "POIURLConstructor.h"

@implementation POIURLConstructor


- (NSURL * _Nullable)getPOIUrlWithX:(NSUInteger)x y:(NSUInteger)y zoom:(NSUInteger)zoom {
  NSString *poiApiUrl = [NSString stringWithFormat:@"https://poi-random.herokuapp.com/poi/%lu/%lu/%lu", zoom, x, y];
  return [NSURL URLWithString:poiApiUrl];
}

- (NSArray<MFPOIData *> * _Nullable)parserPOIData:(NSString * _Nonnull)data {
  @try {
    NSData* jsonData = [data dataUsingEncoding:NSUTF8StringEncoding];
    NSError *jsonError;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&jsonError];
    
    if (jsonObject != nil) {
      NSArray *places = [jsonObject valueForKey:@"pois"];

      if (places != nil && places.count > 0) {
        NSMutableArray *poiDatas = [[NSMutableArray alloc] init];
        
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
          
          MFPOIData *poiData = [[MFPOIData alloc] init];
          poiData.id = placeId;
          poiData.title = title;
          poiData.position = CLLocationCoordinate2DMake(latObject.doubleValue, lngObject.doubleValue);
          poiData.titleColor = UIColor.blueColor;
          poiData.type = @"park";
          [poiDatas addObject:poiData];
        }
        
        return poiDatas;
      }
    }

    return nil;
  }
  @catch (NSException *exception) {
    return nil;
  }
}

@end
