//
//  oneViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/6.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "oneViewController.h"
#import "ckanViewController.h"
#import "searchViewController.h"
#import "ViewControllerjiaren.h"
#import "studentmudle.h"
#import "xiugaiViewController.h"
#import "shanchuViewController.h"
@interface oneViewController ()<UIScrollViewDelegate,passstudentDelegate,passarry,passdelegatea>
@property NSTimer *time;
@property UIScrollView *sc;
@property  (nonatomic) NSMutableArray *dataarry1;
@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataarry1];
    UIImageView*imgg1  = [[UIImageView  alloc]initWithFrame:CGRectMake(0, 65, self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
    imgg1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:imgg1];
    
    _sc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
    _sc.contentSize =CGSizeMake(self.view.frame.size.width*6, self.view.frame.size.height-65-50);
    _sc.pagingEnabled = YES;
    [self.view addSubview:_sc];
    _sc.delegate =self;
    for (int i =0; i<6; i++) {
          UIImageView *im = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 60, self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
        if(i==0)
        {
            im.image = [UIImage imageNamed:@"4.png"];
        }
        else if(i==5)
        {
            im.image = [UIImage imageNamed:@"1.png"];
        }
        else{
        NSString *str = [NSString stringWithFormat:@"%d.png",i];
            [im setImage:[UIImage imageNamed:str]];
        }
       
         [_sc addSubview:im];
    }
     [self creat];
       self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.5];
    UIImage *m1=[UIImage imageNamed:@"/Users/sumang/Desktop/Objective-c/demo/XCode project/Pro2/Pro2/导航控制器基础/照片墙/Studentmanger/Studentmanger/test.png"];
    m1 = [m1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.navigationItem setTitle:@"主页"];
    UITabBarItem *tab = [[UITabBarItem alloc]initWithTitle:@"主页" image:m1 tag:1];
    UIButton *b1=[[UIButton alloc]initWithFrame:CGRectMake(0, 65, self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
      UIButton *b2=[[UIButton alloc]initWithFrame:CGRectMake(0, (65+(self.view.frame.size.height-65-50)/3), self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
      UIButton *b3=[[UIButton alloc]initWithFrame:CGRectMake(0, (65+(self.view.frame.size.height-65-50)/3*2), self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
    UIButton *b4=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 65, self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
    UIButton *b5=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, (65+(self.view.frame.size.height-65-50)/3), self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
    UIButton *b6=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, (65+(self.view.frame.size.height-65-50)/3*2), self.view.frame.size.width/2, (self.view.frame.size.height-65-50)/3)];
    UIImageView*imgg2  = [[UIImageView  alloc]initWithFrame:CGRectMake((self.view.frame.size.width/2+45), 125, 110, 100)];
        imgg2.image = [UIImage imageNamed:@"sousuo-2.png"];
    [self.view addSubview:imgg2];
    [b2 setBackgroundColor:[UIColor whiteColor]];
    //imgg2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imgg1];
    [self.view addSubview:b1];
     [self.view addSubview:b2];
     [self.view addSubview:b3];
     [self.view addSubview:b4];
     [self.view addSubview:b5];
     [self.view addSubview:b6];
        self.tabBarItem = tab;
//    [b1 setBackgroundColor:[UIColor colorWithRed:arc4random()%256/255 green:arc4random()%256/255 blue:arc4random()%256/255 alpha:0.5]];
//    [b2 setBackgroundColor:[UIColor colorWithRed:arc4random()%256/255 green:arc4random()%256/255 blue:arc4random()%256/255 alpha:0.5]];
//    [b3 setBackgroundColor:[UIColor colorWithRed:arc4random()%256/255 green:arc4random()%256/255 blue:arc4random()%256/255 alpha:0.5]];
//    [b4 setBackgroundColor:[UIColor colorWithRed:arc4random()%256/255 green:arc4random()%256/255 blue:arc4random()%256/255 alpha:0.5]];
//    [b5 setBackgroundColor:[UIColor colorWithRed:arc4random()%256/255 green:arc4random()%256/255 blue:arc4random()%256/255 alpha:0.5]];
//    [b6 setBackgroundColor:[UIColor colorWithRed:arc4random()%256/255 green:arc4random()%256/255 blue:arc4random()%256/255 alpha:0.8]];
    [b1 setTitle:@"" forState:UIControlStateNormal];
    [b1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    b1.titleLabel.font = [UIFont systemFontOfSize:30];
    [b1 addTarget:self  action:@selector(clik) forControlEvents:UIControlEventTouchUpInside];
    [b2 setImage:[UIImage imageNamed: @""] forState:UIControlStateNormal];
     [b2 addTarget: self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [b3 setImage:[UIImage imageNamed: @""] forState:UIControlStateNormal];
    [b3 addTarget: self action:@selector(xiugai) forControlEvents:UIControlEventTouchUpInside];
    [b4 setImage:[UIImage imageNamed: @"search"] forState:UIControlStateNormal];
    [b4 addTarget: self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [b5 setImage:[UIImage imageNamed: @""] forState:UIControlStateNormal];
    [b5 addTarget: self action:@selector(shanchu) forControlEvents:UIControlEventTouchUpInside];
    
}
-(NSMutableArray *)dataarry1
{
    if (_dataarry1 == nil) {
        _dataarry1 = [[NSMutableArray alloc]init];
        studentmudle * studentmessage = [[studentmudle alloc]init];
        studentmessage.studentname =@"李凯龙";
        studentmessage.studentsex =1;
        studentmessage.studentcj = @"100";
        studentmessage.studentnum = @"04182091";
        studentmessage.studentbanji =@"网络1803";
        studentmudle * studentmessage1 = [[studentmudle alloc]init];
        studentmessage1.studentname =@"李凯凤";
        studentmessage1.studentsex =0;
        studentmessage1.studentcj = @"70";
        studentmessage1.studentnum = @"04182092";
        studentmessage1.studentbanji =@"网络1803";
        studentmudle * studentmessage2 = [[studentmudle alloc]init];
        studentmessage2.studentname =@"李凯虎";
        studentmessage2.studentsex =1;
        studentmessage2.studentcj = @"60";
        studentmessage2.studentnum = @"04182093";
        studentmessage2.studentbanji =@"网络1803";
        studentmudle * studentmessage3 = [[studentmudle alloc]init];
        studentmessage3.studentname =@"李凯兔";
        studentmessage3.studentsex =0;
        studentmessage3.studentcj = @"100";
        studentmessage3.studentnum = @"04182094";
        studentmessage3.studentbanji =@"网络1803";
        studentmudle * studentmessage4 = [[studentmudle alloc]init];
        studentmessage4.studentname =@"李凯狼";
        studentmessage4.studentsex =1;
        studentmessage4.studentcj = @"80";
        studentmessage4.studentnum = @"04182095";
        studentmessage4.studentbanji =@"网络1803";
        [self.dataarry1  addObject: studentmessage];
        [self.dataarry1  addObject: studentmessage1];
        [self.dataarry1  addObject: studentmessage2];
        [self.dataarry1  addObject: studentmessage3];
        [self.dataarry1  addObject: studentmessage4];
    }
    return _dataarry1;
}
-(void)shanchu
{
    shanchuViewController *shanchu = [[shanchuViewController alloc]init];
    shanchu.dataarry1 = _dataarry1;
    shanchu.delegate = self;
    [self.navigationController pushViewController:shanchu animated:YES];
}
- (void)passremovea:(NSMutableArray*)aa
{
    _dataarry1 = aa;
}
-(void)xiugai
{
    xiugaiViewController *xiugai = [[xiugaiViewController alloc]init];
    xiugai.dataarry1 = _dataarry1;
    xiugai.delegate = self;
    [self.navigationController pushViewController:xiugai animated:YES];
    
}
- (void)pass:(NSMutableArray *)arry
{
    _dataarry1 = arry;
}
-(void)add
{
    ViewControllerjiaren *addviewcontroler = [[ViewControllerjiaren alloc]init];
    addviewcontroler.dataarry1  =_dataarry1;
    addviewcontroler.delegate = self;
    [self.navigationController pushViewController:addviewcontroler animated:YES];
    
}
- (void)pass:(NSString *)name andsex:(NSInteger)sex andnum:(NSString *)num and:(NSString *)chengji andbanji:(NSString *)banji
{
    studentmudle *student = [[studentmudle alloc]init];
    student.studentname = name;
    student.studentsex = sex;
    student.studentnum =num;
    student.studentcj = chengji;
    student.studentbanji = banji;
    [_dataarry1 addObject:student];
}
-(void)clik
{
    ckanViewController *ckan = [[ckanViewController alloc]init];
    ckan.dataarry1 = _dataarry1;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ckan animated:NO];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)search
{
    searchViewController *search =[[searchViewController alloc]init];
    search.dataarry1 = _dataarry1;
     self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:search animated:NO];
    self.hidesBottomBarWhenPushed = NO;
    
}

-(void)creat
{
    _time = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(ran) userInfo:nil repeats:YES];
}
-(void) ran
{
    [_sc setContentOffset:CGPointMake(self.view.frame.size.width+_sc.contentOffset.x, 60)];
   
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_sc.contentOffset.x ==0)
    {
        _sc.contentOffset =CGPointMake(4*self.view.frame.size.width, 60);
    }
    if(_sc.contentOffset.x==5*self.view.frame.size.width)
    {
        _sc.contentOffset= CGPointMake(self.view.frame.size.width, 60);
    }
}

@end
