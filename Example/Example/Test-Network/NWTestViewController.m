//
//  NWTestViewController.m
//  BaseProject
//
//  Created by chenliangjie on 2016/11/21.
//  Copyright © 2016年 chenliangjie. All rights reserved.
//

#import "NWTestViewController.h"
#import "NWTestClient.h"

@interface NWTestViewController ()
{
    UITextView *contentView;
}
@end

@implementation NWTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"网络模块测试";

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitle:@"获取数据" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(networkTest:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10.0f);
        make.left.equalTo(self.view).offset(10.0f);
        make.right.equalTo(self.view).offset(-10.0f);
        make.height.equalTo(@30);
    }];
    
    contentView = [UITextView new];
    contentView.textColor = [UIColor lightGrayColor];
    [self.view addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).offset(10);
        make.left.equalTo(button.mas_left);
        make.right.equalTo(button.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).offset(-10);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)networkTest:(id)sender
{
    [SVProgressHUD showWithStatus:@"正在获取数据..." maskType:SVProgressHUDMaskTypeClear];
    [[NWTestClient sharedClient] mobileDynamicBytypeOrParkCode:@"3" lastestTime:nil forwordFlag:YES isPark:NO finished:^(id data, NSError *error) {
        if (error)
        {
            [SVProgressHUD showAlterMessage:@"Error !!!"];
            return;
        }
        else
        {
            [SVProgressHUD dismiss];
            NSMutableString *retStr = [NSMutableString new];
            NSArray *retList = (NSArray *)data;
            for(int i = 0; i < retList.count; i++)
            {
                NSDictionary *dict = [retList objectAtIndex:i];
                NSString *title = [dict objectForKey:@"title"];
                NSString *content = [dict objectForKey:@"content"];
                if(content)
                {
                    [retStr appendString:[NSString stringWithFormat:@"标题%d：%@\r\n内容%d：%@\r\n\r\n",i,title,i,content]];
                }
            }
            
            [contentView setText:retStr];
        }
    }];
}

@end
