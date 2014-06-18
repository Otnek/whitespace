//
//  Errand.h
//  whitespace
//
//  Created by 竹嶋健人 on 2014/06/18.
//  Copyright (c) 2014年 竹嶋健人. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Errand : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * week;
@property (nonatomic, retain) NSString * starttime;
@property (nonatomic, retain) NSString * finishtime;

@end
