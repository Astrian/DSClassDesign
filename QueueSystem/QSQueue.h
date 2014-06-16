//
//  QSQueue.h
//  QueueSystem
//
//  Created by Astrian Zheng on 16/6/14.
//  Copyright (c) 2014年 Astrian Zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QSQueue <NSObject>

@end

typedef struct queueNode{
    struct queueNode *front;
    struct queueNode *back;
    int number;
    char name[11];
}queueNode;

typedef struct queue{
    struct queueNode *head;
    struct queueNode *tail;
}queue;

void initqueue(queue *queue){
    queueNode *headNode = malloc(sizeof(queueNode));
    headNode -> front = NULL;
    headNode -> back = NULL;
    headNode -> number = 0;
    headNode -> name[0] = 'h';
    headNode -> name[1] = 'e';
    headNode -> name[2] = 'a';
    headNode -> name[3] = 'd';
    headNode -> name[4] = '\0';
    queue -> head = headNode;
    queue -> tail = headNode;
}

void addNode(queue *queue, char* name, int number){
    queueNode *node = malloc(sizeof(queueNode));
    node -> front = queue -> tail;
    queue -> tail -> back = node;
    queue -> tail = node;
    int status = 1;
    int site = 0;
    while (status == 1) {
        if (status == 1) {
            node -> name[site] = name[site];
            if (name[site] == '\0') {
                status = 0;
            }
            site++;
        }
    }
    node -> number = number;
}

void deallocNode(queue *queue){
    queueNode *nodeWillDealloc = malloc(sizeof(queueNode));
    nodeWillDealloc = queue -> head -> back;
    if (queue -> head -> back != queue -> tail) {
        queue -> head -> back = nodeWillDealloc -> back;
        queue -> head -> back -> front = queue -> head;
        free(nodeWillDealloc);
    }else{
        queue -> head -> back -> back = NULL;
        queue -> tail = queue -> head -> back;
    }
    
}

int find(queue *queue, char *name){
    if (queue -> head -> back == NULL) {
        return 0;
    }else{
        queueNode *finding;
        finding = queue -> head -> back;
    while (1) {
            if (finding == queue -> tail) {
                if (strcmp(name, finding -> name) == 0) {
                    return finding -> number;
                }else{
                    return 0;
                }
            }
            if (strcmp(name, finding -> name) == 0) {
                return finding -> number;
            }
            finding = finding -> back;
        }
    }
}