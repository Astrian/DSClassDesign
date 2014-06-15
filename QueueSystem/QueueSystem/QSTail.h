//
//  QSTail.h
//  QueueSystem
//
//  Created by Astrian Zheng on 15/6/14.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QSTail : NSObject{
    NSObject *last;
}

@property(nonatomic,retain)NSObject *last;


-(void)changeTail:(NSObject *)lastObj;
@end
