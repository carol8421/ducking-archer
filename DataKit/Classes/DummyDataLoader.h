//
//  DummyDataLoader.h
//  ducking-archer
//
//  Created by Darren Clark on 2015-06-03.
//  Copyright (c) 2015 Darren Clark. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DummyModel.h"

typedef void(^DummyDataLoaderCallback)(DummyModel *model, NSError *error);


@interface DummyDataLoader : NSObject

+ (void)loadModel:(DummyDataLoaderCallback)callback;

@end
