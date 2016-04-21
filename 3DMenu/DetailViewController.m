//
//  DetailViewController.m
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/7.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import "DetailViewController.h"
#import "UIColor+ZMColor.h"
#import "MenuItem.h"
#import "ContainerViewController.h"
@interface DetailViewController ()
{
    
}

@end

@implementation DetailViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuItemAction:)];
    _item = [[MenuItem alloc] initWithFrame:CGRectMake(0, 0, 16, 16)];
    [_item addGestureRecognizer:tap];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_item];
}

-(void)setMenuDict:(NSDictionary *)menuDict
{
    if (_menuDict != menuDict)
    {
        _menuDict = menuDict;
        NSArray * colors = _menuDict[@"colors"];
        UIColor * color = [UIColor colorWithRGBColors:colors];
        self.view.backgroundColor = color;
        self.imageView.image = [UIImage imageNamed:_menuDict[@"image"]];
    }
}

-(void)menuItemAction:(MenuItem *) sender
{
    UINavigationController * nav = self.navigationController;
    ContainerViewController * cvc = (ContainerViewController *)nav.parentViewController;
    [cvc hideOrShowMenu:!cvc.showMenu animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
