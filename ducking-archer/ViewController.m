//
//  ViewController.m
//  ducking-archer
//
//  Created by Darren Clark on 2015-06-03.
//  Copyright (c) 2015 Darren Clark. All rights reserved.
//

#import "ViewController.h"
@import DataKit;
@import AFNetworking;


@interface ViewController ()

@property (nonatomic, readonly) AFHTTPSessionManager *sessionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/"];
    _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL];
}

- (IBAction)pingServer:(id)sender
{
    __weak typeof(self) weakSelf = self;
    [self.sessionManager GET:@"/get" parameters:@{ @"value": @"Server says hi!" }
                     success:^(NSURLSessionDataTask *task, id responseObject) {
                         __strong typeof(weakSelf) self = weakSelf;
                         [self showAlert:responseObject[@"args"][@"value"]];
                     } failure:^(NSURLSessionDataTask *task, NSError *error) {
                         __strong typeof(weakSelf) self = weakSelf;
                         [self showAlert:@"Network call failed"];
                     }];
}

- (void)showAlert:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        // do nothing
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
