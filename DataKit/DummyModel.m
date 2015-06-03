//
//  DummyModel.m
//  ducking-archer
//
//  Created by Darren Clark on 2015-06-03.
//  Copyright (c) 2015 Darren Clark. All rights reserved.
//

#import "DummyModel.h"

@implementation DummyModel

- (id)initWithValue:(NSString *)value
{
    if ((self = [super init]) != nil)
    {
        _value = value;
    }
    return self;
}

@end
