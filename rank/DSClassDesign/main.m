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
    datalink *link = malloc(sizeof(datalink));
    NSLog(@"How many numbers:");
    int numbers;
    scanf("%d", &numbers);
    if (1< numbers <= 1000) {
        int i;
        initLink(link);
        for (i = 1; i <= numbers; i++) {
            double clock1 = -1, clock2 = clock();
            int Rand;
            if (clock1 != clock2) {
                clock1 = clock2;
                srand((unsigned)clock());
                Rand = rand()%101+0;
                pushLink(Rand, link);
            }
        }
        NSString *logs;
        dataNode *a = malloc(sizeof(dataNode));
        a = link -> head -> back;
        for (i = 1; i <= numbers; i++) {
            logs = [[NSString alloc] initWithFormat:@"Data: %d", a -> data];
            NSLog(logs);
            if (a -> back != NULL) {
                a = a->back;
            }
        }
    }else{
        NSLog(@"THIS IS A ILLEGAL NUMBER!");
    }
}
