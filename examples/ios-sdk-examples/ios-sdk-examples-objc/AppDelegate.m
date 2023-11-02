//
//  AppDelegate.m
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 01/02/2021.
//

#import "AppDelegate.h"
#import <Map4dMap/Map4dMap.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  NSBundle *bundle = [NSBundle bundleForClass:[MFMapView class]];
  NSString *version = bundle.infoDictionary[@"CFBundleShortVersionString"];
  // NSString *version = bundle.infoDictionary[@"CFBundleVersion"];
  NSLog(@"Map4D Map version: %@", version);

  return YES;
}


@end
