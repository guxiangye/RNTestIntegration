//
//  TestDemoView.h
//  INTERACTION_WEB
//
//  Created by 相晔谷 on 2021/1/18.
//

#import <UIKit/UIKit.h>
#import <React/UIView+React.h>
NS_ASSUME_NONNULL_BEGIN

@protocol TestDemoDelegate <NSObject>

- (void)clickAction:(NSString *)title;

@end

@interface TestDemoView : UIView

@property (nonatomic, weak) id<TestDemoDelegate> delegate;
@property (nonatomic, copy) RCTBubblingEventBlock onClickAction;
- (void)changeTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
