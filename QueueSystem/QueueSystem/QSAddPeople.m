//
//  QSAddPeople.m
//  QueueSystem
//
//  Created by Astrian Zheng on 15/6/14.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import "QSAddPeople.h"
#import "TWMessageBarManager.h"

@implementation QSAddPeople

- (IBAction)Confirm:(id)sender {
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"Account Updated!"
                                                   description:@"Your account was successfully updated."
                                                          type:TWMessageBarMessageTypeSuccess];
}
@end

