//
//  AppDelegate.h
//  whitespace
//
//  Created by 竹嶋健人 on 2014/06/05.
//  Copyright (c) 2014年 竹嶋健人. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
