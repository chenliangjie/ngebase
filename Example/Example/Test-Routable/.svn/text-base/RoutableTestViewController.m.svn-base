//
//  RoutableTestViewController.m
//  BaseProject
//
//  Created by chenliangjie on 2016/11/15.
//  Copyright © 2016年 chenliangjie. All rights reserved.
//

#import "RoutableTestViewController.h"

@interface RoutableTestViewController ()

@end

@implementation RoutableTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"路由跳转测试";
    
    UILabel *retLabel = [UILabel new];
    retLabel.textColor = [UIColor blackColor];
    retLabel.textAlignment = NSTextAlignmentCenter;
    retLabel.text = @"Routable跳转成功";
    [self.view addSubview:retLabel];
    [retLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];

    if(self.doneCallback)
    {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"done",@"authResult", nil];
        self.doneCallback(dict);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
