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

@property(nonatomic) double elevation;

@property(nonatomic) double rotation;

@property(nonatomic) bool draggable;

@property(nonatomic, getter=isFlat) bool flat;

/**
 * The info window anchor specifies the point in the icon image at which to anchor the info window,
 * which will be displayed directly above this point. This point is specified within the same space
 * as groundAnchor.
 */
@property(nonatomic) CGPoint infoWindowAnchor;

/**
  Title, a short description of the overlay. Some overlays, such as markers, will display the title on the map. The title is also the default accessibility text.
 */
@property(nonatomic, strong, nullable) NSString *title;

/** Snippet text, shown beneath the title in the info window when selected. */
@property(nonatomic, strong, nullable) NSString *snippet;

@property(nonatomic, strong, nullable, setter=setIconView:) UIView * iconView;

@property(nonatomic, strong, nullable) UIImage* icon;

/** A Boolean value that determines whether user events are ignored and removed from the event queue. */
@property(nonatomic, getter=isUserInteractionEnabled) bool userInteractionEnabled;

- (instancetype _Nonnull ) init;

@end

#endif /* MFMarker_h */
