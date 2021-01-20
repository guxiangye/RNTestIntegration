//
//  TestDemoViewManager.m
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2021/1/18.
//

#import "TestDemoViewManager.h"
#import "TestDemoView.h"
#import <React/RCTUIManager.h>

@interface TestDemoViewManager ()
<TestDemoDelegate>
@property (nonatomic, strong) TestDemoView *testDemoView;
@end

@implementation TestDemoViewManager

// 这句代码是必须的 用来导出 module, 这样才能在 RN 中访问 nativeModule这个 module
RCT_EXPORT_MODULE()
RCT_EXPORT_VIEW_PROPERTY(onClickAction, RCTBubblingEventBlock)

RCT_EXPORT_METHOD(changeTitle:(nonnull NSNumber *)viewTag title:(nonnull NSString *)title) {
    NSLog(@"========>%@", title);
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
        UIView *view = viewRegistry[viewTag];
        if ([view isKindOfClass:[TestDemoView class]]) {
          [(TestDemoView *)view changeTitle:title];
        } else {
            RCTLogError(@"view type must be TestDemoView");
        }
    }];
}

///重写这个方法，返回提供给 RN 使用的视图
- (UIView *)view {
    TestDemoView *td = [TestDemoView new];
    td.delegate = self;
    self.testDemoView = td;
    return td;
}

#pragma mark - <##>TestDemoDelegate
- (void)clickAction:(nonnull NSString *)title { // 实现 view 的代理，将数据回传 RN
    if (self.testDemoView.onClickAction && title) {
        self.testDemoView.onClickAction(@{@"title": title});
    }
}

@end
