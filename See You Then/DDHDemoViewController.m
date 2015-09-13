//
//  DDHDemoViewController.m
//  DDHTimerControlDemo
//
//  Created by dasdom on 29.05.14.
//  Copyright (c) 2014 dasdom. All rights reserved.
//

#import "DDHDemoViewController.h"
#import "DDHTimerControl.h"
#import <Parse/Parse.h>

@interface DDHDemoViewController ()
@property (nonatomic, strong) DDHTimerControl *timerControl1;
@property (nonatomic, strong) DDHTimerControl *timerControl2;
@property (nonatomic, strong) DDHTimerControl *timerControl3;
@property (nonatomic, strong) NSDate *endDate;
@end

@implementation DDHDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    UIView *contentView = [[UIView alloc] init];
	
//	PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
//	[query whereKey:@"playerName" equalTo:@"Dan Stemkoski"];
//	[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//  if (!error) {
//	  // The find succeeded.
//	  NSLog(@"Successfully retrieved %d scores.", objects.count);
//	  // Do something with the found objects
//	  for (PFObject *object in objects) {
//		  NSLog(@"%@", object.objectId);
//	  }
//  } else {
//	  // Log details of the failure
//	  NSLog(@"Error: %@ %@", error, [error userInfo]);
//  }
//	}];
	
	
    contentView.backgroundColor = [UIColor colorWithRed:0.142 green:0.149 blue:0.204 alpha:1.000];
	
	
    _timerControl2 = [DDHTimerControl timerControlWithType:DDHTimerTypeEqualElements];
    _timerControl2.translatesAutoresizingMaskIntoConstraints = NO;
    _timerControl2.color = [UIColor orangeColor];
    _timerControl2.highlightColor = [UIColor redColor];
    _timerControl2.minutesOrSeconds = self.seconds;
    _timerControl2.titleLabel.text = @"min";
    _timerControl2.userInteractionEnabled = NO;
    [contentView addSubview:_timerControl2];
    
    _timerControl3 = [DDHTimerControl timerControlWithType:DDHTimerTypeSolid];
    _timerControl3.translatesAutoresizingMaskIntoConstraints = NO;
    _timerControl3.color = [UIColor orangeColor];
    _timerControl3.highlightColor = [UIColor redColor];
    _timerControl3.minutesOrSeconds = self.seconds;
    _timerControl3.titleLabel.text = @"sec";
    _timerControl3.userInteractionEnabled = NO;
    [contentView addSubview:_timerControl3];
	
    
    self.view = contentView;
    
	
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_timerControl2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_timerControl2 attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_timerControl3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_timerControl3 attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];

    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_timerControl2, _timerControl3);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[_timerControl2(300)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-400-[_timerControl3(100)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary]];
//	
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-300-[_timerControl2]-300-[_timerControl3(100)]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:viewsDictionary]];
      [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_timerControl2]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_timerControl3]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:viewsDictionary]];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeTimer:) userInfo:nil repeats:YES];
    self.endDate = [NSDate dateWithTimeIntervalSinceNow:12.0f*60.0f];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)random:(UIButton*)sender {
    NSUInteger randomInteger = arc4random_uniform(60);
    
    self.timerControl1.minutesOrSeconds = randomInteger;
}

- (void)changeTimer:(NSTimer*)timer {
    NSTimeInterval timeInterval = [self.endDate timeIntervalSinceNow];
    
//    NSLog(@"timeInterval: %f, minutes: %f", timeInterval, timeInterval/60.0f);
    self.timerControl2.minutesOrSeconds = (NSInteger)(timeInterval/60.0f);
    self.timerControl3.minutesOrSeconds = ((NSInteger)timeInterval)%60;
}

- (void)valueChanged:(DDHTimerControl*)sender {
    NSLog(@"value: %d", sender.minutesOrSeconds);
}

@end
