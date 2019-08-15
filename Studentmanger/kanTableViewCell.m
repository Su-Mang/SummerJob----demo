//
//  kanTableViewCell.m
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/6.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import "kanTableViewCell.h"

@implementation kanTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.l1 = [[UILabel alloc]init];
        [self.contentView addSubview:_l1];
        self.l2 = [[UILabel alloc]init];
        [self.contentView addSubview:_l2];
        self.l3 = [[UILabel alloc]init];
        [self.contentView addSubview:_l3];
        self.l4 = [[UILabel alloc]init];
        [self.contentView addSubview:_l4];
        self.l5 = [[UILabel alloc]init];
        [self.contentView addSubview:_l5];
        self.l6 = [[UILabel alloc]init];
        [self.contentView addSubview:_l6];
        self.l7 = [[UILabel alloc]init];
        [self.contentView addSubview:_l7];
        self.l8 = [[UILabel alloc]init];
        [self.contentView addSubview:_l8];
        self.uiimgeView = [[UIImageView alloc]init];
        [self.contentView addSubview:_uiimgeView];
    }
    return  self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _l1.frame = CGRectMake(20, 0, 100, 40);
    _l2.frame = CGRectMake(150, 0, 100, 40);
    _l3.frame = CGRectMake(20, 50, 100, 40);
    _l4.frame = CGRectMake(150, 50, 100, 40);
    _l5.frame = CGRectMake(20, 100, 100, 40);
    _l6.frame = CGRectMake(150, 100, 100, 40);
    _l7.frame = CGRectMake(20, 150, 100, 40);
    _l8.frame = CGRectMake(150, 150, 100, 40);
    _uiimgeView.frame = CGRectMake(270,70, 50, 50);
   
    
}

@end
