//
//  ViewController.m
//  HZScreenRotationDemo
//
//  Created by 季怀斌 on 2018/6/13.
//  Copyright © 2018 季怀斌. All rights reserved.
//

#import "HZHomeViewController.h"
#import "HZContentViewController.h"
@interface HZHomeViewController () <HZContentViewControllerDelegate>
@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) HZContentViewController *contentVCtr;
@end

@implementation HZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"home";
    //
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    self.testView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.testView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"横屏" forState:UIControlStateNormal];
    [btn sizeToFit];
    btn.center = self.testView.center;
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.testView addSubview:btn];
    
//    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    //
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

#pragma mark ------------- 横竖屏设置
- (BOOL)shouldAutorotate {
    return true;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

#pragma mark ------------- 转屏
- (void)presentVCtrWithLandScapeInterface:(UIInterfaceOrientation)landScapeInterface {
    if (!self.contentVCtr) {
        self.contentVCtr = [HZContentViewController new];
        self.contentVCtr.delegate = self;
        self.contentVCtr.landScapeInterface = landScapeInterface;
        [self presentViewController:self.contentVCtr animated:false completion:nil];
    }
}
    

#pragma mark ------------- 竖屏
- (void)dismissContentVCtr {
    
    if (self.contentVCtr) {
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        basicAnimation.fromValue = @(M_PI_4);
        if (self.contentVCtr.landScapeInterface == UIInterfaceOrientationLandscapeLeft) {
            basicAnimation.fromValue = @(-M_PI_4);
        }
        basicAnimation.toValue = @(0);
        basicAnimation.removedOnCompletion = NO;
        basicAnimation.fillMode = kCAFillModeForwards;
        [self.testView.layer addAnimation:basicAnimation forKey:nil];
        
        [self dismissViewControllerAnimated:NO completion:nil];
        self.contentVCtr = nil;
    }
    
}

#pragma mark ------------- btnClick
- (void)btnClick:(UIButton *)btn {
    [self presentVCtrWithLandScapeInterface:UIInterfaceOrientationLandscapeRight];
}

#pragma mark ------------- HZContentViewControllerDelegate
- (void)contentViewCtrDismiss {
    [self dismissContentVCtr];
}


#pragma mark ------------- deviceOrientationDidChange
- (void)deviceOrientationDidChange {
    UIDeviceOrientation landScapeinterface = [UIDevice currentDevice].orientation;
    
    if (landScapeinterface == UIDeviceOrientationLandscapeLeft) {
        [self presentVCtrWithLandScapeInterface:UIInterfaceOrientationLandscapeRight];
    } else if (landScapeinterface == UIDeviceOrientationPortrait) {
        [self dismissContentVCtr];
    } else if (landScapeinterface == UIDeviceOrientationLandscapeRight) {
        [self presentVCtrWithLandScapeInterface:UIInterfaceOrientationLandscapeLeft];
    } 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
