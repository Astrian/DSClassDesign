//
//  QSViewController.m
//  QueueSystem
//
//  Created by Astrian Zheng on 16/6/14.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import "QSViewController.h"
#import "QSQueue.h"
#import "TWMessageBarManager.h"

@interface QSViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
- (IBAction)call:(id)sender;
- (IBAction)find:(id)sender;
- (IBAction)visit:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *queueWaiting;


@end

@implementation QSViewController
queue *Queue;
int total = 0;
int visited = 0;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Queue = malloc(sizeof(queue));
    initqueue(Queue);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)call:(id)sender {
    char* name = (char *)[self.name.text UTF8String];
    if (name[0] != '\0') {
        if (find(Queue, name) == 0) {
            NSString *systemNoti = [[NSString alloc] initWithFormat:@"%@ 已加入等待队列", self.name.text];
            total = total + 1;
            addNode(Queue, name, total);
            [[TWMessageBarManager sharedInstance] showMessageWithTitle:@"已挂号"
                                                           description:systemNoti
                                                                  type:TWMessageBarMessageTypeSuccess];
            self.queueWaiting.text = [[NSString alloc] initWithFormat:@"%d", total - visited];
        }else{
            NSString *systemNotiTitle = [[NSString alloc] initWithFormat:@"出错啦o(￣ヘ￣o＃)"];
            NSString *systemNoti = [[NSString alloc] initWithFormat:@"这么碰巧遇到同名的？"];
            [[TWMessageBarManager sharedInstance] showMessageWithTitle:systemNotiTitle
                                                           description:systemNoti
                                                                  type:TWMessageBarMessageTypeError];
        }
    }else{
        NSString *systemNotiTitle = [[NSString alloc] initWithFormat:@"出错啦(艹皿艹 )"];
        NSString *systemNoti = [[NSString alloc] initWithFormat:@"没输入名字呢！"];
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:systemNotiTitle
                                                       description:systemNoti
                                                              type:TWMessageBarMessageTypeError];
    }
    
    
}
//=，=
- (IBAction)find:(id)sender {
    char* name = (char *)[self.name.text UTF8String];
    if (name[0]!='\0') {
        int nowNum = find(Queue, name);
        NSString *systemNoti;
        if (nowNum != 0) {
            NSString *systemNotiTitle =[[NSString alloc] initWithFormat:@"%s 的队列位置", name];
            if (nowNum - visited - 1 == 0) {
                systemNoti = [[NSString alloc] initWithFormat:@"即将就诊，请稍事休息。"];
            }else{
                systemNoti = [[NSString alloc] initWithFormat:@"前方有%d位患者等待就诊。", nowNum - visited - 1];
            }
            
            [[TWMessageBarManager sharedInstance] showMessageWithTitle:systemNotiTitle
                                                           description:systemNoti
                                                                  type:TWMessageBarMessageTypeInfo];
        }else{
            NSString *systemNotiTitle =[[NSString alloc] initWithFormat:@"出错啦(屮눈皿눈)"];
            NSString *systemNoti = [[NSString alloc] initWithFormat:@"查无此人诶！"];
            [[TWMessageBarManager sharedInstance] showMessageWithTitle:systemNotiTitle
                                                           description:systemNoti
                                                                  type:TWMessageBarMessageTypeError];
        }
    }else{
        NSString *systemNotiTitle = [[NSString alloc] initWithFormat:@"出错啦(艹皿艹 )"];
        NSString *systemNoti = [[NSString alloc] initWithFormat:@"没输入名字呢！"];
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:systemNotiTitle
                                                       description:systemNoti
                                                              type:TWMessageBarMessageTypeError];
    }
}

- (IBAction)visit:(id)sender {
    if (total != visited) {
        NSString *name = [[NSString alloc] initWithFormat:@"%s", Queue -> head -> back -> name];
        deallocNode(Queue);
        visited ++;
        NSString *systemNotiTitle = [[NSString alloc] initWithFormat:@"%@ 登记就诊成功", name];
        NSString *systemNoti = [[NSString alloc] initWithFormat:@"该病人已从队列中移除。"];
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:systemNotiTitle
                                                       description:systemNoti
                                                              type:TWMessageBarMessageTypeSuccess];
        self.queueWaiting.text = [[NSString alloc] initWithFormat:@"%d", total - visited];
    }else{
        NSString *systemNotiTitle = [[NSString alloc] initWithFormat:@"出错啦(;￢д￢)"];
        NSString *systemNoti = [[NSString alloc] initWithFormat:@"队列里面没病人啦~"];
        [[TWMessageBarManager sharedInstance] showMessageWithTitle:systemNotiTitle
                                                       description:systemNoti
                                                              type:TWMessageBarMessageTypeError];
        self.queueWaiting.text = [[NSString alloc] initWithFormat:@"%d", total - visited];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.name) {
        [theTextField resignFirstResponder];
    }
    return YES;
}
@end
