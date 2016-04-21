//
//  MenuItem.m
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/7.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem
{
    UIImageView * imageView ;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.contentMode = UIViewContentModeCenter;
        imageView.image = [UIImage imageNamed:@"5"];
        [self addSubview:imageView];
    }
    return self;
}

-(void)rotateWithFraction:(CGFloat) fraction
{
    CGFloat angle = fraction * M_PI_2;
    imageView.transform = CGAffineTransformMakeRotation(angle);
}

@end
