//
//  MFTileArea.h
//  Map4D
//
//  Created by tantv on 10/4/18.
//

#ifndef MFTileArea_h
#define MFTileArea_h
#import "MFOverlay.h"
@class MFCoordinateBounds;

@interface MFTileArea: MFOverlay
  @property(nonatomic, strong) MFCoordinateBounds* bounds;
  @property(nonatomic, strong) NSString* mapUrl;
  @property(nonatomic, strong) NSNumber* minZoom;
  @property(nonatomic, strong) NSNumber* maxZoom;

  - (instancetype) init: (MFCoordinateBounds*) bounds mapUrl: (NSString*) url minZoom: (NSNumber*) minZoom maxZoom: (NSNumber*) maxZoom;

  - (instancetype) init: (MFCoordinateBounds*) bounds mapUrl: (NSString*) url;

  - (void) update: (MFCoordinateBounds*) bounds mapUrl: (NSString*) url minZoom: (NSNumber*) minZoom maxZoom: (NSNumber*) maxZoom;

  - (void) update: (MFCoordinateBounds*) bounds mapUrl: (NSString*) url;

  - (void) update: (MFCoordinateBounds*) bounds;

@end

#endif /* MFTileArea_h */
