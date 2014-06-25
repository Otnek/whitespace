//
//  ErrandCell.m
//  whitespace
//
//  Created by 竹嶋健人 on 2014/06/18.
//  Copyright (c) 2014年 竹嶋健人. All rights reserved.
//

#import "ErrandCell.h"
#import "Errand.h"



@implementation ErrandCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setErrand:(Errand *)errand
{
    _errand = errand;
    
    self.textLabel.text = [NSString stringWithFormat:@"%@ %@ ~ %@", errand.category, errand.starttime, errand.finishtime];
}

@end
