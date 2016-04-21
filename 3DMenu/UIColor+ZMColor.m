//
//  UIColor+ZMColor.m
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/9.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import "UIColor+ZMColor.h"

@implementation UIColor (ZMColor)

+(UIColor *)colorWithRGBColors:(NSArray *)colors
{
    NSNumber * red = colors[0];
    NSNumber * green = colors[1];
    NSNumber * blue = colors[2];
    UIColor * color = [UIColor colorWithRed:red.floatValue / 255.0 green:green.floatValue / 255.0 blue:blue.floatValue / 255.0 alpha:1];
    return color;
}

@end
