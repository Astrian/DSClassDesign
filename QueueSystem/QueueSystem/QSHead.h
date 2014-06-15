//
//  QSHead.h
//  QueueSystem
//
//  Created by Astrian Zheng on 15/6/14.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSHead : NSObject{
    NSObject *first;
}

@property(nonatomic,retain)NSObject *

-(void)initHead;
@end
