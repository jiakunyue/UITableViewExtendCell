//
//  CustomHeaderFooterView.h
//  UITableView展开缩放
//
//  Created by Justin on 2017/6/15.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomHeaderFooterView;

@protocol CustomHeaderFooterViewDelegate <NSObject>

- (void)customHeaderFooterView:(CustomHeaderFooterView *)customHeaderFooterView event:(id)event;

@end

@interface CustomHeaderFooterView : UITableViewHeaderFooterView
/** 分组标题 */
@property (nonatomic, strong) UILabel *normalClassNameLabel;
/** delegate */
@property (nonatomic, weak) id<CustomHeaderFooterViewDelegate> delegate;

@property (nonatomic) NSInteger section;

@end
