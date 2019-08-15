//
//  xiugaiViewController.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/7.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "xiugaiViewController.h"
#import "dealViewController.h"
#import "kanTableViewCell.h"
@interface xiugaiViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property UITextField * zhTextField;
@property UITextField * mmTextField;
@property UITextField * sexTextField;
@property UITextField * banjiTextField;
@property UITextField * cjTextField;
@property UITableView *TableView;
@property NSInteger a;
@property NSInteger b;
@end

@implementation xiugaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _b = 0;

    self.navigationItem.title = @"修改信息";
    _zhTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 230, 295, 40)];
     _cjTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 530, 295, 40)];
     _banjiTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 455, 295, 40)];
     _sexTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 380, 295, 40)];
    [self.view addSubview:_zhTextField];
    _zhTextField.backgroundColor = [UIColor whiteColor];
    _zhTextField.delegate = self;
      _sexTextField.delegate = self;
      _banjiTextField.delegate = self;
      _cjTextField.delegate = self;
    _mmTextField = [[UITextField alloc]initWithFrame:CGRectMake(40,305, 295, 40)];
    _mmTextField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mmTextField];
    _mmTextField.delegate = self;
    [self.view addSubview:_zhTextField];
    [self.view addSubview:_banjiTextField];
     [self.view addSubview:_sexTextField];
     [self.view addSubview:_cjTextField];
    _zhTextField.placeholder = @"请输入姓名";
    _mmTextField.placeholder = @"请输入学号";
     _cjTextField.placeholder = @"请输入成绩";
     _sexTextField.placeholder = @"请输入性别";
     _banjiTextField.placeholder = @"请输入班级";
    _sexTextField.backgroundColor = [UIColor whiteColor];
     _banjiTextField.backgroundColor = [UIColor whiteColor];
     _cjTextField.backgroundColor = [UIColor whiteColor];
    UIButton *butonsousuo =[[UIButton alloc]initWithFrame:CGRectMake(140, 600, 50, 20)];
    [butonsousuo setTitle:@"修改" forState:UIControlStateNormal];
    [butonsousuo addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butonsousuo];
    self.view.backgroundColor = [UIColor orangeColor];
    _TableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 210) style:UITableViewStylePlain];
    _TableView.dataSource = self;
    _TableView.delegate =self;
    [self.view addSubview:_TableView];
    UIButton * zhankaishouqiButton = [[UIButton alloc]initWithFrame:CGRectMake(295, 100, 70, 50)];
    [zhankaishouqiButton setImage:[UIImage imageNamed:@"zhankai-2.png"] forState:UIControlStateNormal];
    [zhankaishouqiButton setImage:[UIImage imageNamed:@"shouqi.png"] forState:UIControlStateSelected];
    [zhankaishouqiButton addTarget:self action:@selector(zhankai:) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:zhankaishouqiButton];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_b==1) {
    return 0;
    }
    else{
    return self.dataarry1.count;
    }
  
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
    kanTableViewCell * cell =[[kanTableViewCell alloc]initWithStyle:UITableViewStyleGrouped reuseIdentifier:id];
    if(!cell)
    {
        cell = [[kanTableViewCell alloc]initWithStyle:UITableViewStyleGrouped reuseIdentifier:id];
    }
    studentmudle * model = _dataarry1[indexPath.section];
    cell.l1.text = @"姓名";
    cell.l2.text=model.studentname;
    cell.l3.text = @"班级";
    cell.l4.text = model.studentbanji;
    cell.l5.text= @"学号";
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
-(void)search
{
    NSLog(@"123");
    int cnt=-1;
    for (int i =0; i<_dataarry1.count; i++) {
        cnt = 0;
        studentmudle *model = [[studentmudle alloc]init];
        model = _dataarry1[i];
        if([model.studentname isEqualToString:_zhTextField.text])
        {
            cnt = i;
            break;
        }
        
    }
    if(cnt==-1)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"老哥提示" message:@"查无此人" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"好的吧" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self->_mmTextField.text = @"";
            self->_zhTextField.text = @"";
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];
        NSLog(@"1234");
        
       
    }
    else
    {   int a;
         NSLog(@"12345");
        
        if([_sexTextField.text isEqualToString:@"男"])
        {
            a=1;
        }
        else{
            a = 0;
        }
        _a=cnt;
         [self push];
        studentmudle *student = [[studentmudle alloc]init];
        student.studentsex = a;
        student.studentcj =_cjTextField.text;
        student.studentnum =_mmTextField.text;
        student.studentname = _zhTextField.text;
        student.studentbanji = _banjiTextField.text;
        [_dataarry1 replaceObjectAtIndex:cnt withObject:student];
        [self.delegate pass:_dataarry1];
          [_TableView reloadData];
        //[self.navigationController popViewControllerAnimated:YES];
    
    }
}
-(void)zhankai:(UIButton*)button
{
    if(_b==0)
    {
        _b = 1;
        _TableView.hidden = YES;
        NSLog(@"%ld",_b);
    }
   else if(_b == 1)
    {
        _b = 0;
        _TableView.hidden = NO;
        NSLog(@"%ld",_b);
    }
    button.selected = !button.selected;
    [_TableView reloadData];
 
}
-(void)push
{
    _TableView.contentOffset = CGPointMake(0, _a*200-200);
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
