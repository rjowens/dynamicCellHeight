//
//  Story.h
//  dynamicCellHeight
//
//  Created by Richard Owens on 8/27/13.
//  Copyright (c) 2013 Richard Owens. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *date;

- (id)initWithDictionary:(NSDictionary*) dict;

@end
