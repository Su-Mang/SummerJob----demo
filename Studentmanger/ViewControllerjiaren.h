//
//  ViewControllerjiaren.h
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/7.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "oneViewController.h"
#import"studentmudle.h"
NS_ASSUME_NONNULL_BEGIN

@protocol passstudentDelegate <NSObject>

- (void)pass:(NSString *)name andsex:(NSInteger)sex andnum:(NSString *)num and:(NSString *)chengji andbanji:(NSString *)banji;

@end
@interface ViewControllerjiaren : UIViewController
@property id<passstudentDelegate>delegate;
@property  (nonatomic) NSMutableArray *dataarry1;
@end

NS_ASSUME_NONNULL_END
