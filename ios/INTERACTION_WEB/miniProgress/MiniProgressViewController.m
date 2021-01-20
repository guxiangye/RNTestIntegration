//
//  MiniProgressViewController.m
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2021/1/17.
//

#import "MiniProgressViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridgeModule.h>
#import <CodePush.h>
#import <React/RCTRootView.h>
#import <React/RCTBundleURLProvider.h>

#import "TestDemoEmitter.h"
#import "TestModule.h"

@interface MiniProgressViewController ()
<RCTBridgeModule, RCTBridgeDelegate>
{
    RCTBundleURLProvider *jsCodeLocation;
}
@end

@implementation MiniProgressViewController

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
    return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
    return [CodePush bundleURL];
#endif
}

RCT_EXPORT_MODULE()

// 接收字符串
RCT_EXPORT_METHOD(addHelloWord:(NSString *)name location:(NSString *)location)
{
  NSLog(@"%@,%@", name, location);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"mini";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image1 = [UIImage imageNamed:@"xiaochengxu-guanbi"];
    [button1 setImage:image1 forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(handleRightNav:) forControlEvents:UIControlEventTouchUpInside];
    [button1.widthAnchor constraintEqualToConstant:20].active = YES;
    [button1.heightAnchor constraintEqualToConstant:20].active = YES;
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image2 = [UIImage imageNamed:@"xiaochengxu-gengduo"];
    [button2 setImage:image2 forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(handleSendToRN:) forControlEvents:UIControlEventTouchUpInside];
    [button2.widthAnchor constraintEqualToConstant:30].active = YES;
    [button2.heightAnchor constraintEqualToConstant:30].active = YES;
    
    UIBarButtonItem *rightBarItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    UIBarButtonItem *rightBarItem2 = [[UIBarButtonItem alloc] initWithCustomView:button2];
    self.navigationItem.rightBarButtonItems = @[rightBarItem1, rightBarItem2];
    
    [self setupRNView];
}

- (void)setupRNView {
    
    
    // 热更新
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:nil];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                     moduleName:@"RNTestDemo"
                                              initialProperties:@{
                                                  @"params" : @[
                                                    @{
                                                      @"name" : @"Neil",
                                                      @"value": @"28"
                                                     },
                                                    @{
                                                      @"name" : @"Colin",
                                                      @"value": @"55"
                                                    }
                                                  ]
                                                }];
    
//    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
//    RCTRootView *rootView =
//          [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
//                                      moduleName: @"RNTestDemo"
//                               initialProperties:
//                                 @{
//                                   @"scores" : @[
//                                     @{
//                                       @"name" : @"Alex",
//                                       @"value": @"42"
//                                      },
//                                     @{
//                                       @"name" : @"Joel",
//                                       @"value": @"10"
//                                     }
//                                   ]
//                                 }
//                                   launchOptions: nil];
    rootView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:rootView];
    
    /** iOS 调用RN跳转 */
    [[TestDemoEmitter alloc] init].bridge = rootView.bridge;
}

- (void)handleRightNav:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleSendToRN:(UIButton *)sender {
    [[[TestDemoEmitter alloc] init] sendParamsToRN:@{@"name": @"MYEmitter", @"content": @"Native to RN"}];
}

- (UIModalPresentationStyle)modalPresentationStyle{
    return UIModalPresentationFullScreen;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent;
    }
    return UIStatusBarStyleDefault;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
