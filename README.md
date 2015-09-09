# SCTabBtnScrollView
侧滑导航栏
# SCTabBtnScrollView.h 仿网易导航栏

![image](https://raw.githubusercontent.com/MonkeyS914/SCScrollMenu/master/screenshot/1234.gif?2)

简单集成 

使用方法，把SCTabBtnScrollView.h和.m文件夹拖到自己工程下面 

import SCTabBtnScrollView.h 

在你的代码中添加下面一段

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



