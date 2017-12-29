//
//  NWTestClient.m
//  BaseProject
//
//  Created by chenliangjie on 2016/11/21.
//  Copyright © 2016年 chenliangjie. All rights reserved.
//

#import "NWTestClient.h"

NSString * const kDynamicPath = @"/msg/dyn";

@implementation NWTestClient

+ (NWTestClient *)sharedClient
{
    static NWTestClient * client = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        client = [[self alloc] initWithBaseURL:[self baseURL]];
    });
    return client;
}

+ (NSURL *)baseURL
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[self domain],kDynamicPath]];
}

- (void)mobileDynamicBytypeOrParkCode:(NSString *)ID
                          lastestTime:(NSDate *)time
                          forwordFlag:(BOOL)forWordFlag
                               isPark:(BOOL)isPark
                             finished:(ECSPHTTPSessionFinishedHandler)handler
{
    NSMutableDictionary * parameters = [NSMutableDictionary new];
    [parameters setObject:ID forKey:@"typeOrParkCode"];
    if(time)
    {
        [parameters setObject:[time description] forKey:@"createTime"];
    }
    else
    {
        NSString * time = @"0000-00-00 00:00:00";
        NSString * timeStr = [time stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [parameters setObject:timeStr forKey:@"createTime"];
    }
    
    [parameters setObject:forWordFlag?@"true":@"false" forKey:@"forwordFlag"];
    [parameters setObject:isPark?@"true":@"false" forKey:@"isPark"];
    [parameters setObject:@(10) forKey:@"size"];
    
    /*if(ACCCurUser)
    {
        [parameters setObject:[ACCCurUser ID] forKey:@"userID"];
    }
    else
    {
        [parameters setObject:[ACCCurEnv UUID] forKey:@"userID"];
    }*/
    
    [parameters setObject:[self UUID] forKey:@"userID"];
    
    [self post:@"getMobileDynamicList" parameters:parameters success:^(id responseObject) {
        
        NSMutableArray * array = [NSMutableArray new];
        if(!responseObject || ((NSArray *)responseObject).count == 0)
        {
            handler(array,nil);
            return ;
        }
        NSArray *dynamics = (NSArray *)responseObject;
        for (NSDictionary *dict in dynamics)
        {
            [array addObject:dict];
        }
        handler(array,nil);
    } failure:^(NSError *error) {
        handler(nil,error);
    }];
}

- (NSString *)UUID
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}

@end
