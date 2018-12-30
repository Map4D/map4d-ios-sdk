//
//  MFMarker.h
//  mapes
//
//  Created by tantv on 9/17/18.
//

#ifndef MFMarker_h
#define MFMarker_h
#import "MFOverlay.h"


@interface MFMarker: MFOverlay
  @property(nonatomic) CLLocationCoordinate2D position;
  @property(nonatomic) CGPoint groundAnchor;
  @property(nonatomic, strong, setter=setIconView:) UIView *iconView;
  @property(nonatomic) double elevation;
  @property(nonatomic, strong) UIImage *icon;
  @property(nonatomic, assign, setter=setVisible:) bool isVisible;
@end

#endif /* MFMarker_h */
