//
//  SCTabBtnScrollView.h
//  SCSrollViewDemo
//
//  Created by Sunc on 15/8/17.
//  Copyright (c) 2015年 Sunc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCTabBtnScrollViewDelegate;

@interface SCTabBtnScrollView : UIScrollView

@property(assign, nonatomic)NSInteger numOfBtnsShownInScreen;

@property(assign, nonatomic)BOOL showIndicator;

@property(assign, nonatomic)BOOL showAnimation;

@property(assign, nonatomic)CGFloat duration;

@property(assign, nonatomic)CGFloat btnHeight;

@property(assign, nonatomic)CGFloat test;

@property(retain, nonatomic)UIColor *titleSelectedColor;

@property(retain, nonatomic)UIColor *titleUnSelectedColor;

@property (weak, nonatomic) id<SCTabBtnScrollViewDelegate> ScrollDelegate;

- (void)initTabBtnWithBtnTitleArr:(NSMutableArray *)btnTitleArr;

@end


@protocol SCTabBtnScrollViewDelegate <NSObject>

@optional

- (void)didSelectBtnAtIndex:(UIButton *)btn;

@end
