//
//  TestDemoView.m
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2021/1/18.
//

#import "TestDemoView.h"

#define __kRGBA(r,g,b,a)     [UIColor colorWithRed:(float)r/255. green:(float)g/255. blue:(float)b/255. alpha:a]


#define __ColorWithHexString(color, alpha) \
({ \
NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString]; \
UIColor * hexColor = nil; \
if ([cString length] < 6) { hexColor = [UIColor clearColor]; } \
if ([cString hasPrefix:@"0X"]) { cString = [cString substringFromIndex:2]; } \
if ([cString hasPrefix:@"#"]) { cString = [cString substringFromIndex:1]; } \
if ([cString length] != 6) { hexColor =  [UIColor clearColor]; } \
NSRange range; \
range.location = 0; \
range.length = 2; \
NSString *rString = [cString substringWithRange:range]; \
range.location = 2; \
NSString *gString = [cString substringWithRange:range]; \
range.location = 4; \
NSString *bString = [cString substringWithRange:range]; \
unsigned int r, g, b; \
[[NSScanner scannerWithString:rString] scanHexInt:&r]; \
[[NSScanner scannerWithString:gString] scanHexInt:&g]; \
[[NSScanner scannerWithString:bString] scanHexInt:&b]; \
hexColor = __kRGBA(r,g,b,alpha); \
(hexColor); \
}) 

@implementation TestDemoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        // demo label
        UILabel *label = [UILabel new];
        label.tag =99;
        label.text = @"RN调用原生封装的组件";
        label.frame = CGRectMake(0, 0, 200, 100);
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        // demo 按钮
        UIButton *btn = [UIButton new];
        btn.tag = 100;
        [btn setTitle:@"点击：回传 RN" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(sendToRN:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 100, 200, 100);
        [self addSubview:btn];
    }
    return self;
}

///回传数据给 RN
- (void)sendToRN:(UIButton *)sender {
    UILabel *label = [self viewWithTag:99];
    [self.delegate clickAction:label.text];
}

- (void)changeTitle:(NSString *)title {
    UILabel *label = [self viewWithTag:99];
    label.text = title;
}

@end
