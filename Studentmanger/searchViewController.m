//
//  searchViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/7.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "searchViewController.h"
#import "studentmudle.h"
#import "zcViewController.h"
@interface searchViewController ()<UITextFieldDelegate>
@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"搜索";
    _textfieldzh = [[UITextField alloc]initWithFrame:CGRectMake(40, 300, 295, 50)];
    [self.view addSubview:_textfieldzh];
    _textfieldzh.backgroundColor = [UIColor whiteColor];
    _textfieldzh.delegate = self;
    _textfieldmm = [[UITextField alloc]initWithFrame:CGRectMake(40, 375, 295, 50)];
    _textfieldmm.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_textfieldmm];
    _textfieldmm.delegate = self;
    [self.view addSubview:_textfieldzh];
    [self.view addSubview:_textfieldmm];
    _textfieldzh.placeholder = @"请输入姓名";
    _textfieldmm.placeholder = @"请输入学号";
    UIButton *butonsousuo =[[UIButton alloc]initWithFrame:CGRectMake(140, 450, 130, 70)];
    [butonsousuo setTitle:@"搜索" forState:UIControlStateNormal];
    [butonsousuo addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butonsousuo];
}
-(void)search
{   int cnt = 0;
        NSString *name ;
        NSString *banji ;
        NSString *chengji ;
        NSString *number ;
        NSInteger *sex ;
    for (int i =0; i<_dataarry1.count; i++) {
        cnt = 0;
        studentmudle *model = [[studentmudle alloc]init];
        model = _dataarry1[i];
        if([model.studentnum  isEqualToString:_textfieldmm.text]&&[model.studentname isEqualToString:_textfieldzh.text])
        {
            cnt = 1;
            name = model.studentname;
            sex = model.studentsex;
            number = model.studentnum;
            banji = model.studentbanji;
            chengji = model.studentcj;
            break;
        }
            
    }
    if(cnt==0)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"老哥提示" message:@"查无此人" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的吧" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self->_textfieldmm.text = @"";
            self->_textfieldzh.text = @"";
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        zcViewController *zs = [[zcViewController alloc]init];
        zs.name = name;
        zs.sex = sex;
        zs.number =number ;
        zs.banji =banji;
        zs.chengji =chengji;
        [self.navigationController pushViewController:zs animated:YES];
        
    }
}

@end
