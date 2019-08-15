//
//  loginViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/6.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "loginViewController.h"
#import "resignerViewController.h"
@interface loginViewController ()<UITextFieldDelegate>
@property NSInteger a ;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.5];
    _zhTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 300, 295, 50)];
    _zhTextField.backgroundColor = [UIColor whiteColor];
    _zhTextField.placeholder=@"请输入账号";
    [self.view addSubview:_zhTextField];
    _zhTextField.tag =1;
    _mmTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 455, 295, 50)];
    _mmTextField.backgroundColor = [UIColor whiteColor];
    _mmTextField.placeholder=@"请确认密码";
    [self.view addSubview:_mmTextField];
    _mmTextField.tag =3;
    _qrmmTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 380, 295, 50)];
    _qrmmTextField.backgroundColor = [UIColor whiteColor];
    _qrmmTextField.placeholder=@"请输入密码";
    [self.view addSubview:_qrmmTextField];
    _zhTextField.tag =2;
    UIButton * b1 = [[UIButton alloc]initWithFrame:CGRectMake(147, 545, 102, 35)];
    [b1 setTitle: @"确认注册" forState:UIControlStateNormal];
    [self.view addSubview:b1];
    [b1.layer setBorderWidth:0.3];
    [b1.layer setBorderColor:[UIColor whiteColor].CGColor];
    b1.layer.masksToBounds = YES;
    [b1 addTarget:self action:@selector(queren) forControlEvents:UIControlEventTouchUpInside];
    _mmTextField.delegate = self;
    _qrmmTextField.delegate = self;
    _zhTextField.delegate = self;
    _qrmmTextField.secureTextEntry =YES;
    _mmTextField.secureTextEntry = YES;
    
    
    
}
-(void)queren
{
    resignerViewController *aa =[[resignerViewController alloc]init];
    int cnt = 0;
    if(_mmTextField.text !=_qrmmTextField.text)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"老哥衷心提示提示" message:@"两次密码不一样哦" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * sure = [UIAlertAction actionWithTitle:@"你凶凶" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            self.qrmmTextField. text = @"";
            self.mmTextField.text = @"";
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
    }
    for (int i =0; i<_nsmutablearryzhanghao.count; i++) {
        if([_nsmutablearryzhanghao[i] isEqualToString:_zhTextField.text])
        {
            UIAlertController *alert  = [UIAlertController alertControllerWithTitle:@"老哥衷心提示提示" message:@"小老弟你账号重复了" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * sure = [UIAlertAction actionWithTitle:@"你凶凶" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                self.zhTextField.text = @"";
            }];
            [alert addAction:sure];
            [self presentViewController:alert animated:YES completion:nil];
            cnt = 1;
            break;
        
        }
    }
      if(cnt!=1){
                [ self.delegate pass:_zhTextField.text :_mmTextField.text ];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_qrmmTextField resignFirstResponder];
    [_zhTextField resignFirstResponder];
    [_mmTextField resignFirstResponder];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _a =textField.tag;
    self.view.frame = CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height);
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (_a == textField.tag) {
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    return YES;
}
@end
