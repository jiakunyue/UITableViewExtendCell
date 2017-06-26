//
//  ClassModel.m
//  UITableView展开缩放
//
//  Created by Justin on 2017/6/23.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import "ClassModel.h"

@implementation ClassModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if ([value isKindOfClass:[NSNull class]]) {
        
        return;
    }
    
    if ([key isEqualToString:@"students"] && [value isKindOfClass:[NSArray class]]) {
        
        NSArray        *tmp       = value;
        NSMutableArray *dataArray = [NSMutableArray array];
        
        for (NSDictionary *info in tmp) {
            
            StudentModel *obj = [[StudentModel alloc] initWithDictionary:info];
            [dataArray addObject:obj];
        }
        
        value = dataArray;
    }
    
    [super setValue:value forKey:key];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        
        if (self = [super init]) {
            
            [self setValuesForKeysWithDictionary:dictionary];
        }
        
        return self;
        
    } else {
        
        return nil;
    }
}

@end
