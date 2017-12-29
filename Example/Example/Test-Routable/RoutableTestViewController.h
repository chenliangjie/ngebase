//
//  RoutableTestViewController.h
//  BaseProject
//
//  Created by chenliangjie on 2016/11/15.
//  Copyright © 2016年 chenliangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CallbackBlock)(NSDictionary *info);

@interface RoutableTestViewController : UIViewController

@property (nonatomic, copy) CallbackBlock doneCallback;

@end
