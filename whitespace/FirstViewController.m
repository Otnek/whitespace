//
//  FirstViewController.m
//  whitespace
//
//  Created by 竹嶋健人 on 2014/06/05.
//  Copyright (c) 2014年 竹嶋健人. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]
        initWithTitle:@"戻る"
        style:UIBarButtonItemStyleBordered
        target:nil
        action:nil];
    
    self.navigationItem.backBarButtonItem = backBtn;
    
}


- (IBAction)performAddBtn:(id)sender {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
