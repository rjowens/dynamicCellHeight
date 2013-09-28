//
//  MainViewController.h
//  dynamicCellHeight
//
//  Created by Richard Owens on 8/27/13.
//  Copyright (c) 2013 Richard Owens. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicHeightCell.h"
#import "Story.h"

@interface MainViewController : UITableViewController

@property (nonatomic, strong) NSArray *stories;
@property (nonatomic, strong) UITableView *tableView;

@end
