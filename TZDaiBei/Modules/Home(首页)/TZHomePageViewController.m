//
//  TZHomePageViewController.m
//  TZDaiBei
//
//  Created by TianZe on 2019/11/20.
//  Copyright © 2019 天泽集团. All rights reserved.
//

#import "TZHomePageViewController.h"
#import "TZLoginVC.h"
@interface TZHomePageViewController ()

@end

@implementation TZHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 60, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(tapClik) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}
- (void)tapClik{
    TZLoginVC *vc = [TZLoginVC new];
    vc.title = @"登陆";
    [self.navigationController pushViewController:vc animated:YES];
    
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
