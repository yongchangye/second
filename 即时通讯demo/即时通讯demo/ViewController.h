//
//  ViewController.h
//  即时通讯demo
//
//  Created by 叶永长 on 4/20/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <unistd.h>
#import "AsyncSocket.h"
@interface ViewController : UIViewController<AsyncSocketDelegate>

{
    AsyncSocket *asyncSocket;
}

@end

