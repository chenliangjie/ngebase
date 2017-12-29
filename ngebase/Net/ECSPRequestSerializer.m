//
//  ECSPRequestSerializer.m
//  bjd
//
//  Created by hong7 on 15/10/19.
//  Copyright © 2015年 hong7. All rights reserved.
//

#import "ECSPRequestSerializer.h"
#import "NSDictionary+ECSPNetwork.h"

NSString * kEcspRequestSerializerUserAgent = nil;
NSDictionary * kEcspLoginInfo = nil;

@implementation ECSPRequestSerializer

#pragma mark - AFURLRequestSerialization

+ (void)setGlobalUserAgent:(NSString *)userAgent
{
    if(userAgent)
        kEcspRequestSerializerUserAgent = userAgent;
}

+ (void)setLoginInfo:(NSDictionary *)loginInfo
{
    if(loginInfo)
        kEcspLoginInfo = [NSDictionary dictionaryWithDictionary:loginInfo];
    else
        kEcspLoginInfo = nil;
}

- (instancetype)init
{
    if ([super init])
    {
        if(kEcspRequestSerializerUserAgent)
        {
            NSDictionary *requestHeaders = [self HTTPRequestHeaders];
            NSString *oldUserAgent = [requestHeaders objectForKey:@"User-Agent"];
            
            NSString *customerInfo = kEcspRequestSerializerUserAgent;
            NSString *newAgent = [oldUserAgent stringByAppendingString:customerInfo];
            
            if (newAgent)
            {
                if (![newAgent canBeConvertedToEncoding:NSASCIIStringEncoding])
                {
                    NSMutableString *mutableUserAgent = [newAgent mutableCopy];
                    if (CFStringTransform((__bridge CFMutableStringRef)(mutableUserAgent), NULL, (__bridge CFStringRef)@"Any-Latin; Latin-ASCII; [:^ASCII:] Remove", false))
                    {
                        newAgent = mutableUserAgent;
                    }
                }
                [self setValue:newAgent forHTTPHeaderField:@"User-Agent"];
            }
            
            //NSLog(@"[HTTPRequestHeaders] %@",[self HTTPRequestHeaders]);
        }
    }
    
    return self;
}

- (NSURLRequest *)requestBySerializingRequest:(NSURLRequest *)request
                               withParameters:(id)parameters
                                        error:(NSError *__autoreleasing *)error
{
    //加入需要处理的
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:parameters];

    if(kEcspLoginInfo && [kEcspLoginInfo isKindOfClass:[NSDictionary class]]) {
        [params addEntriesFromDictionary:kEcspLoginInfo];
    }
    
    // 特殊处理(针对忘记密码->设置新密码)
    NSString *userId = [parameters objectForKey:@"userId"];
    if(userId && [userId isKindOfClass:[NSString class]] && userId.length > 0) {
        [params setObject:userId forKey:@"userId"];
    }
    
    [params setObject:@"json" forKey:@"format"];
    NSLog(@"par== %@",params);
    NSLog(@"request=%@",request.allHTTPHeaderFields);
    return [super requestBySerializingRequest:request withParameters:params error:error];
}

@end
