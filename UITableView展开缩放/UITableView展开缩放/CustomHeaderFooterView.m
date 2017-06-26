//
//  CustomHeaderFooterView.m
//  UITableView展开缩放
//
//  Created by Justin on 2017/6/15.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import "CustomHeaderFooterView.h"

#define  kScrren_Width   [UIScreen mainScreen].bounds.size.width
@implementation CustomHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self createSubview];
    }
    return self;
}

- (void)createSubview {
    
    //白色背景
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScrren_Width, 30)];
    backgroundView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backgroundView];
    
    //容器视图背景
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 2, kScrren_Width, 26)];
    contentView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.05f];
    [self addSubview:contentView];
    
    //标题
    UILabel *normalClassNameLabel      = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 26)];
    normalClassNameLabel.font = [UIFont systemFontOfSize:12.0f];
    [contentView addSubview:normalClassNameLabel];
    self.normalClassNameLabel = normalClassNameLabel;
    
    //上分割线
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScrren_Width, 0.5)];
    line1.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    [contentView addSubview:line1];
    
    //下分割线
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 25.5f, kScrren_Width, 0.5)];
    line2.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    [contentView addSubview:line2];
    
    // 遮挡按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScrren_Width, 30)];
    [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)buttonEvent:(UIButton *)button {
    if (self.delegate && [self.delegate respondsToSelector:@selector(customHeaderFooterView:event:)]) {
        [self.delegate customHeaderFooterView:self event:nil];
    }
}
@end
