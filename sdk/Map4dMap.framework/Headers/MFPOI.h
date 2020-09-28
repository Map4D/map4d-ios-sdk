//
//  MFPOI.h
//  Map4dMap
//
//  Created by Huy Dang on 6/9/20.
//

#ifndef MFPOI_h
#define MFPOI_h

#import "MFOverlay.h"

@interface MFPOI : MFOverlay

@property(nonatomic) CLLocationCoordinate2D position;

@property(nonatomic, strong, nullable) NSString* title;

@property(nonatomic, strong, nonnull) UIColor* titleColor;

@property(nonatomic, strong, nullable) NSString* subtitle;

@property(nonatomic, strong, nullable) NSString* type;

@property(nonatomic, strong, nullable, setter=setIconView:) UIView * iconView;

@property(nonatomic, strong, nullable) UIImage* icon;

/** A Boolean value that determines whether user events are ignored and removed from the event queue. */
@property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;

- (instancetype _Nonnull) init;

@end


#endif /* MFPOI_h */
