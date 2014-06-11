//
//  config.h
//  DSClassDesign
//
//  Created by Astrian Zheng on 14-6-11.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface config : NSObject

@end

/*
 *定义数据结构
 */
typedef struct dataNode{ //数据节点
    struct dataNode *front; //前一节点指针
    struct dataNode *back; //后一节点指针
    double data; // 双精度数据
}dataNode;

typedef struct datalink{ //数据链式表
    dataNode *head; //首节点指针
    dataNode *tail; //尾节点指针
}datalink;

/*
 *定义堆栈，用于存储不同的随机数
 */
typedef struct stackNode{ //堆栈节点
    dataNode *data; //存放某数据节点的指针
    struct stackNode* next; //下一堆栈节点的指针
    int status; //状态，可能用不到……
}stackNode;

typedef struct stack{
    stackNode *head;
    stackNode *tail;
}stack; //堆栈定义


/*
 *定义一堆函数
 *首先是堆栈日常函数
 */
void initStack(stack* Stack){
    Stack -> head = malloc(sizeof(stackNode));
    Stack -> tail = malloc(sizeof(stackNode));
} //初始化堆栈

void freeStack(stack* StackWillBeFree){
    stackNode* Stack1;
    stackNode* Stack2;
    Stack2 = StackWillBeFree -> head;
    while (Stack2 != StackWillBeFree -> tail) {
        Stack1 = Stack2 -> next;
        free(Stack2);
        Stack2 = Stack1;
    }
    free( StackWillBeFree -> tail );
}

void pushStack(stack* StackWillBeAdd, dataNode x){
    stackNode* StackNode;
    StackNode = malloc(sizeof(stackNode));
    StackNode -> data = &x;
    StackNode -> next = StackWillBeAdd -> head -> next -> next;
    StackWillBeAdd -> head -> next = StackNode;
    StackWillBeAdd -> head -> status = 0;
}

double popStack(stack* StackWillBePop){
    stackNode* StackNode;
    double returnDN;
    StackNode = StackWillBePop -> head -> next -> next;
    returnDN = StackWillBePop -> head -> next -> data -> data;
    free(StackWillBePop->head->next);
    StackWillBePop -> head -> next = StackNode;
    return returnDN;
}

/*
 *增加链表元素
 */
void pushLink(double Data, datalink* link){
    dataNode* DataNode = malloc(sizeof(dataNode));
    DataNode -> data = Data;
    link -> tail -> back = DataNode;
    link -> tail = DataNode;
}

/*
 *下面就是令人生畏的排序函数……
 *快速排序
 */
void fastrank(datalink* link){
    
}

























