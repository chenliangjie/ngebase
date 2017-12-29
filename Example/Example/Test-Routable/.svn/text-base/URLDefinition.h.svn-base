//
//  URLDefinition.h
//  ecsp
//
//  Created by chenliangjie on 16/7/26.
//  Copyright © 2016年 hong7. All rights reserved.
//

#ifndef URLDefinition_h
#define URLDefinition_h

/**
 调用方法:
 a.URL + URL普通参数
   [[Routable sharedRouter] open:urlStr]
 
 b.URL + URL普通参数 + 回调block
   [[Routable sharedRouter] open:urlStr withCallback:callBack]
 
 c.URL + URL普通参数 + Extra参数 + 回调block
   [[Routable sharedRouter] open:urlStr withParams:params callback:callBack]
 
   Extra参数分两种:
   •非常规参数UIImage、NSData等
   •如果URL普通参数只标识Action执行类型，那么执行所需要的参数由Extra参数带入
 */

#pragma mark - 组件URL定义

/**
 URL描述:  测试Module
 URL参数:  actionType 0-测试
 --------------------------------
 Extra参数:
 ID         测试ID
 callback   测试回调
  */
#define Module_TEST_URL   @"TestModule/:actionType"

/**
 URL描述:  测试网络模块
 URL参数:  actionType 0-测试
 --------------------------------
 Extra参数:
 无
 */
#define Module_NETWORK_URL   @"NWTestModule/:actionType"

#endif /* URLDefinition_h */
