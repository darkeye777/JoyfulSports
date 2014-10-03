//
//  YDRecordViewController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-25.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDRecordViewController.h"
#import "YDNoRecordView.h"

@interface YDRecordViewController ()

@end

@implementation YDRecordViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    YDNoRecordView *noRecordView = [[YDNoRecordView alloc] init];
    noRecordView.frame = self.view.bounds;
    noRecordView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:noRecordView];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 0;
}

@end
