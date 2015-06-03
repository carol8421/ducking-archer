//
//  ViewController.h
//  ducking-archer
//
//  Created by Darren Clark on 2015-06-03.
//  Copyright (c) 2015 Darren Clark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *mainLabel;

- (IBAction)pingServer:(id)sender;

@end

