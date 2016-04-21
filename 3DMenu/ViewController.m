//
//  ViewController.m
//  3DMenu
//
//  Created by 张闽·Phoenix on 15/6/6.
//  Copyright (c) 2015年 张闽. All rights reserved.
//

#import "ViewController.h"
#import "MenuCell.h"
#import "ContainerViewController.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray * _images;
    __weak IBOutlet UITableView *_tableView;
}

@end

@implementation ViewController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.clipsToBounds = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    _images = [NSArray arrayWithContentsOfFile:path];
    
    if (_images.count >0)
    {
        NSDictionary * dic = (NSDictionary *)[_images objectAtIndex:0];
        UINavigationController * nav = self.navigationController;
        ContainerViewController * cvc = (ContainerViewController *)nav.parentViewController;
        cvc.menuDict = dic;
    }
    
    [_tableView reloadData];
    
}

#pragma mark - UITableView dataSource & delegate methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _images.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configureWithDic:_images[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = _images[indexPath.row];
    UINavigationController * nav = self.navigationController;
    ContainerViewController * cvc = (ContainerViewController *)nav.parentViewController;
    
    cvc.menuDict = dic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
