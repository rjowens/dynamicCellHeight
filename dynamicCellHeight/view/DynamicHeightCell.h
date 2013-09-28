//
//  DynamicHeightCell.h
//  dynamicCellHeight
//
//  Created by Richard Owens on 8/27/13.
//  Copyright (c) 2013 Richard Owens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicHeightCell : UITableViewCell

- (CGFloat) dynamicHeight;

@property (nonatomic, strong) UITextView *textView;

@end
