//
//  DataManager.h
//  whitespace
//
//  Created by 竹嶋健人 on 2014/06/18.
//  Copyright (c) 2014年 竹嶋健人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype)shareManager;

@end
