//
//  JCOCTool.h
//  JC
//
//  Created by 赵申侃 on 2018/6/11.
//  Copyright © 2018年 赵申侃. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JCOCTool : NSObject

+ (NSString *)scaleImg:(UIImage *)resultImg;

+ (void)setLabelHeightTitle:(NSString *)title FontSize:(CGFloat)font lines:(NSInteger)lines label:(UILabel *)label;

@end
