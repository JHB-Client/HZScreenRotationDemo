//
//  ViewController.m
//  HZScreenRotationDemo
//
//  Created by 季怀斌 on 2018/6/13.
//  Copyright © 2018 季怀斌. All rights reserved.
//

#import "HZRootViewController.h"
#import "HZHomeViewController.h"
@implementation HZRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"RootVCtr";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"RootVCtr" forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.center = self.view.center;
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)btnClick:(UIButton *)btn {
    HZHomeViewController *homeVCtr = [HZHomeViewController new];
    [self.navigationController pushViewController:homeVCtr animated:true];
}
@end
