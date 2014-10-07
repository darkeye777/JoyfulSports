//
//  YDRecordViewController.m
//  JoyfulSports
//
//  Created by Tzhan on 14-9-25.
//  Copyright (c) 2014年 Banana. All rights reserved.
//

#import "YDRecordViewController.h"
#import "YDNoRecordView.h"
#import "YDUser.h"
#import "YDBMIView.h"

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
    
    NSData *userData = [[NSUserDefaults standardUserDefaults] objectForKey:@"user"];
    YDUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
    
    YDBMIView *bmiView = [[YDBMIView alloc] init];
    bmiView.user = user;
    bmiView.frame = CGRectMake(0, 0, 320, 200);
    self.tableView.tableHeaderView = bmiView;
    
//    YDLog(@"%@, %@, %@, %@", user.username, user.age, user.stature, user.weight);
    
//    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//    NSString *sqlFilePath = [path stringByAppendingPathComponent:@"sports.sqlite"];
//    
//    YDLog(@"sqlFilePath: %@", sqlFilePath);
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
