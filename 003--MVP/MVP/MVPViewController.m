//
//  MVPViewController.m
//  MVPDemo
//
//  Created by Cooci on 2018/3/31.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "MVPViewController.h"
#import "LMDataSource.h"
#import "MVPTableViewCell.h"
#import "Model.h"
#import <YYKit.h>
#import "Present.h"


static NSString *const reuserId = @"reuserId";

@interface MVPViewController ()<PresentProtocol>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) Present *pt;
@property (nonatomic, strong) LMDataSource *dataSource;
@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view = self.KCView;
    self.view.backgroundColor = [UIColor whiteColor];
    self.pt = [[Present alloc] init];
    __weak  typeof(self) weakSelf = self;
    self.dataSource = [[LMDataSource alloc]initWithIdentifier:reuserId configureBlock:^(MVPTableViewCell *cell, Model *model, NSIndexPath *indexPath) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        cell.numLabel.text = model.num;
        cell.nameLabel.text = model.name;
        cell.delegate = strongSelf.pt;
        cell.indexPath = indexPath;
    }];
    
    [self.dataSource addDataArray:self.pt.dataArray];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.pt.delegate = self;
//  self.tableView.delegate = self;
    
}

#pragma mark -PrsentProtocol
-(void)reloadUI {
    [self.dataSource addDataArray:self.pt.dataArray];
    [self.tableView reloadData];
}

//#pragma mark - tableViewDataSource
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//
//    return self.dataArray.count;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    MVPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserId forIndexPath:indexPath];
//
//    if (!cell) {
//
//        cell = [(MVPTableViewCell *)[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserId];
//    }
//    return cell;
//}


//#pragma mark - tableViewDelegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}
//

//#pragma mark - lazy
//
//- (NSMutableArray *)dataArray{
//
//    if (!_dataArray) {
//        _dataArray = [NSMutableArray arrayWithCapacity:10];
//    }
//    return _dataArray;
//}

- (UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor whiteColor];
        
        [_tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:reuserId];
    }
    return _tableView;
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

@end
