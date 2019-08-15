//
//  resignerViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/6.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "resignerViewController.h"
#import "loginViewController.h"
#import "oneViewController.h"
#import "twoViewController.h"
#import "threeViewController.h"
@interface resignerViewController ()<UITextFieldDelegate,passDelegate>
@property NSInteger a;
@property NSString *str1;
@property NSString *str2;
@property NSMutableArray *nsmutablearryzhanghao;
@property NSMutableArray *nsmutablearrymima ;

@end

@implementation resignerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nsmutablearryzhanghao = [[NSMutableArray alloc]initWithObjects:@"234", nil];
    _nsmutablearrymima = [[NSMutableArray alloc]initWithObjects:@"123", nil];
    _zhTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 300, 295, 50)];
    [self.view addSubview:_zhTextField];
    _zhTextField.backgroundColor = [UIColor whiteColor];
    _zhTextField.delegate = self;
    _mmTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 375, 295, 50)];
    _mmTextField.backgroundColor = [UIColor whiteColor];
     [self.view addSubview:_mmTextField];
    _mmTextField.delegate = self;
    UIButton *b1 = [[UIButton alloc]initWithFrame:CGRectMake(90, 460, 40, 25)];
    [self.view addSubview:b1];
    [b1 addTarget:self action:@selector(denglu) forControlEvents:UIControlEventTouchUpInside];
    [b1 setTitle:@"登陆" forState:UIControlStateNormal];
    [b1.layer setBorderColor:[UIColor whiteColor].CGColor];
    [b1.layer setBorderWidth:0.3];
    b1.layer.masksToBounds = YES;
    UIButton *b2 = [[UIButton alloc]initWithFrame:CGRectMake(240, 460, 40, 25)];
    [self.view addSubview:b2];
    [b2 addTarget:self action:@selector(zhuce) forControlEvents:UIControlEventTouchUpInside];
    [b2 setTitle:@"注册" forState:UIControlStateNormal];
    [b2.layer setBorderColor:[UIColor whiteColor].CGColor];
    [b2.layer setBorderWidth:0.3];
    b2.layer.masksToBounds = YES;
      self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.5];
    _mmTextField.secureTextEntry = YES;
    
   }
-(void)zhuce
{
    loginViewController * aa = [[loginViewController alloc]init];
    aa.delegate = self;
    aa.nsmutablearrymima = _nsmutablearrymima;
    aa.nsmutablearryzhanghao = _nsmutablearryzhanghao;
    [self presentViewController:aa animated:YES completion:nil];
}
- (void)pass:(NSString *)and :(NSString *)b
{
    _zhTextField.text = and;
    _mmTextField.text = b;
    _str1 = and;
    _str2 = b;
    [_nsmutablearryzhanghao addObject:and];
    [_nsmutablearrymima addObject:b];
    
}


-(void)denglu
{   for(int i = 0;i<_nsmutablearryzhanghao.count;i++)
    {
      //  NSLog(@"%@",_nsmutablearryzhanghao[i]);
         NSLog(@"%@",_nsmutablearrymima[i]);
        NSString *st1 = [NSString stringWithFormat:@"%@",_nsmutablearryzhanghao[i] ];
        NSString *st2 = [NSString stringWithFormat:@"%@",_nsmutablearrymima[i] ];
    if([st1 isEqualToString:_zhTextField.text]&&[st2 isEqualToString:_mmTextField.text])
    {
        oneViewController *oneViewcontroller = [[oneViewController alloc]init];
        twoViewController *twoViewcontroller = [[twoViewController alloc]init];;
        threeViewController *threeViewcontroller = [[threeViewController alloc]init];
        UINavigationController *noneNavigationController =[[UINavigationController alloc]initWithRootViewController:oneViewcontroller];
        UINavigationController *ntwoNavigationController = [[UINavigationController alloc]initWithRootViewController:twoViewcontroller];
        UINavigationController *nthreeNavigationController = [[UINavigationController alloc]initWithRootViewController:threeViewcontroller];
        NSArray*arry = @[noneNavigationController,ntwoNavigationController,nthreeNavigationController];
        UITabBarController *TabBarController = [[UITabBarController alloc]init];
        TabBarController.viewControllers = arry;
        [self presentViewController:TabBarController animated:YES completion:nil];
        UIImage *oneImage=[UIImage imageNamed:@"/Users/sumang/Desktop/Objective-c/demo/XCode project/Pro2/Pro2/导航控制器基础/照片墙/Studentmanger/Studentmanger/setup.png"];
        oneImage = [oneImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.navigationItem setTitle:@"设置"];
        UITabBarItem *tab = [[UITabBarItem alloc]initWithTitle:@"设置" image:oneImage tag:3];
      nthreeNavigationController.tabBarItem = tab;
        UIImage *twoImage=[UIImage imageNamed:@"/Users/sumang/Desktop/Objective-c/demo/XCode project/Pro2/Pro2/导航控制器基础/照片墙/Studentmanger/Studentmanger/notebook.png"];
        twoImage = [twoImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *tab2 = [[UITabBarItem alloc]initWithTitle:@"信息 " image:twoImage tag:2];
        ntwoNavigationController.tabBarItem =tab2;
        NSLog(@"登陆成功");
    }
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"老哥衷心提醒" message:@"密码或账号有误" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"说的是人话吗？" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.zhTextField.text = @"";
        self.mmTextField.text = @"";
    }];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_mmTextField resignFirstResponder];
    [_zhTextField resignFirstResponder];
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
