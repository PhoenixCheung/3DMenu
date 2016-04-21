//
//  ContainerViewController.m
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/7.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()<UIScrollViewDelegate>
{
    
    __weak IBOutlet UIScrollView *_backgroundScrollView;
}

@end

@implementation ContainerViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"ContainerViewController";
    
    _showMenu = NO;

}

-(void)setMenuDict:(NSDictionary *)menuDict
{
    if (_menuDict != menuDict)
    {
        [self hideOrShowMenu:NO animated:YES];
        _menuDict = menuDict;
        self.detailViewController.menuDict = menuDict;
        
    }
}

-(void)getMenuDic:(NSNotification *) notification
{
    if (notification.object)
    {
        NSDictionary * menuDict = notification.object;
        _menuDict = menuDict;
        _detailViewController.menuDict = menuDict;
    }
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _menuContainerView.layer.anchorPoint = CGPointMake(1.0, 0.5);
    [self hideOrShowMenu:_showMenu animated:YES];
}

-(void)hideOrShowMenu:(BOOL) show animated:(BOOL) animated
{
    CGFloat offSetX = CGRectGetWidth(_menuContainerView.bounds);
    [_backgroundScrollView setContentOffset:show ? CGPointZero : CGPointMake(offSetX, 0)  animated:animated];
    _showMenu = show;
}

#pragma mark - UIScrollView delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat multiplier = 1.0 / CGRectGetWidth(_menuContainerView.bounds);
    CGFloat offSet = scrollView.contentOffset.x * multiplier;
    CGFloat fraction = 1.0 - offSet;
    _menuContainerView.layer.transform = [self transformWithFraction:fraction];
    _menuContainerView.alpha = fraction;
    
    [self.detailViewController.item rotateWithFraction:fraction];
    
    scrollView.pagingEnabled = scrollView.contentOffset.x < (scrollView.contentSize.width - CGRectGetWidth(scrollView.bounds));
    
    CGFloat menuOffSet = CGRectGetWidth(_menuContainerView.bounds);
    _showMenu = !CGPointEqualToPoint(CGPointMake(menuOffSet, 0), scrollView.contentOffset);
}

#pragma mark - Transform of fraction

-(CATransform3D)transformWithFraction:(CGFloat) fraction
{
    CATransform3D identity = CATransform3DIdentity;
    identity.m34 = -1 / 1000;
    CGFloat angle = (1.0 - fraction) * -M_PI_2;
    CGFloat offSet = CGRectGetWidth(_menuContainerView.bounds) * 0.5;
    CATransform3D rotateTransform = CATransform3DRotate(identity, angle, 0.0, 1.0, 0.0);
    CATransform3D translateTransform = CATransform3DMakeTranslation(offSet, 0.0, 0.0);
    return CATransform3DConcat(rotateTransform, translateTransform);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailSegue"])
    {
        UINavigationController * nav = segue.destinationViewController;
        _detailViewController = nav.topViewController;
    }
}


@end
