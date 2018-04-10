//
//  URUtils.h
//  UIResearch
//
//  Created by July on 2018/4/8.
//  Copyright © 2018年 July. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SELFWIDTH self.frame.size.width
#define SELFHEIGHT self.frame.size.height

@interface UIColor (SSEXT)

+ (UIColor *)colorWithInt:(NSInteger)rgb alpha:(CGFloat)alpha;

@end

@interface UIView (SSEXT)

- (CGFloat)rightPoint;
- (CGFloat)bottomPoint;

@end

@interface NSDictionary (SSEXT)

- (NSString *)stringOrEmptyStringForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultV;

@end

@interface NSMutableDictionary (SSEXT)

- (NSString *)stringOrEmptyStringForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultV;

@end
