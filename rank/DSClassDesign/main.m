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
    datalink link;
    NSLog(@"How many numbers:");
    int numbers;
    scanf("%d", &numbers);
    if (1< numbers <= 1000) {
        int i;
        for (i = 1; i <= numbers; i++) {
            pushLink(rand(), &link);
        }
    }
    
}
