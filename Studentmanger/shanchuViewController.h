//
//  shanchuViewController.h
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/7.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "studentmudle.h"
NS_ASSUME_NONNULL_BEGIN
@protocol passdelegatea <NSObject>

-(void)passremovea:(NSMutableArray*)aa;

@end
@interface shanchuViewController : UIViewController
@property  (nonatomic) NSMutableArray *dataarry1;
@property id<passdelegatea>delegate;
@end

NS_ASSUME_NONNULL_END
