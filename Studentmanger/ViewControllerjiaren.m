//
//  ViewControllerjiaren.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/7.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "ViewControllerjiaren.h"

@interface ViewControllerjiaren ()<UITextFieldDelegate>
@property UITextField * textname;
@property UITextField * textnum;
@property UITextField * textsex;
@property UITextField * textbanji;
@property UITextField * textchengji;
@end

@implementation ViewControllerjiaren


- (void)viewDidLoad {
    [super viewDidLoad];
    _textname = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, 295, 50)];
    _textname.backgroundColor = [UIColor whiteColor];
    _textname.placeholder = @"请输入小可爱姓名";
    _textsex = [[UITextField alloc]initWithFrame:CGRectMake(40, 180, 295, 50)];
    _textsex.backgroundColor = [UIColor whiteColor];
    _textsex.placeholder = @"请输入小可爱性别";
    _textnum = [[UITextField alloc]initWithFrame:CGRectMake(40, 260, 295, 50)];
    _textnum.backgroundColor = [UIColor whiteColor];
    _textnum.placeholder = @"请输入小可爱学号";
    _textchengji = [[UITextField alloc]initWithFrame:CGRectMake(40, 340, 295, 50)];
    _textchengji.backgroundColor = [UIColor whiteColor];
    _textchengji.placeholder = @"请输入小可爱成绩";
    _textbanji = [[UITextField alloc]initWithFrame:CGRectMake(40, 420, 295, 50)];
    _textbanji.backgroundColor = [UIColor whiteColor];
    _textbanji.placeholder = @"请输入小可爱班级";
    [self.view addSubview:_textname];
    [self.view addSubview:_textbanji];
    [self.view addSubview:_textchengji];
    [self.view addSubview:_textsex];
    [self.view addSubview:_textnum];
    UIButton * buttonzhuce = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 200, 40)];
    [buttonzhuce setTitle:@"添加小可爱" forState:UIControlStateNormal];
    [buttonzhuce setTintColor:[UIColor orangeColor]];
    [buttonzhuce addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonzhuce];
}
-(void)add
{
    {   int cnt = 0;
        for (int i =0; i<_dataarry1.count; i++) {
            cnt = 0;
            studentmudle *model = [[studentmudle alloc]init];
            model = _dataarry1[i];
            if([model.studentnum  isEqualToString:_textnum.text]||[model.studentname isEqualToString:_textname.text])
            {
                cnt = 1;
                
                break;
            }
            
        }
        if(cnt==1)
        {
            UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"老哥提示" message:@"小可爱的姓名或学号已经注册" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure1 = [UIAlertAction actionWithTitle:@"事这么多，还过不过七夕了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                self->_textname.text = @"";
                self->_textsex.text = @"";
                self->_textnum.text = @"";
                self->_textchengji.text = @"";
                self->_textbanji.text = @"";
                
            }];
            [alert1 addAction:sure1];
            [self presentViewController:alert1 animated:YES completion:nil];
        }
        else
        {
            int a ;
            if([_textsex.text isEqualToString:@"男"])
            {
                a=1;
            }
            else
            {
                a=0;
            }
            oneViewController *zs = [[oneViewController alloc]init];
            [self.delegate pass:_textname.text andsex:a andnum:_textnum.text and:_textchengji.text andbanji:_textbanji.text];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
