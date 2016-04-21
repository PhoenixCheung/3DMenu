//
//  MenuCell.m
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/7.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import "MenuCell.h"
#import "UIColor+ZMColor.h"
@implementation MenuCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)configureWithDic:(NSDictionary *)dict
{
    self.menuImageView.image = [UIImage imageNamed:[dict objectForKey:@"image"]];
    NSArray * colors = [dict objectForKey:@"colors"];
    self.contentView.backgroundColor = [UIColor colorWithRGBColors:colors];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
