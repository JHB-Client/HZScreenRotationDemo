//
//  AppDelegate.h
//  HZScreenRotationDemo
//
//  Created by 季怀斌 on 2018/6/13.
//  Copyright © 2018 季怀斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

