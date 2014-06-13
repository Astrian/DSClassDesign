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
    int data; // 双精度数据
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
} //释放堆栈
void pushStack(stack* StackWillBeAdd, dataNode x){
    stackNode* StackNode;
    StackNode = malloc(sizeof(stackNode));
    StackNode -> data = &x;
    StackNode -> next = StackWillBeAdd -> head -> next -> next;
    StackWillBeAdd -> head -> next = StackNode;
    StackWillBeAdd -> head -> status = 0;
} //向堆栈添加数据
int popStack(stack* StackWillBePop){
    stackNode* StackNode;
    int returnDN;
    StackNode = StackWillBePop -> head -> next -> next;
    returnDN = StackWillBePop -> head -> next -> data -> data;
    free(StackWillBePop->head->next);
    StackWillBePop -> head -> next = StackNode;
    return returnDN;
} //从堆栈删除数据

/*
 *初始化链表
 */
void initLink(datalink* link){
    link -> head = malloc(sizeof(dataNode));
    link -> tail = link -> head; //因为只有一个元素，所以头尾皆为同一起始节点
}

/*
 *增加链表元素
 */
void pushLinkData(int Data, datalink* link){
    dataNode* DataNode = malloc(sizeof(dataNode));
    DataNode -> data = Data;
    link -> tail -> back = DataNode;
    DataNode -> front = link -> tail;
    link -> tail = DataNode;
} //增加数据
void pushLinkNode(datalink* link, dataNode* x){
    dataNode* DataNode = malloc(sizeof(dataNode));
    DataNode -> data = x -> data;
    link -> tail -> back = DataNode;
    DataNode -> front = link -> tail;
    link -> tail = DataNode;
} //增加节点

/*
 *下面就是令人生畏的排序函数……
 *快速排序
 */
void fastrank(datalink* link){
    if (link -> head -> back == link -> tail) return; //如果木有数据在表中，打回~
    if (link -> tail -> front == link -> head) return; //如果表中只有一个数据，打回~
    //如果不打回的话就进行排序啦~
    datalink *leftLink;
    datalink *rightLink;
    initLink(leftLink);
    pushLinkData(-1, leftLink);
    initLink(rightLink);
    pushLinkData(-1, rightLink);
    int standNum = link -> head -> back -> data;
    dataNode *node;
    node = link -> head -> back -> back;
    while (node != link -> tail) {
        if (node -> data <= standNum) {
            pushLinkNode(leftLink, node);
        }else{
            pushLinkNode(rightLink, node);
        }
        node = node -> back;
    }
    //排序完毕就左右继续排序，递归啊递归……
    fastrank(leftLink);
    fastrank(rightLink);
    free(link);
    //合并！
    link -> head = leftLink->head;
    link -> tail = leftLink->tail;
    pushLinkData(standNum, leftLink);
    leftLink -> tail -> back = rightLink -> head -> back;
    link -> tail = leftLink -> tail;
}

void popRank(datalink *link)_{
    datalink *Node1, *Node2;
    Node1 = link -> head -> back;
    Node2 = link -> head -> back -> back;
    while(){
        if (Node1 -> data > Node2 -> data){
            
        }
    }
}

/*
 *显示系统日志
 */
void showSystemLog(datalink* link){
    NSString *logs;
    dataNode *p;
    NSLog(@"Starting Log...");
    p = link -> head -> back;
    while (p != link -> tail) {
        logs = [[NSString alloc] initWithFormat:@"Data: %d", p -> data];
        NSLog(logs);
        p = p -> back;
    }
    NSLog([[NSString alloc] initWithFormat:@"Data: %d", p -> data]);
    NSLog(@"Log End.");
}

