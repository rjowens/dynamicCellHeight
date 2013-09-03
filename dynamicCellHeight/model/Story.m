//
//  Story.m
//  dynamicCellHeight
//
//  Created by Richard Owens on 8/27/13.
//  Copyright (c) 2013 Richard Owens. All rights reserved.
//

#import "Story.h"

@implementation Story

- (id)initWithDictionary:(NSDictionary*) dict {
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.date = dict[@"date"];
    }
    return self;
}

@end
