//
//  MainViewController.m
//  dynamicCellHeight
//
//  Created by Richard Owens on 8/27/13.
//  Copyright (c) 2013 Richard Owens. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) DynamicHeightCell *cellSizes;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[DynamicHeightCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.stories count];
}

- (void)populateCell:(DynamicHeightCell*)cell atIndex:(NSIndexPath *)indexPath {
    Story *story = self.stories[indexPath.row];
    cell.textView.text = story.title;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.cellSizes) {
        self.cellSizes = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    [self populateCell:self.cellSizes atIndex:indexPath];
    [self.cellSizes updateConstraintsIfNeeded];
    return [self.cellSizes dynamicHeight];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicHeightCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [self populateCell:cell atIndex:indexPath];
    return cell;
}


@end
