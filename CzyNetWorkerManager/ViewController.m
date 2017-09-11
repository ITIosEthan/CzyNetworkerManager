//
//  ViewController.m
//  CzyNetWorkerManager
//
//  Created by macOfEthan on 17/9/11.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#ifndef apiUrl
#define apiUrl @"http://guangdiu.com/api/getranklist.php"
#endif

#import "ViewController.h"
#import "CzyNetworkManager.h"
#import <YYModel/YYModel.h>
#import "Goods.h"
#import "CzyTableView.h"
#import <SlimeRefresh/SRRefreshView.h>

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, SRRefreshDelegate>
@property (nonatomic, strong) Goods *goods;
@property (nonatomic, strong) CzyTableView *tableView;
@property (nonatomic, strong) SRRefreshView *refreshView;
@end

@implementation ViewController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self czyTableViewInit];
    
    [self fetchDataes];
}

#pragma mark - tableView
- (void)czyTableViewInit
{
    if (self.tableView != nil) {
        return;
    }
    
    _tableView = [[CzyTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
}

#pragma mark - slimeRefresh
- (void)czyRefreshView
{
    if (self.refreshView != nil) {
        return;
    }
    
    self.refreshView = [[SRRefreshView alloc] init];
    self.refreshView.delegate = self;
    self.refreshView.slime.bodyColor = [UIColor lightGrayColor];
    self.refreshView.slime.skinColor = [UIColor lightGrayColor];
    self.refreshView.slimeMissWhenGoingBack = YES;
    self.refreshView.slime.lineWith = 1;
    [self.tableView addSubview:self.refreshView];
    
    self.tableView.contentInset = UIEdgeInsetsZero;
}

#pragma mark - fetchDataes
- (void)fetchDataes
{
    [[CzyNetworkManager shareManager] loadDataWithMethod:CzyLoadTypePost andLoadUrl:apiUrl andLoadPara:nil andSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self endLoading];
        
        _goods = [Goods yy_modelWithJSON:responseObject];
        
        [self.tableView reloadData];
        
    } andFailure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self endLoading];
    }];
}

#pragma mark - endLoading
- (void)endLoading
{
    self.tableView.loading = NO;
    [self.refreshView endRefresh];
    [self czyRefreshView];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _goods.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reusedId = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedId];
    }
    
    cell.textLabel.text = _goods.data[indexPath.row].title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - <SRRefreshDelegate>
- (void)slimeRefreshStartRefresh:(SRRefreshView *)refreshView
{
    [self performSelector:@selector(fetchDataes) withObject:nil afterDelay:3];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.refreshView scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.refreshView scrollViewDidEndDraging];
}


@end
