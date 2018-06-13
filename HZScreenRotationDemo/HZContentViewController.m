//
//  HZContentViewController.m
//  HZScreenRotationDemo
//
//  Created by 季怀斌 on 2018/6/13.
//  Copyright © 2018 季怀斌. All rights reserved.
//

#import "HZContentViewController.h"

@interface HZContentViewController ()

@end

@implementation HZContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"content";
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"竖屏" forState:UIControlStateNormal];
    [btn2 sizeToFit];
    btn2.center = self.view.center;
    [btn2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    basicAnimation.fromValue = @(-M_PI_4);
    basicAnimation.toValue = @(0);
    basicAnimation.removedOnCompletion = YES;
    basicAnimation.fillMode = kCAFillModeForwards;
    [self.view.layer addAnimation:basicAnimation forKey:nil];
}

#pragma mark ------------- 横竖屏设置
- (BOOL)shouldAutorotate {
    return true;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    NSLog(@"----qqqq----:%ld", self.landScapeInterface);
    return self.landScapeInterface;
}

- (void)setLandScapeInterface:(UIInterfaceOrientation)landScapeInterface {
    _landScapeInterface = landScapeInterface;
}

#pragma mark ------------- btn2Click
- (void)btn2Click:(UIButton *)btn2 {
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentViewCtrDismiss)]) {
        [self.delegate contentViewCtrDismiss];
    }
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
