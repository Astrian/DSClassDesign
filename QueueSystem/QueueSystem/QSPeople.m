//
//  QSPeople.m
//  QueueSystem
//
//  Created by Astrian Zheng on 15/6/14.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import "QSPeople.h"

@implementation QSPeople
-(void)initPeople:(NSObject *)frontObj num:(int)number{
    front = frontObj;
    Num = number;
}

-(NSObject *)whatIsFront{
    return front;
}

-(NSObject *)whatIsBack{
    return back;
}

-(int)posisstion:(int)totalPeople gone:(int)gone{
    int posisstion;
    return  posisstion = totalPeople - gone - Num;
}
@end

