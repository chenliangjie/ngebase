//
//  NSDictionary+ECSPNetwork.m
//
//
//  Created by hong tianjun on 15/4/17.
//  Copyright (c) 2015年 Haitian. All rights reserved.
//

#import "NSDictionary+ECSPNetwork.h"

@implementation NSDictionary(ECSPNetwork)

- (id)networkSafeObjectForKey:(id)aKey
{
    id value = [self objectForKey:aKey];
    if ([self isNilOrNull:value])
    {
        return nil;
    }
    return value;
}

- (BOOL)isNilOrNull:(id)obj
{
    BOOL isNull = NO;
    
    if (obj == nil || [obj isKindOfClass:[NSNull class]])
    {
        isNull = YES;
    }
    else
    {
        if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSMutableString class]])
        {
            if ([[(NSString *)obj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
            {
                isNull = YES;
            }
        }
    }
    
    return isNull;
}

@end
