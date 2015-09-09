//
//  ViewController.m
//  SCSrollViewDemo
//
//  Created by Sunc on 15/8/17.
//  Copyright (c) 2015年 Sunc. All rights reserved.
//

#import "ViewController.h"
#import "SCTabBtnScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *arr = [[NSMutableArray alloc]initWithObjects:@"推荐",@"羽毛球",@"乒乓球",@"网球",@"台球",@"游泳",@"健身",@"跑步",@"足球",@"篮球",@"舞蹈",@"瑜伽",@"武术",@"体操",@"铁人三项",@"其他", nil];
    
    SCTabBtnScrollView *sctab = [[SCTabBtnScrollView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
    
    sctab.numOfBtnsShownInScreen = 6;
    sctab.duration = 0.2f;
    sctab.btnHeight = 40.0f;
    sctab.test = 1.5f;
    sctab.titleSelectedColor = [UIColor redColor];
    sctab.titleUnSelectedColor = [UIColor whiteColor];
    sctab.ScrollDelegate = self;
    sctab.backgroundColor = [UIColor greenColor];
    
    [sctab initTabBtnWithBtnTitleArr:arr];
    
    [self.view addSubview:sctab];
}

- (void)didSelectBtnAtIndex:(UIButton *) sender{
    NSLog(@"%ld",(long)sender.tag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
