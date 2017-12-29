//
//  ECSPResponseSerializer.m
//  bjd
//
//  Created by hong7 on 15/10/19.
//  Copyright © 2015年 hong7. All rights reserved.
//

#import "ECSPResponseSerializer.h"
#import "AFHTTPSessionManager.h"
#import "NSDictionary+ECSPNetwork.h"

@implementation ECSPResponseSerializer

#pragma mark - AFURLResponseSerialization

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    
    NSHTTPURLResponse * res = (NSHTTPURLResponse *)response;
    NSLog(@"res == %@",res);

#ifdef DEBUG
    if (res.statusCode != 200) {
        NSString * content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"content == %@",content);
    }
#endif
    id responseObject = [super responseObjectForResponse:response data:data error:error];
    
#ifdef DEBUG
    NSLog(@"response ===%@",responseObject);
#endif
    
    if (*error == nil) {
        NSDictionary * header = [responseObject networkSafeObjectForKey:@"header"];
        NSString * code = [header networkSafeObjectForKey:@"retCode"];
        if (code && ![code isEqualToString:@"000000"]) {
            NSString * msg = [header networkSafeObjectForKey:@"retMsg"];
            NSLog(@"response error message:%@",msg);
            *error = [NSError errorWithDomain:@"com.digitalchina.ecsp.network.api.error" code:[code intValue] userInfo:@{@"message":msg}];
            return nil;
        }
        NSString *busiCode = [header networkSafeObjectForKey:@"busiCode"];
        if(!busiCode || busiCode.length == 0)
        {
            return [self responsedObject:[responseObject networkSafeObjectForKey:@"body"] withPageInfo:header];
        }
        
        return [self responsedObject:[[responseObject networkSafeObjectForKey:@"body"] networkSafeObjectForKey:busiCode] withPageInfo:header];
    }
    return responseObject;
}

- (NSDictionary *)pageInfo:(NSDictionary *)dict {
    NSMutableDictionary *info = [NSMutableDictionary new];
    NSNumber *page = [dict networkSafeObjectForKey:@"page"];
    NSNumber *pageSize = [dict networkSafeObjectForKey:@"pageSize"];
    NSNumber *totalNum = [dict networkSafeObjectForKey:@"totalNum"];
    NSNumber *totalPage = [dict networkSafeObjectForKey:@"totalPage"];
    if(page && pageSize && totalNum && totalPage) {
        [info setObject:page forKey:@"page"];
        [info setObject:pageSize forKey:@"pageSize"];
        [info setObject:totalNum forKey:@"totalNum"];
        [info setObject:totalPage forKey:@"totalPage"];
        return info;
    }
    
    return nil;
}

- (NSDictionary *)responsedObject:(id)bodyData withPageInfo:(NSDictionary *)headerDict {
    NSMutableDictionary *resObject = [NSMutableDictionary new];
    if(bodyData) {
        [resObject setObject:bodyData forKey:@"ecsp_body"];
    }
    
    id ecsp_header = [self pageInfo:headerDict];
    if(ecsp_header) {
        [resObject setObject:ecsp_header forKey:@"ecsp_header"];
    }
    return resObject;
}

@end
