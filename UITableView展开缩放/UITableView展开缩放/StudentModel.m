//
//  StudentModel.m
//  UITableView展开缩放
//
//  Created by Justin on 2017/6/23.
//  Copyright © 2017年 jerei. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    if ([value isKindOfClass:[NSNull class]]) {
        
        return;
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
