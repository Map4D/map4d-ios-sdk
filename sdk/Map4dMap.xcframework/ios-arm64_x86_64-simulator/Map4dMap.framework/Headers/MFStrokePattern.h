//
//  MFStrokePattern.h
//  Map4dMap
//
//  Created by Huy Dang on 23/05/2022.
//

#ifndef MFStrokePattern_h
#define MFStrokePattern_h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MFStrokePatternType) {
  MFStrokePatternTypeSolid,
  MFStrokePatternTypeDash,
  MFStrokePatternTypeDot,
  MFStrokePatternTypeIcon
};

NS_ASSUME_NONNULL_BEGIN

@interface MFStrokePattern : NSObject

@property(readonly) MFStrokePatternType type;

@property(class, readonly, strong, nonnull) MFStrokePattern *solid;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)dashWithLength:(CGFloat)length gap:(CGFloat)gap NS_SWIFT_NAME(dash(length:gap:));

+ (instancetype)dotWithRepeat:(NSUInteger)repeat NS_SWIFT_NAME(dot(repeat:));

+ (instancetype)iconWithImage:(UIImage *)image NS_SWIFT_NAME(icon(image:));

@end

NS_ASSUME_NONNULL_END

#endif /* MFStrokePattern_h */
