//
//  xiugaiViewController.h
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/7.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentmudle.h"
NS_ASSUME_NONNULL_BEGIN
@protocol passarry <NSObject>

-(void)pass:(NSMutableArray*)arry;

@end
@interface xiugaiViewController : UIViewController
@property  (nonatomic) NSMutableArray *dataarry1;
@property id<passarry>delegate;
@end

NS_ASSUME_NONNULL_END
