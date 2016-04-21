//
//  DetailViewController.h
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/7.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary * menuDict;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) MenuItem * item;

@end
