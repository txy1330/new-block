//
//  PopUpView.h
//  省市县弹框demo
//
//  Created by txyPro on 16/6/17.
//  Copyright © 2016年 txyPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopUpView : UIView
@property (copy,nonatomic)void(^operate)(NSUInteger);
+(void)PopUpViewWithListArray:(NSArray *)ListArr AndStartPoint:(CGPoint)startPoint andWidth:(CGFloat)width andOperate:(void (^)(NSUInteger index))operate;
@end
