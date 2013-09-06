//
//  DynamicHeightCell.m
//  dynamicCellHeight
//
//  Created by Richard Owens on 8/27/13.
//  Copyright (c) 2013 Richard Owens. All rights reserved.
//

#import "DynamicHeightCell.h"

@implementation DynamicHeightCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.preferredMaxLayoutWidth = self.bounds.size.width;
        
        self.dateLabel = [[UILabel alloc] init];
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.dateLabel.numberOfLines = 0;
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.dateLabel];
    }
    return self;
}

- (void)prepareForReuse {
    [self updateConstraintsIfNeeded];
}

- (void) updateConstraints {
    [self.contentView removeConstraints:self.contentView.constraints];
    [super updateConstraints];
    NSDictionary *viewDict = @{@"title_label": self.titleLabel, @"date_label" : self.dateLabel};
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[title_label]-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:viewDict]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[date_label]-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:viewDict]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[title_label]-(2)-[date_label]-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:viewDict]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
