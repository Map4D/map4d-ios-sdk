//
//  MFDataSourceFeature.h
//  Map4dMap SDK for iOS
//
//  Copyright (c) 2023 IOTLink LLC.
//

#ifndef MFDataSourceFeature_h
#define MFDataSourceFeature_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MFDataSourceFeature : NSObject

@property(nonatomic, strong) NSString *source;
@property(nonatomic, strong) NSString *sourceLayer;
@property(nonatomic, strong) NSString *layerType;
@property(nonatomic, strong) NSDictionary<NSString *, NSObject *> *properties;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithSource:(NSString *)source
                   sourceLayer:(NSString *)sourceLayer
                     layerType:(NSString *)layerType
                    properties:(NSDictionary<NSString *, NSObject *> *)properties;

@end

NS_ASSUME_NONNULL_END

#endif /* MFDataSourceFeature_h */
