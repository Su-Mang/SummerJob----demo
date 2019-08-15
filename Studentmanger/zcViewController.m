//
//  zcViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/7.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "zcViewController.h"

@interface zcViewController ()

@end

@implementation zcViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(120, 70, 95, 100)];
    [self.view addSubview:imageview];
//    _l1.frame = CGRectMake(20, 0, 100, 40);
//    _l2.frame = CGRectMake(150, 0, 100, 40);
//    _l3.frame = CGRectMake(20, 50, 100, 40);
//    _l4.frame = CGRectMake(150, 50, 100, 40);
//    _l5.frame = CGRectMake(20, 100, 100, 40);
//    _l6.frame = CGRectMake(150, 100, 100, 40);
//    _l7.frame = CGRectMake(20, 150, 100, 40);
//    _l8.frame = CGRectMake(150, 150, 100, 40);
//    _uiimgeView.frame = CGRectMake(270,70, 50, 50);
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 200, 100, 40)];
    if(_sex==1)
    {
        imageview.image = [UIImage imageNamed: @"nan.png"];
    }
    else
    {
        imageview.image = [UIImage imageNamed: @"nv.png"];
    }
    nameLabel.text =@"姓名";
    [self.view addSubview:nameLabel];
     UILabel *nameoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 200, 100, 40)];
    nameoneLabel.text =_name;
    [self.view addSubview:nameoneLabel];
    
     UILabel *lablenumber = [[UILabel alloc]initWithFrame:CGRectMake(20, 250, 100, 40)];
    lablenumber.text =@"学号";
    [self.view addSubview:lablenumber];
     UILabel *lablenumber1 = [[UILabel alloc]initWithFrame:CGRectMake(150, 250, 100, 40)];
    lablenumber1.text =_number;
    [self.view addSubview:lablenumber1];
     UILabel *chengjiLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 300, 100, 40)];
    chengjiLabel.text =@"成绩";
    [self.view addSubview:chengjiLabel];
     UILabel *chengjioneLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 300, 100, 40)];
    chengjioneLabel.text =_chengji;
    [self.view addSubview:chengjioneLabel];
     UILabel *banjiLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,350, 100, 40)];
    banjiLabel.text = @"班级";
    [self.view addSubview:banjiLabel];
     UILabel *banjioneLabel = [[UILabel alloc]initWithFrame:CGRectMake(150, 350, 100, 40)];
    banjioneLabel.text = _banji;
    [self.view addSubview:banjioneLabel];
    
}



@end
