//
//  NWTestModule.m
//  BaseProject
//
//  Created by chenliangjie on 2016/11/21.
//  Copyright © 2016年 chenliangjie. All rights reserved.
//

#import "NWTestModule.h"
#import "NWTestViewController.h"

@implementation NWTestModule

+ (BOOL)didRegisterForModuleWithOption:(NSDictionary *)options
{
    [[Routable sharedRouter] map:Module_NETWORK_URL toCallback:^(NSDictionary *params) {
        
        if([[params objectForKey:@"actionType"] isEqualToString:@"0"])
        {
            NWTestViewController *controller = [[NWTestViewController alloc] init];
            [[Routable sharedRouter] pushViewController:controller];
        }
    }];
    
    return YES;
}

@end
