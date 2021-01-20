//
//  TestDemoEmitter.m
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2021/1/20.
//

#import "TestDemoEmitter.h"

#pragma mark - 演示 Native 调用 RN

@interface TestDemoEmitter ()
        <
    RCTBridgeModule
>

@end

@implementation TestDemoEmitter

RCT_EXPORT_MODULE();

static TestDemoEmitter *sharedInstance = nil;

+ (TestDemoEmitter *)sharedInstace {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TestDemoEmitter alloc]init];
    });
    return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
    });
    return sharedInstance;
}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"MYEmitter"];
}

- (void)notification_MYEmitter:(NSNotification *)notification {

    [self sendEventWithName:@"MYEmitter" body:notification.userInfo];
}

- (void)sendParamsToRN:(NSDictionary *)params {
    [self sendEventWithName:@"MYEmitter" body:params];
}

@end
