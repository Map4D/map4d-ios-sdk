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
  #error Register for API Key and insert here. Then delete this line.
  [MFServices provideAccessKey:@"YOUR_API_KEY"];
  return YES;
}


@end
