//
//  kaijiViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/6.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "kaijiViewController.h"
#import "resignerViewController.h"
@interface kaijiViewController ()

@end

@implementation kaijiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:0.5];
    UIImageView  *ImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    ImageView.image = [UIImage imageNamed:@""];
    [self performSelector:@selector(resiger) withObject:self afterDelay:2];
    
    // Do any additional setup after loading the view.
}
-(void)resiger
{
    resignerViewController *resiger = [[resignerViewController alloc]init];
    [self presentViewController:resiger animated:YES completion:nil];
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
