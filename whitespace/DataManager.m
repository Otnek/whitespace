//
//  DataManager.m
//  whitespace
//
//  Created by 竹嶋健人 on 2014/06/18.
//  Copyright (c) 2014年 竹嶋健人. All rights reserved.
//

#import "DataManager.h"

@interface DataManager()
@property (readwrite, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readwrite, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readwrite, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end


@implementation DataManager

+ (instancetype)shareManager
{
    static id manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

- (NSManagedObjectContext *)managedObjectContext
{
       return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    return _managedObjectModel;
}


@end
