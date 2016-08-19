//
//  WQTableVC.m
//  SideslipMenu
//
//  Created by admin on 16/8/19.
//  Copyright © 2016年 SUWQ. All rights reserved.
//

#import "WQTableVC.h"
#import "ViewController.h"
#import "UIView+Menu.h"

@interface WQTableVC ()

@end

@implementation WQTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"左菜单";
            break;
        case 1:
            cell.textLabel.text = @"右菜单";
            break;
        case 2:
            cell.textLabel.text = @"上菜单";
            break;
        default:
            cell.textLabel.text = @"下菜单";
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"Show"
                                      sender:[NSNumber numberWithInt:Left]];
            break;
        case 1:
            [self performSegueWithIdentifier:@"Show"
                                      sender:[NSNumber numberWithInt:Right]];
            break;
        case 2:
            [self performSegueWithIdentifier:@"Show"
                                      sender:[NSNumber numberWithInt:Top]];
            break;
        default:
            [self performSegueWithIdentifier:@"Show"
                                      sender:[NSNumber numberWithInt:Buttom]];
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Show"]) {
        ViewController *vc = [segue destinationViewController];
        vc.location = [(NSNumber *)sender intValue];
        switch (vc.location) {
            case 0:
                vc.title = @"左菜单";
                break;
            case 1:
                vc.title = @"右菜单";
                break;
            case 2:
                vc.title = @"上菜单";
                break;
            default:
                vc.title = @"下菜单";
                break;
        }
    }
}

@end









