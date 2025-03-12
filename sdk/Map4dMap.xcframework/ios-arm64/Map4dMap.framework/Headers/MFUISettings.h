//
//  MFUISettings.h
//  Map4dMap
//
//  Created by Huy Dang on 8/21/20.
//

#ifndef MFUISettings_h
#define MFUISettings_h

#import <Foundation/Foundation.h>

@interface MFUISettings : NSObject

@property(nonatomic, assign) BOOL myLocationButton;

@property(nonatomic, assign) BOOL scrollGestures;

@property(nonatomic, assign) BOOL zoomGestures;

@property(nonatomic, assign) BOOL tiltGestures;

@property(nonatomic, assign) BOOL rotateGestures;

- (void)setAllGesturesEnabled:(BOOL)enabled;

@end

#endif /* MFUISettings_h */
