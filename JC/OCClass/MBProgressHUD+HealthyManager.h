//
//  MBProgressHUD+HealthyManager.h
//  HealthyManager
//
//  Created by zhaoshenkan on 16/5/30.
//  Copyright © 2016年 鑫方讯. All rights reserved.
//

//#import "MBProgressHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (HealthyManager)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
