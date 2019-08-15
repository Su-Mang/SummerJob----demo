//
//  shanchuViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/7.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "shanchuViewController.h"
#import "oneViewController.h"
@interface shanchuViewController ()
@property UITextField * textfieldzh;
@property UITextField * textfieldmm;
@end

@implementation shanchuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"删除";
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
    [butonsousuo setTitle:@"删除" forState:UIControlStateNormal];
    [butonsousuo addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butonsousuo];

}
-(void)search
{
    int cnt = -1;
    for (int i =0; i<_dataarry1.count; i++) {
        cnt = 0;
        studentmudle *model = [[studentmudle alloc]init];
        model = _dataarry1[i];
        if([model.studentnum  isEqualToString:_textfieldmm.text]&&[model.studentname isEqualToString:_textfieldzh.text])
        {
            cnt = i;
        }
        
    }
    if(cnt==-1)
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
        oneViewController *home = [[oneViewController alloc]init];
        [_dataarry1 removeObjectAtIndex:cnt];
        [self.delegate passremovea:_dataarry1];
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}


@end
