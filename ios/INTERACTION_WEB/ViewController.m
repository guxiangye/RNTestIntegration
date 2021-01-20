//
//  ViewController.m
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2020/10/14.
//

#import "ViewController.h"
#import "MiniProgressViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = NO;
    
    CGRect frame = self.webView.frame;
    frame.origin.y = 88;
    frame.size.height = [UIScreen mainScreen].bounds.size.height - 88 - 34;
    self.webView.frame = frame;
    
    //https://mobile.ant.design/kitchen-sink/?lang=zh-CN
    [self ns_wk_loadURLString:@"https://mobile.ant.design/kitchen-sink/?lang=zh-CN"];
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"RN" style:UIBarButtonItemStylePlain target:self action:@selector(handleRightNav:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

- (void)handleRightNav:(UIButton *)sender {
    MiniProgressViewController *vc = [[MiniProgressViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:YES completion:nil];
}

@end
