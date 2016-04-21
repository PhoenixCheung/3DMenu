//
//  ContainerViewController.h
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/7.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ContainerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *menuContainerView;
@property (strong, nonatomic) DetailViewController * detailViewController;
@property (strong, nonatomic) NSDictionary * menuDict;

@property (assign, nonatomic)BOOL showMenu;

-(void)hideOrShowMenu:(BOOL) show animated:(BOOL) animated;

@end
