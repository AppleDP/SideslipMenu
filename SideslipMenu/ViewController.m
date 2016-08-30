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
@property (nonatomic, weak) UIView *menuSuper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imgV.image = [UIImage imageNamed:@"dog.jpg"];
    self.imgV.userInteractionEnabled = YES;
}

- (void)viewDidAppear:(BOOL)animated{
    if (self.location == Left || self.location == Right) {
        // 当 location 为 Left 或 Right 时，设置的 menu1 的 x 无效，y 有效
        UITableView *menu1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 200, self.navigationController.view.height - 64)];
        [menu1 registerClass:[UITableViewCell class]
      forCellReuseIdentifier:@"Cell"];
        menu1.delegate = self;
        menu1.dataSource = self;
        menu1.width = 200;
        self.menuSuper = self.view;
        [self.menuSuper addMenu:menu1
                       location:self.location
                   allowGesture:YES];
    }else {
        // 当 location 为 Top 或 Buttom 时，设置的 menu2 的 y 无效，x 有效
        UITableView *menu2 = [[UITableView alloc] initWithFrame:self.navigationController.view.bounds];
        [menu2 registerClass:[UITableViewCell class]
      forCellReuseIdentifier:@"Cell"];
        menu2.delegate = self;
        menu2.dataSource = self;
        menu2.height = 100;
        if (self.location == Top) {
            self.menuSuper = self.imgV;
        }else {
            self.menuSuper = self.view;
        }
        [self.menuSuper addMenu:menu2
                       location:self.location
                   allowGesture:YES];
    }
}

-(void)dealloc{
    NSLog(@"===== dealloc =====");
}

- (IBAction)showMenu:(UIBarButtonItem *)sender {
    [self.menuSuper showWithDuration:0.3];
}

- (IBAction)hideMenu:(UIBarButtonItem *)sender {
    [self.menuSuper hideMenuDuration:0.3];
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














