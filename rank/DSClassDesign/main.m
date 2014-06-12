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
    if (1 < numbers && numbers <= 1000) {
        int i;
        initLink(link);
        for (i = 1; i <= numbers; i++) {
                pushLinkData(((unsigned)(arc4random()))%1001, link); // 靠，有这么好用的随机数算法不用……
        }
        fastrank(link);
    }else{
        NSLog(@"THIS IS A ILLEGAL NUMBER!");
        //谁叫你输超过1000的数字的！打回！
    }
}
