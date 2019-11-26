//
//  MFServices.h
//  Map4D
//
//  Created by Sua Le on 12/28/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MFServices : NSObject
  + (BOOL)provideAccessKey:(NSString *) accessKey __deprecated_msg("This method will be removed in future versions.  Please provide access key in Info.plist with string key: 'Map4dMapAccessKey'");
@end

NS_ASSUME_NONNULL_END
