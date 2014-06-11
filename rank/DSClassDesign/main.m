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
            /*******************************************************************************************
             * time()函数老傲娇……只能用 clock()……但是因为编辑器又跑太快……老重复数据……然后只能做一个时间函数去重判断 *
             * (╯°□°）╯︵ ┻━┻信不信劳资不陪你玩儿了！                                                       *
             *******************************************************************************************/
            double clock1 = -1, clock2 = clock();
            int Rand;
            if (clock1 != clock2) {
                clock1 = clock2;
                srand((unsigned)clock());
                Rand = rand()%1001+0;
                pushLinkData(Rand, link);
            }
        }
        fastrank(link);
        dataNode *Node = malloc(sizeof(dataNode));
        Node = link -> head -> back;
        while (Node != NULL) {
            NSLog([[NSString alloc] initWithFormat:@"Lvl %d", Node -> data]);
        }
    }else{
        NSLog(@"THIS IS A ILLEGAL NUMBER!");
        //谁叫你输超过1000的数字的！打回！
    }
}
