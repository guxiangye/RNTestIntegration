//
//  TestModule.h
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2021/1/18.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN
@class TestModule;
@protocol TestModuleDelegate <NSObject>

- (void)addHelloWord:(NSString *)name location:(NSString *)location;
- (void)checkIsRoot:(RCTResponseSenderBlock)callback;

@end
@interface TestModule : NSObject

@property (nonatomic) RCTPromiseResolveBlock normalResolve;
@property (nonatomic) RCTPromiseRejectBlock normalReject;
@property (nonatomic, weak) id <TestModuleDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
