//
//  ViewController.m
//  Example
//
//  Created by chenliangjie on 2017/12/28.
//  Copyright © 2017年 nge. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableList;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Base";
    
    [self initTestTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)initTestTableView
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    NSArray *testList = [NSArray arrayWithObjects:@"Routable跳转模块测试",@"网络模块测试", nil];
    [self.tableList addObjectsFromArray:testList];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"testCell"];
    cell.textLabel.text = [self.tableList objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 0)  // 测试QCRoutable跳转
    {
        [self testRoutableFunction];
    }
    else if(indexPath.row == 1) // 网络模块测试
    {
        [self testNetworkFunction];
    }
}

#pragma mark - Routable跳转测试

- (void)testRoutableFunction {
    __weak __typeof(&*self) weakSelf = self;
    void(^callBack)(NSDictionary *info) = ^(NSDictionary *info) {
        [weakSelf callbackActon:info];
    };
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"test",@"ID",nil];
    [[Routable sharedRouter] open:[NSString stringWithFormat:@"%@/0",[[Routable sharedRouter] prasePrefixURL:Module_TEST_URL]] withParams:dict callback:callBack];
}

- (void)callbackActon:(NSDictionary *)info {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Callback结果返回"
                                                        message:[info objectForKey:@"authResult"]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - 网络模块测试

- (void)testNetworkFunction {
    [[Routable sharedRouter] open:[NSString stringWithFormat:@"%@/0",[[Routable sharedRouter] prasePrefixURL:Module_NETWORK_URL]]];
}

#pragma mark - properties

- (NSMutableArray *)tableList {
    if(!_tableList) {
        _tableList = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    return _tableList;
}

@end
