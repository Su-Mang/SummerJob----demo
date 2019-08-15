//
//  loginViewController.h
//  Studentmanger
//
//  Created by 岳靖翔 on 2019/8/6.
//  Copyright © 2019 岳靖翔. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol passDelegate <NSObject>

-(void)pass:(NSString*)and:(NSString*)b;

@end
@interface loginViewController : UIViewController
@property UITextField *zhTextField;
@property UITextField *qrmmTextField;
@property UITextField *mmTextField;
@property NSMutableArray *nsmutablearryzhanghao;
@property NSMutableArray *nsmutablearrymima ;
@property id<passDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
