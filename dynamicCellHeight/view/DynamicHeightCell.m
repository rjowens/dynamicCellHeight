//
//  DynamicHeightCell.m
//  dynamicCellHeight
//
//  Created by Richard Owens on 8/27/13.
//  Copyright (c) 2013 Richard Owens. All rights reserved.
//

static int kPadding = 20;

#import "DynamicHeightCell.h"

@implementation DynamicHeightCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.textView = [[UITextView alloc] init];
        self.textView.translatesAutoresizingMaskIntoConstraints = NO;
        self.textView.contentSize = CGSizeMake(320, 200);
        self.textView.scrollEnabled = NO;
        
        [self.contentView addSubview:self.textView];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

- (CGFloat) dynamicHeight {
    return [self.textView sizeThatFits:CGSizeMake(self.contentView.bounds.size.width - 2 * kPadding, 1000)].height + 2 * kPadding;
}

- (void)prepareForReuse {
    [self updateConstraintsIfNeeded];
}

- (void) updateConstraints {
    [self.contentView removeConstraints:self.contentView.constraints];
    [super updateConstraints];
    NSDictionary *viewDict = @{@"title_label": self.textView};
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[title_label]-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:viewDict]];
     
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[title_label]-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:viewDict]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
