//
//  TestDemoEmitter.h
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2021/1/20.
//

#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestDemoEmitter : RCTEventEmitter

+ (TestDemoEmitter *)sharedInstace;
- (void)sendParamsToRN:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
