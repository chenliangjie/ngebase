//
//  TestModule.m
//  ecsp
//
//  Created by chenliangjie on 16/8/11.
//  Copyright © 2016年 hong7. All rights reserved.
//

#import "TestModule.h"
#import "RoutableTestViewController.h"

@implementation TestModule

+ (BOOL)didRegisterForModuleWithOption:(NSDictionary *)options
{
    [[Routable sharedRouter] map:Module_TEST_URL toCallback:^(NSDictionary *params) {
        
        NSDictionary *extraParams = [params objectForKey:EXTRAPARAMS];
        if([[params objectForKey:@"actionType"] isEqualToString:@"0"])
        {
            RoutableTestViewController *controller = [[RoutableTestViewController alloc] init];
            [extraParams objectForKey:@"ID"];
            controller.doneCallback = [params objectForKey:CALLBACK];
            [[Routable sharedRouter] pushViewController:controller];
        }
    }];
    
    return YES;
}

@end
