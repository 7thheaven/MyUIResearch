//
//  URUtils.m
//  UIResearch
//
//  Created by July on 2018/4/8.
//  Copyright © 2018年 July. All rights reserved.
//

#import "URUtils.h"

@implementation UIColor (SSEXT)

+ (UIColor *)colorWithInt:(NSInteger)rgb alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) / 255.0f
                           green:((rgb & 0xFF00) >> 8) / 255.0f
                            blue:((rgb & 0xFF)) / 255.0f
                           alpha:alpha];
}

@end

@implementation UIView (SSEXT)

- (CGFloat)rightPoint
{
    return self.frame.origin.x + SELFWIDTH;
}

- (CGFloat)bottomPoint
{
    return self.frame.origin.y + SELFHEIGHT;
}

@end

@implementation NSDictionary (SSEXT)

- (NSString *)stringOrEmptyStringForKey:(NSString *)key
{
    return [self stringForKey:key defaultValue:@""];
}

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultV
{
    NSString *res = [self objectForKey:key];
    if (res && [res isKindOfClass:[NSString class]]) {
        return res;
    }
    return defaultV;
}

@end

@implementation NSMutableDictionary (SSEXT)

- (NSString *)stringOrEmptyStringForKey:(NSString *)key
{
    return [self stringForKey:key defaultValue:@""];
}

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultV
{
    NSString *res = [self objectForKey:key];
    if (res && [res isKindOfClass:[NSString class]]) {
        return res;
    }
    return defaultV;
}

@end
