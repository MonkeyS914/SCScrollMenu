//
//  SCTabBtnScrollView.m
//  SCSrollViewDemo
//
//  Created by Sunc on 15/8/17.
//  Copyright (c) 2015年 Sunc. All rights reserved.
//

#import "SCTabBtnScrollView.h"

@interface SCTabBtnScrollView ()
{
    CGFloat ScreenWidth;
    
    CGFloat ScreenHeight;
    
    NSMutableArray *btnArr;
    
    CGFloat btnWidth;
    
    UIView *indicator;
    
    NSInteger centralBtn;
    
    CGSize contentOffSet;
    
}

@end


@implementation SCTabBtnScrollView

- (id)init
{
    self = [super init];
    if (self) {
        [self parameterInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        [self parameterInit];
    }
    return self;
}

- (void)parameterInit
{
    
    
}

- (void)initTabBtnWithBtnTitleArr:(NSMutableArray *)btnTitleArr{
    
    ScreenWidth = [UIScreen mainScreen].bounds.size.width;
    
    ScreenHeight = [UIScreen mainScreen].bounds.size.height;
    
    btnArr = [[NSMutableArray alloc]init];
    
    if (!_btnHeight) {
        self.btnHeight = 40;
    }
    
    if (!self.numOfBtnsShownInScreen) {
        self.numOfBtnsShownInScreen = 5;
    }
    
    if (!_titleSelectedColor) {
        _titleSelectedColor = [UIColor blackColor];
    }
    
    if (!_titleUnSelectedColor) {
        _titleUnSelectedColor = [UIColor lightGrayColor];
    }
    
    btnWidth = ScreenWidth/self.numOfBtnsShownInScreen;
    
    centralBtn = self.numOfBtnsShownInScreen/2+1;
    
    for (int i = 0; i<btnTitleArr.count; i++) {
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i*btnWidth, 0, btnWidth, self.btnHeight)];
        
        btn.tag = i;
        [btn addTarget:self action:@selector(btnclicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:nil] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
        [btn setTitle:[btnTitleArr objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:_titleSelectedColor forState:UIControlStateSelected];
        [btn setTitleColor:_titleUnSelectedColor forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        if(i == 0){
            btn.selected = YES;
            btn.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
        }
        
        [btnArr addObject:btn];
        
        [self addSubview:btn];
    }
    
    self.contentSize = CGSizeMake(btnWidth*btnTitleArr.count, self.frame.size.height);
    self.showsHorizontalScrollIndicator = NO;
    
    indicator = [[UIView alloc]initWithFrame:CGRectMake(0, self.btnHeight-2, btnWidth, 2)];
    indicator.backgroundColor = [UIColor colorWithRed:69/255.0 green:166/255.0 blue:233/255.0 alpha:1.0];
    [self addSubview:indicator];
}

- (void)btnclicked:(UIButton *)sender{
    
    for (int i = 0; i<btnArr.count; i++) {
        if (i == sender.tag) {
            sender.selected = YES;
            sender.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
        }
        else{
            UIButton *temBtn = [[UIButton alloc]init];
            temBtn = [btnArr objectAtIndex:i];
            temBtn.selected = NO;
            temBtn.transform = CGAffineTransformIdentity;
        }
    }
    
    [UIView animateWithDuration:self.duration animations:^{
        
        if (sender.tag<centralBtn) {
            self.contentOffset = CGPointMake(0, 0);
        }
        else if (sender.tag>btnArr.count-centralBtn-1){
            if (self.numOfBtnsShownInScreen%2 == 0) {
                self.contentOffset = CGPointMake((btnArr.count-self.numOfBtnsShownInScreen)*btnWidth, 0);
            }
            else{
                self.contentOffset = CGPointMake((btnArr.count-self.numOfBtnsShownInScreen)*btnWidth, 0);
            }
            
        }
        else{
            self.contentOffset = CGPointMake((sender.tag-(centralBtn-1))*btnWidth+btnWidth/2, 0);
        }
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:self.duration animations:^{
            indicator.frame = CGRectMake(btnWidth*sender.tag, self.btnHeight-2, btnWidth, 2);
        }];
    }];
    
    if ([self.ScrollDelegate conformsToProtocol:@protocol(SCTabBtnScrollViewDelegate)] && [self.ScrollDelegate respondsToSelector:@selector(didSelectBtnAtIndex:)]) {
        [self.ScrollDelegate didSelectBtnAtIndex:sender];
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
