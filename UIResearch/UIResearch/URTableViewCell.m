//
//  URTableViewCell.m
//  UIResearch
//
//  Created by July on 2018/4/4.
//  Copyright © 2018年 July. All rights reserved.
//

#import "URTableViewCell.h"
#import "URUtils.h"
#import <QuartzCore/QuartzCore.h>

@interface URTableViewCell ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *desc;
@property (nonatomic, strong) UIView *splitLine;
@property (nonatomic, strong) UILabel *actionLabel;
@property (nonatomic, strong) UIView *bottomSpace;

@end

@implementation URTableViewCell

- (UIImageView *)headImage
{
    if (!_headImage) {
        _headImage = [UIImageView new];
        _headImage.layer.cornerRadius = 4;
        _headImage.contentMode = UIViewContentModeScaleAspectFill;
        _headImage.clipsToBounds = YES;
        [self addSubview:_headImage];
    }
    return _headImage;
}

- (UILabel *)name
{
    if (!_name) {
        _name = [UILabel new];
        _name.font = [UIFont fontWithName:@"Helvetica" size:14.0f];
        _name.numberOfLines = 1;
        _name.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_name];
    }
    return _name;
}

- (UILabel *)time
{
    if (!_time) {
        _time = [UILabel new];
        _time.font = [UIFont fontWithName:@"Helvetica" size:13.0f];
        _time.numberOfLines = 1;
        _time.textColor = [UIColor colorWithInt:0xA4A9B0 alpha:1];
        _time.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_time];
    }
    return _time;
}

- (UIImageView *)icon
{
    if (!_icon) {
        _icon = [UIImageView new];
        _icon.contentMode = UIViewContentModeScaleAspectFill;
        _icon.clipsToBounds = YES;
        [self addSubview:_icon];
    }
    return _icon;
}

- (UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        _title.font = [UIFont fontWithName:@"Helvetica" size:15.0f];
        _title.numberOfLines = 2;
        _title.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_title];
    }
    return _title;
}

- (UILabel *)desc
{
    if (!_desc) {
        _desc = [UILabel new];
        _desc.font = [UIFont fontWithName:@"Helvetica" size:13.0f];
        _desc.numberOfLines = 1;
        _desc.textColor = [UIColor colorWithInt:0xA4A9B0 alpha:1];
        _desc.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_desc];
    }
    return _desc;
}

- (UIView *)splitLine
{
    if (!_splitLine) {
        _splitLine = [UIView new];
        _splitLine.backgroundColor = [UIColor colorWithInt:0xE9E9E9 alpha:1];
        [self addSubview:_splitLine];
    }
    return _splitLine;
}

- (UILabel *)actionLabel
{
    if (!_actionLabel) {
        _actionLabel = [UILabel new];
        _actionLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0f];
        _actionLabel.textColor = [UIColor colorWithInt:0x108EE9 alpha:1];
        _actionLabel.numberOfLines = 1;
        _actionLabel.textAlignment = NSTextAlignmentCenter;
        _actionLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_actionLabel];
    }
    return _actionLabel;
}

- (UIView *)bottomSpace
{
    if (!_bottomSpace) {
        _bottomSpace = [UIView new];
        _bottomSpace.backgroundColor = [UIColor colorWithInt:0xEBF0EE alpha:1];
        [self addSubview:_bottomSpace];
    }
    return _bottomSpace;
}

- (void)setHasBottomSpace:(BOOL)hasBottomSpace
{
    _hasBottomSpace = hasBottomSpace;
    self.bottomSpace.hidden = !hasBottomSpace;
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self refreshWithDic:dic];
    }
    return self;
}

- (void)refreshWithDic:(NSDictionary *)dic
{
    self.headImage.image = [UIImage imageNamed:[dic stringOrEmptyStringForKey:@"headImage"]];
    self.name.text = [dic stringOrEmptyStringForKey:@"name"];
    self.time.text = [dic stringOrEmptyStringForKey:@"time"];
    self.icon.image = [UIImage imageNamed:[dic stringOrEmptyStringForKey:@"icon"]];
    self.title.text = [dic stringOrEmptyStringForKey:@"title"];
    self.desc.text = [dic stringOrEmptyStringForKey:@"desc"];
    self.actionLabel.text = [dic stringOrEmptyStringForKey:@"actionText"];
}

- (void)layoutSubviews
{
    CGFloat space = URTableViewCellSpace;
    self.headImage.frame = CGRectMake(URTableViewCellSpace, URTableViewCellSpace, 30, 30);
    self.name.frame = CGRectMake(self.headImage.rightPoint + 7, space, SELFWIDTH - self.headImage.rightPoint - 7 - space, 16);
    self.time.frame = CGRectMake(self.name.frame.origin.x, self.name.bottomPoint, self.name.frame.size.width, 15);
    self.icon.frame = CGRectMake(space, self.headImage.bottomPoint + space, 80, 80);
    self.title.frame = CGRectMake(self.icon.rightPoint + space, self.icon.frame.origin.y, SELFWIDTH - self.icon.rightPoint - 2 * space, 36);
    self.desc.frame = CGRectMake(self.title.frame.origin.x, self.title.bottomPoint + space, self.title.frame.size.width, 18);
    self.splitLine.frame = CGRectMake(space, self.icon.bottomPoint + space, SELFWIDTH - 2 * space, 1);//1.0f/[UIScreen mainScreen].scale
    self.actionLabel.frame = CGRectMake(space, self.splitLine.bottomPoint + space, SELFWIDTH - 2 * space, 20);
    self.bottomSpace.frame = CGRectMake(0, SELFHEIGHT - space, SELFWIDTH, space);
}

@end
