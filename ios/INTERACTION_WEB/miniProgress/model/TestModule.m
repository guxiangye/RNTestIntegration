//
//  TestModule.m
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2021/1/18.
//

#import "TestModule.h"

@interface TestModule ()
        < 
    RCTBridgeModule
>

@end

#pragma mark - 演示 RN 调用 Native

@implementation TestModule

// 这句代码是必须的 用来导出 module, 这样才能在 RN 中访问 nativeModule这个 module
RCT_EXPORT_MODULE()

// 接收字符串
RCT_EXPORT_METHOD(addHelloWord:(NSString *)name location:(NSString *)location)
{
  NSLog(@"%@,%@", name, location);
    if (self.delegate) {
        [self.delegate addHelloWord:name location:location];
    }
}

// // 只接受一个参数——传递给 JavaScript 回调函数的参数数组。
RCT_EXPORT_METHOD(checkIsRoot:(RCTResponseSenderBlock)callback) {
    NSArray *array = @[@"string", @"number"];
    callback(array);
    if (self.delegate) {
        [self.delegate checkIsRoot:callback];
    }
    
}

@end
