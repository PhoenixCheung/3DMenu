//
//  MenuCell.h
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/7.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *menuImageView;

-(void)configureWithDic:(NSDictionary *) dict;


@end
