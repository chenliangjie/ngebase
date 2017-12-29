//
//  ECSPRequestSerializer.h
//  bjd
//
//  Created by hong7 on 15/10/19.
//  Copyright © 2015年 hong7. All rights reserved.
//

#import "AFURLRequestSerialization.h"

@interface ECSPRequestSerializer : AFHTTPRequestSerializer

/**
 设置User-Agent
 @param userAgent userAgent
 */
+ (void)setGlobalUserAgent:(NSString *)userAgent;

/*
 loginInfo参数接收格式
 包含两个Array
 keys   [userId, LOGIN, SECURELOGIN]
 values [ID, loginName, token]
 */

/**
 设置登录信息
 @param loginInfo 登录信息
 */
+ (void)setLoginInfo:(NSDictionary *)loginInfo;

@end
