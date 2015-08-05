//
//  Singleton.m
//  即时通讯demo
//
//  Created by 叶永长 on 4/21/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton


+(Singleton *)sharedInstance{
    static Singleton *sharedInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstace = [[self alloc]init];
    });
    return  sharedInstace;
}
@end
