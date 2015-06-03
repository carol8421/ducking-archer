//
//  DummyDataLoader.m
//  ducking-archer
//
//  Created by Darren Clark on 2015-06-03.
//  Copyright (c) 2015 Darren Clark. All rights reserved.
//

#import "DummyDataLoader.h"
#import <AFNetworking/AFNetworking.h>


@implementation DummyDataLoader

+ (AFHTTPSessionManager *)sharedSessionManager
{
    static AFHTTPSessionManager *manager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://httpbin.org/"]];
    });
    
    return manager;
}

+ (void)loadModel:(DummyDataLoaderCallback)callback
{
    [[self sharedSessionManager] POST:@"/post" parameters:@{ @"value": @"Hello, world!" }
                              success:^(NSURLSessionDataTask *task, id responseObject) {
                                  NSString *value = responseObject[@"form"][@"value"];
                                  DummyModel *model = [[DummyModel alloc] initWithValue:value];
                                  if (callback)
                                  {
                                      callback(model, nil);
                                  }
                              } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                  if (callback)
                                  {
                                      callback(nil, error);
                                  }
                              }];
}

@end
