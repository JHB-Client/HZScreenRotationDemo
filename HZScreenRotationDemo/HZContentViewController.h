//
//  HZContentViewController.h
//  HZScreenRotationDemo
//
//  Created by 季怀斌 on 2018/6/13.
//  Copyright © 2018 季怀斌. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HZContentViewControllerDelegate <NSObject>
- (void)contentViewCtrDismiss;
@end
@interface HZContentViewController : UIViewController
@property (nonatomic, assign) UIInterfaceOrientation landScapeInterface;
@property (nonatomic, weak) id<HZContentViewControllerDelegate>delegate;
@end
