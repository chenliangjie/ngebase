//
//  ECSPURLConection.h
//  bjd
//
//  Created by hong7 on 15/10/19.
//  Copyright © 2015年 hong7. All rights reserved.
//

#import "AFHTTPSessionManager.h"

extern NSString * const ECSPAPIErrorDomain;

NSString * ECSPAPIErrorMessage(NSError * error);
typedef void (^ECSPHTTPSessionFinishedHandler)(id data,NSError * error);

@interface ECSPHTTPSession : AFHTTPSessionManager


/**
 设置域名
 @param domain 域名
 */
+ (void)setGlobalDefaultDomain:(NSString *)domain;


/**
 获取域名
 @return 返回域名
 */
+ (NSString *)domain;


/**
 通过URL初始化ECSPHTTPSession
 @param url url
 @return ECSPHTTPSession对象
 */
- (id)initWithBaseURL:(NSURL *)url;


/**
 Get方法
 @param url 路由地址
 @param parameters 参数
 @param success 成功block
 @param failure 失败block
 @return 返回task
 */
- (NSURLSessionDataTask *)get:(NSString *)url
                   parameters:(id)parameters
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;


/**
 Get方法
 @param url 路由地址
 @param parameters 参数
 @param success 成功block
 @param failure 失败block
 @return 返回task
 */
- (NSURLSessionDataTask *)getWithPage:(NSString *)url
                           parameters:(id)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

/**
 Post方法
 @param url 路由地址
 @param parameters 参数
 @param success 成功block
 @param failure 失败block
 @return 返回task
 */
- (NSURLSessionDataTask *)post:(NSString *)url
                    parameters:(id)parameters
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;


/**
 Post方法2
 @param url 路由地址
 @param parameters 参数
 @param block block
 @param success 成功block
 @param failure 失败block
 @return 返回task
 */
- (NSURLSessionDataTask *)post:(NSString *)url
                    parameters:(NSDictionary *)parameters
              constructingBody:(void (^)(id <AFMultipartFormData> formData))block success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

@end
