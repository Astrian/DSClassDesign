//
//  main.m
//  DSClassDesign
//
//  Created by Astrian Zheng on 14-6-11.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "config.h"

int main(int argc, const char * argv[])
{
    srand((unsigned int)(time(NULL)));
    datalink *link = malloc(sizeof(datalink));
    NSLog(@"How many numbers:");
    int numbers;
    scanf("%d", &numbers);
    if (1< numbers <= 1000) {
        int i;
        initLink(link);
        for (i = 1; i <= numbers; i++) {
            pushLink(rand(), link);
        }
        NSString *logs;
        dataNode *a;
        a = link -> head;
        double data = a -> data;
        for (i = 1; i <= numbers; i++) {
            logs = [[NSString alloc] initWithFormat:@"Data: %f", data];
            NSLog(logs);
            if (a -> back != NULL) {
                a = a->back;
            }
        }
    }
}
