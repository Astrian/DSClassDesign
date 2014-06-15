//
//  QSViewController.m
//  QueueSystem
//
//  Created by Astrian Zheng on 15/6/14.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import "QSViewController.h"
#import "TWMessageBarManager.h"
#import "QSPeople.h"
#import "QSPeople.m"
#define MAXNUM 99999

@interface QSViewController ()
- (IBAction)visit:(id)sender;

@end

@implementation QSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)visit:(id)sender {
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Mike 就诊成功"
                                                   description:@"该病人已从队列中移除。"
                                                          type:TWMessageBarMessageTypeSuccess];
}
@end
