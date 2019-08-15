//
//  ckanViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/6.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "ckanViewController.h"
#import "kanTableViewCell.h"
#import "studentmudle.h"
@interface ckanViewController ()<UITableViewDataSource,UITableViewDelegate>

@property UITableView *TextView;
@end

@implementation ckanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _TextView =  [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _TextView.delegate = self;
    _TextView.dataSource =self;
    [self.view addSubview:_TextView];
    
    
   
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataarry1.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* id = @"123";
    kanTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:id];
    if(!cell)
    {
        cell = [[kanTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    studentmudle * model = _dataarry1[indexPath.section];
        cell.l1.text = @"姓名";
    cell.l2.text=model.studentname;
        cell.l3.text = @"班级";
    cell.l4.text = model.studentbanji;
        cell.l5.text=  @"学号";
    cell.l6.text = model.studentnum;
        cell.l7.text = @"成绩";
    cell.l8.text = model.studentcj;
    if(model.studentsex == 1)
    {
        cell.uiimgeView.image = [UIImage imageNamed:@"nan.png"];
    }
    else
    {
        cell.uiimgeView.image = [UIImage imageNamed:@"nv.png"];
    }
    return cell;
}
@end
