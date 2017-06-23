//
//  AppDelegate.h
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
