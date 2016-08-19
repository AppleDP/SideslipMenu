//
//  ViewController.m
//  SideslipMenu
//
//  Created by admin on 16/8/16.
//  Copyright © 2016年 SUWQ. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FrameChange.h"
#import "UIView+Menu.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imgV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imgV.image = [UIImage imageNamed:@"dog.jpg"];
}

- (void)viewDidAppear:(BOOL)animated{
    UITableView *menu1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 200, self.view.height - 64)];
    [menu1 registerClass:[UITableViewCell class]
  forCellReuseIdentifier:@"Cell"];
    menu1.delegate = self;
    menu1.dataSource = self;
    menu1.width = 200;
    
//        UITableView *menu2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 200)];
//        [menu2 registerClass:[UITableViewCell class]
//      forCellReuseIdentifier:@"Cell"];
//        menu2.delegate = self;
//        menu2.dataSource = self;
//        menu2.height = 100;
    
    [self.view addMenu:menu1
              location:Left
          allowGesture:YES];
}

- (IBAction)showMenu:(UIBarButtonItem *)sender {
    [self.view showWithDuration:0.3];
}

- (IBAction)hideMenu:(UIBarButtonItem *)sender {
    [self.view hideMenuDuration:0.3];
}

#pragma mark UITableViewDelegate, UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"--------- %ld ---------",indexPath.row];
    return cell;
}
@end












