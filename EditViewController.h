//
//  ViewController.h
//  whitespace
//
//  Created by 竹嶋健人 on 2014/06/06.
//  Copyright (c) 2014年 竹嶋健人. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Errand;

@interface EditViewController : UIViewController
@property(strong, nonatomic) Errand *errand;
@property(strong, nonatomic) NSManagedObjectContext *managedContext;
@end
