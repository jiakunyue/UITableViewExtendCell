//
//  StudentModel.h
//  UITableView展开缩放
//
//  Created by Justin on 2017/6/23.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
