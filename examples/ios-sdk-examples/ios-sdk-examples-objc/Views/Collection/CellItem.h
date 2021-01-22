//
//  CellItem.h
//  ios-sdk-examples-objc
//
//  Created by Huy Dang on 02/02/2021.
//

#ifndef CellItem_h
#define CellItem_h

#import <UIKit/UIKit.h>

@interface CellItem : NSObject

- (NSUInteger)count;

- (NSString*)nameOfItemAtIndex:(NSUInteger)index;

- (UIImage*)iconOfItemAtIndex:(NSUInteger)index;

- (UIViewController*)viewControllerOfItemAtIndex:(NSUInteger)index;

@end

#endif /* CellItem_h */
