//
//  NWTestClient.h
//  BaseProject
//
//  Created by chenliangjie on 2016/11/21.
//  Copyright © 2016年 chenliangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NWTestClient : ECSPHTTPSession

+ (NWTestClient *)sharedClient;

-(void)mobileDynamicBytypeOrParkCode:(NSString *)ID
                         lastestTime:(NSDate *)time
                         forwordFlag:(BOOL)forWordFlag
                              isPark:(BOOL)isPark
                            finished:(ECSPHTTPSessionFinishedHandler)handler;

@end
