//
//  ClassModel.h
//  UITableView展开缩放
//
//  Created by Justin on 2017/6/23.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentModel.h"

@interface ClassModel : NSObject

@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSArray <StudentModel *>*students;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

#pragma mark - 额外的数据
@property (nonatomic) BOOL  expend;

@end
