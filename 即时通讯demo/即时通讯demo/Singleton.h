//
//  Singleton.h
//  即时通讯demo
//
//  Created by 叶永长 on 4/21/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"

#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block)
static dispatch_once_t onceToken = 0;
__strong static id sharedInstance = nil;

@interface Singleton : NSObject

+(Singleton *)sharedInstance;

@end
