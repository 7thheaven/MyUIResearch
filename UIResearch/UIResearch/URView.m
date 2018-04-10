//
//  URView.m
//  UIResearch
//
//  Created by July on 2018/4/4.
//  Copyright © 2018年 July. All rights reserved.
//

#import "URView.h"
#import "URTableViewCell.h"

#define CellRUId @"UIResearch"

@interface URView () <UITableViewDataSource, UITableViewDelegate>

//UI
@property (nonatomic, strong) UITableView *tableView;
//Data
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation URView

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[URTableViewCell class] forCellReuseIdentifier:CellRUId];
        [_tableView setShowsVerticalScrollIndicator:NO];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 100; ++i) {
            [_dataArray addObject:@{@"headImage":@"test",@"name":@"用户名",@"time":@"19:22",@"icon":@"test",@"title":@"test标题",@"desc":@"test内容描述",@"actionText":@"查看详情"}];
        }
    }
    return _dataArray;
}

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}

#pragma mark table

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return [self.dataArray count];
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    //單個section不展示
//    if ([self.dataArray count] <= 1) {
//        return 0.1;
//    }
//    return 20;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0.1;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    if ([self.dataArray count] <= 1 || section < 0 || section > [self.sectionTitles count]) {
//        return [UIView new];
//    }
//    return sectionView;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.dataArray count] - 1) {
        return URTableViewCellHeight;
    }
    return URTableViewCellHeight + URTableViewCellSpace;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    URTableViewCell *view = [tableView dequeueReusableCellWithIdentifier:CellRUId];
    [view refreshWithDic:[self.dataArray objectAtIndex:indexPath.row]];
    view.hasBottomSpace = indexPath.row != [self.dataArray count] - 1;
    return view;
}

//点击Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
