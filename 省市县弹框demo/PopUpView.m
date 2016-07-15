//
//  PopUpView.m
//  省市县弹框demo
//
//  Created by txyPro on 16/6/17.
//  Copyright © 2016年 txyPro. All rights reserved.
//

#import "PopUpView.h"
#define ScreenH  [UIScreen mainScreen].bounds.size.height
#define ScreenW  [UIScreen mainScreen].bounds.size.width

@interface PopUpView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UIView *BGView;//背景
@property (nonatomic,strong)UITableView *ListView;//弹出的列表
@property (nonatomic,strong)NSArray *listArr;//列表数组
@end
@implementation PopUpView
- (instancetype)initWithFrame:(CGRect)frame andListArr:(NSArray *)ListArr andStartPoint:(CGPoint)startPoint
{
    self = [super init];

    if (self) {
        UIView *bgView = [[UIView alloc]initWithFrame:frame];
        bgView.backgroundColor = [UIColor clearColor];
        self.BGView = bgView;
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction)];
        [self.BGView addGestureRecognizer:panGR];

        self.ListView = [[UITableView alloc]initWithFrame:CGRectMake(startPoint.x, startPoint.y, 150, ScreenH-startPoint.y)];
        self.ListView.backgroundColor = [UIColor grayColor];
        [self.BGView addSubview:self.ListView];
        self.listArr = ListArr;
        self.ListView.dataSource = self;
        self.ListView.delegate = self;
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.ListView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell.textLabel.text = self.listArr[indexPath.row];
    }
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger index = indexPath.row;
    self.operate(index);
}
+(void)PopUpViewWithListArray:(NSArray *)ListArr AndStartPoint:(CGPoint)startPoint andWidth:(CGFloat)width andOperate:(void (^)(NSUInteger index))operate
{
    PopUpView *popView = [[PopUpView alloc]initWithFrame:[UIScreen mainScreen].bounds andListArr:ListArr andStartPoint:startPoint];
    popView.operate = operate;
    
    [[UIApplication sharedApplication].keyWindow addSubview:popView];
   
}
-(void)panAction
{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
