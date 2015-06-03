//
//  InterfaceController.m
//  ducking-archer WatchKit Extension
//
//  Created by Darren Clark on 2015-06-03.
//  Copyright (c) 2015 Darren Clark. All rights reserved.
//

#import "InterfaceController.h"
@import DataKit;


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    __weak typeof(self) weakSelf = self;
    [DummyDataLoader loadModel:^(DummyModel *model, NSError *error) {
        __strong typeof(weakSelf) self = weakSelf;
        
        if (error)
        {
            self.mainLabel.text = @"*ERROR*";
        }
        else
        {
            self.mainLabel.text = model.value;
        }
    }];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



