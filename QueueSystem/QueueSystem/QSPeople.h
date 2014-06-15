//
//  QSPeople.h
//  QueueSystem
//
//  Created by Astrian Zheng on 15/6/14.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSPeople : NSObject{
    NSObject* front;
    NSObject* back;
    int Num;
    NSString *name;
}

-(void)initPeople:(NSObject *)frontObj num:(int)number;
-(NSObject *)whatIsFront;
-(NSObject *)whatIsBack;
-(int)posisstion:(int)totalPeople gone:(int)gone;
@end
