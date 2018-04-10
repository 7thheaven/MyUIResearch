//
//  URTableViewCell.h
//  UIResearch
//
//  Created by July on 2018/4/4.
//  Copyright © 2018年 July. All rights reserved.
//

#import <UIKit/UIKit.h>

#define URTableViewCellSpace 12
#define URTableViewCellHeight 191

@interface URTableViewCell : UITableViewCell

@property (nonatomic, assign) BOOL hasBottomSpace;

- (void)refreshWithDic:(NSDictionary *)dic;

@end
