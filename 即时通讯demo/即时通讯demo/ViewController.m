//
//  ViewController.m
//  即时通讯demo
//
//  Created by 叶永长 on 4/20/15.
//  Copyright (c) 2015 YYC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UILabel *nameOneLabel;
@property(nonatomic,strong)UILabel *nameTwoLabel;
@property(nonatomic,strong)UITextField *fasongzheid;
@property(nonatomic,strong)UITextField *jieshuozheid;

@property (nonatomic,strong)UITextField *oneUserIDTextField;
@property(nonatomic,strong)UITextField *twoUserIDTextField;

@property(nonatomic,strong)UITextField *sendTextField;



@property (nonatomic,strong)UILabel *bigLabel;


@property(nonatomic,assign)char messageType;
@property(nonatomic,assign)int  sendID;
@property (nonatomic,assign) char *sendType;
@property (nonatomic,assign)int acceptID;
@property (nonatomic,assign) char *acceptType;
@property (nonatomic,assign)long long messageID;
@property (nonatomic,assign)int messageLength;
@property (nonatomic,strong) NSString *messageContent;


@end

@implementation ViewController
@synthesize nameOneLabel;
@synthesize nameTwoLabel;
@synthesize fasongzheid;
@synthesize jieshuozheid;
@synthesize bigLabel;
@synthesize oneUserIDTextField;
@synthesize twoUserIDTextField;
@synthesize messageType;
@synthesize sendID;
@synthesize sendType;
@synthesize acceptID;
@synthesize acceptType;
@synthesize messageID;
@synthesize messageLength;
@synthesize messageContent;
@synthesize sendTextField;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag{
//    NSLog(@"服务发送数据出去了");
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
//
////    NSData *data =[jsonString dataUsingEncoding:NSUTF8StringEncoding];
////    [asyncSocket writeData:data withTimeout:-1 tag:0];
    [asyncSocket readDataToData:[AsyncSocket ZeroData] withTimeout:-1 tag:100];
    
    
    nameOneLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 50, 20)];
    nameOneLabel.text = @"发送者id";
    nameOneLabel.textColor = [UIColor grayColor];
    nameOneLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:nameOneLabel];
    
    fasongzheid = [[UITextField alloc]initWithFrame:CGRectMake(70, 60, 100, 20)];
    fasongzheid.placeholder = @"必填";
    fasongzheid.font = [UIFont systemFontOfSize:12];
    fasongzheid.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:fasongzheid];
    
    sendID = [fasongzheid.text intValue];
    
    UILabel *senderType = [[UILabel alloc]initWithFrame:CGRectMake(180, 60, 70, 20)];
    senderType.text = @"发送者类型";
    senderType.textColor = [UIColor grayColor];
    senderType.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:senderType];
    
    oneUserIDTextField = [[UITextField alloc]initWithFrame:CGRectMake(250, 60, 70, 20)];
    oneUserIDTextField.placeholder = @"请填写A";
    oneUserIDTextField.font = [UIFont systemFontOfSize:12];
    oneUserIDTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:oneUserIDTextField];
    
    
    nameTwoLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 50, 20)];
    nameTwoLabel.text = @"接受者id";
    nameTwoLabel.textColor = [UIColor grayColor];
    nameTwoLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:nameTwoLabel];
    
    
    
    
    
    jieshuozheid = [[UITextField alloc]initWithFrame:CGRectMake(70, 100, 70, 20)];
    jieshuozheid.placeholder = @"必填";
    jieshuozheid.font = [UIFont systemFontOfSize:12];
    jieshuozheid.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:jieshuozheid];
    
    
    
    
    
    UILabel *accepterType = [[UILabel alloc]initWithFrame:CGRectMake(150, 100, 70, 20)];
    accepterType.text = @"接受者类型";
    accepterType.textColor = [UIColor grayColor];
    accepterType.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:accepterType];
    
    twoUserIDTextField = [[UITextField alloc]initWithFrame:CGRectMake(220, 100, 100, 20)];
    twoUserIDTextField.placeholder = @"请填写U/A/G";
    twoUserIDTextField.font = [UIFont systemFontOfSize:12];
    twoUserIDTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:twoUserIDTextField];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 180, 50, 20);
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 0.5;
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    UIButton *buttonlink = [UIButton buttonWithType:UIButtonTypeContactAdd];
    buttonlink.frame = CGRectMake(100, 180, 50, 20);
    [buttonlink addTarget:self action:@selector(btnClickLink:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonlink];
    
    sendTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 150, 100, 20)];
    sendTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:sendTextField];
    
    
    bigLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 280, 280, 150)];
    bigLabel.layer.masksToBounds = YES;
    bigLabel.layer.borderWidth = 0.5;
    [self.view addSubview:bigLabel];
    
    
    
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMddHHmmss"];
    long long strHour = [[dateFormatter stringFromDate:date] integerValue];
    NSLog(@"时间%lld",strHour);
     messageID = strHour;
    
    
//    [self ClentNet];
}

-(void)btnClickLink:(UIButton *)button{
    
    messageContent = sendTextField.text;
//    messageLength = (int)messageContent.length;
    acceptType = 'U';
    acceptID = [jieshuozheid.text intValue];
    sendType = 'U';
    sendID = [fasongzheid.text intValue];
    asyncSocket = [[AsyncSocket alloc]init];
    asyncSocket.delegate = self;
    NSError *err = nil;
    if (![asyncSocket connectToHost:@"123.57.53.228" onPort:8023  error:&err]) {
        NSLog(@"error%@",err);
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [fasongzheid resignFirstResponder];
    [jieshuozheid resignFirstResponder];
    [oneUserIDTextField resignFirstResponder];
    [twoUserIDTextField resignFirstResponder];
    [sendTextField resignFirstResponder];
}

-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"onScoket:%p did connecte to host:%@ on port:%d",sock,host,port);
    [sock readDataWithTimeout:-1 tag:100];
}
-(void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    
    NSLog(@"sorry the connect is failure d断开");
    

}
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag{
//    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
   long long messageIDSecond;
    
    NSLog(@"str%lu",(unsigned long)data.length);
    if (data.length > 24) {
        NSLog(@"jdlfjaldjfaldfaldfadfaf输出一句话");
    }
//    NSLog(@"%@",data);
    NSLog(@"~~~~~~~~%@",[self dataAndString:data]);
    NSString *stringSub = [[self dataAndString:data] substringToIndex:1];
    
    bigLabel.text = [self dataAndString:data];
    if ([stringSub isEqualToString:@"N"]) {
       messageIDSecond = [self dataturn:data];
    }
//    NSLog(@"接受的消息%@",str);
    if ([stringSub isEqualToString:@"L"]) {
        NSMutableData *dataByte = [[NSMutableData alloc]init];
        char messtypeL = 'S';
        char sendtypeFirst = 'U';
        char accepttypeFirst = 'U';
        [dataByte appendBytes:&messtypeL length:sizeof(char)];//消息类型
        //    [dataByte appendData: [fasongzheid.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataByte appendBytes:&sendID length:sizeof(sendID)];//发送者id
        //    [dataByte appendData:[oneUserIDTextField.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataByte appendBytes:&sendtypeFirst length:sizeof(char)];//发送者类型
        //    [dataByte appendData:[jieshuozheid.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataByte appendBytes:&acceptID length:sizeof(acceptID)];//接受者id
        //    [dataByte appendData:[twoUserIDTextField.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataByte appendBytes:&accepttypeFirst length:sizeof(char)];//接受者类型
        [dataByte appendBytes:&messageID length:sizeof(messageID)];//消息id
        const char *chars = [@"give me" cStringUsingEncoding:NSUTF8StringEncoding];
        messageLength = (int)strlen(chars);
        [dataByte appendBytes:&messageLength length:sizeof(int)];//消息长度
        //    [dataByte appendData:[messageContent dataUsingEncoding:NSUTF8StringEncoding]];//消息内容
        //    [dataByte appendBytes:&messageContent length:messageLength];
        [dataByte appendData:[@"give me" dataUsingEncoding:NSUTF8StringEncoding]];
        [sock writeData:dataByte withTimeout:-1 tag:0];
        dataByte = nil;
    }else if ([stringSub isEqualToString:@"C"]){
        NSMutableData *dataBytesssss = [[NSMutableData alloc]init];
        char messageTypeS = 'L';
        char sendtypeSecond = 'U';
        char accepttypeSecond = 'U';
        [dataBytesssss appendBytes:&messageTypeS length:sizeof(char)];//消息类型
        //    [dataByte appendData: [fasongzheid.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataBytesssss appendBytes:&sendID length:sizeof(sendID)];//发送者id
        //    [dataByte appendData:[oneUserIDTextField.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataBytesssss appendBytes:&sendtypeSecond length:sizeof(char)];//发送者类型
        //    [dataByte appendData:[jieshuozheid.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataBytesssss appendBytes:&acceptID length:sizeof(acceptID)];//接受者id
        //    [dataByte appendData:[twoUserIDTextField.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataBytesssss appendBytes:&accepttypeSecond length:sizeof(char)];//接受者类型
        [dataBytesssss appendBytes:&messageID length:sizeof(messageID)];//消息id
        const char *chars = [@"give me" cStringUsingEncoding:NSUTF8StringEncoding];
        messageLength = (int)strlen(chars);
        [dataBytesssss appendBytes:&messageLength length:sizeof(int)];//消息长度
        //    [dataByte appendData:[messageContent dataUsingEncoding:NSUTF8StringEncoding]];//消息内容
        //    [dataByte appendBytes:&messageContent length:messageLength];
        [dataBytesssss appendData:[@"give me" dataUsingEncoding:NSUTF8StringEncoding]];
        [sock writeData:dataBytesssss withTimeout:-1 tag:0];
        dataBytesssss = nil;
    }else if ([stringSub isEqualToString:@"N"]){
        NSMutableData *dataBytesssss = [[NSMutableData alloc]init];
        char messageTypeS = 'G';
        char sendtypeSecond = 'U';
        char accepttypeSecond = 'U';
//        messageIDSecond  = 831;
        [dataBytesssss appendBytes:&messageTypeS length:sizeof(char)];//消息类型
        //    [dataByte appendData: [fasongzheid.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataBytesssss appendBytes:&sendID length:sizeof(sendID)];//发送者id
        //    [dataByte appendData:[oneUserIDTextField.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataBytesssss appendBytes:&sendtypeSecond length:sizeof(char)];//发送者类型
        //    [dataByte appendData:[jieshuozheid.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataBytesssss appendBytes:&acceptID length:sizeof(acceptID)];//接受者id
        //    [dataByte appendData:[twoUserIDTextField.text dataUsingEncoding:NSUTF8StringEncoding]];
        [dataBytesssss appendBytes:&accepttypeSecond length:sizeof(char)];//接受者类型
        [dataBytesssss appendBytes:&messageIDSecond length:sizeof(messageID)];//消息id
        const char *chars = [@"give me" cStringUsingEncoding:NSUTF8StringEncoding];
        messageLength = (int)strlen(chars);
        [dataBytesssss appendBytes:&messageLength length:sizeof(int)];//消息长度
        //    [dataByte appendData:[messageContent dataUsingEncoding:NSUTF8StringEncoding]];//消息内容
        //    [dataByte appendBytes:&messageContent length:messageLength];
        [dataBytesssss appendData:[@"give me" dataUsingEncoding:NSUTF8StringEncoding]];
        [sock writeData:dataBytesssss withTimeout:-1 tag:0];
        dataBytesssss = nil;
    }else if ([stringSub isEqualToString:@"T"]){
        NSLog(@"djflajdflajdfadfjkadf");
        
        
    }
    

    [sock readDataWithTimeout:-1 tag:100];
}

-(void)btnClick:(UIButton *)button{
   
    
    
    
    messageType = 'T';
    messageContent = sendTextField.text;
    messageLength = (int)messageContent.length;
    acceptType = 'U';
    acceptID = [jieshuozheid.text intValue];
    sendType = 'U';
    sendID = [fasongzheid.text intValue];
    
//    messageType = 'T';
//    sendID = 1;
//    sendType = 'U';
//    acceptID = 1;
//    acceptType = 'U';
//    messageID = 2015678890;
//    messageLength = 1;
//    messageContent = @"Q";
    
    
    NSMutableData *dataByte = [[NSMutableData alloc]init];
    
    
    
//    dataByte = [NSData dataWithBytes:messageType length:sizeof(char)];
    
    
    
    
    [dataByte appendBytes:&messageType length:sizeof(char)];//消息类型
    [dataByte appendBytes:&sendID length:sizeof(sendID)];//发送者id
    [dataByte appendBytes:&sendType length:sizeof(char)];//发送者类型
    [dataByte appendBytes:&acceptID length:sizeof(acceptID)];//接受者id
    [dataByte appendBytes:&acceptType length:sizeof(char)];//接受者类型
    [dataByte appendBytes:&messageID length:sizeof(messageID)];//消息id
    const char *chars = [messageContent cStringUsingEncoding:NSUTF8StringEncoding];
    messageLength = (int)strlen(chars);
    [dataByte appendBytes:&messageLength length:sizeof(messageLength)];//消息长度
    [dataByte appendData:[messageContent dataUsingEncoding:NSASCIIStringEncoding]];
//    NSLog(@"11111111%@",dataByte);
//    NSLog(@"消息打印%@",[self dataAndString:dataByte]);
    
    
//    NSMutableString *string=[NSMutableString stringWithFormat:@"%c%d%c%d%c%lld%d%@",messageType,sendID,sendType,acceptID,acceptType,messageID,messageLength,messageContent];
//    [asyncSocket writeData:[string dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
//    [asyncSocket readDataWithTimeout:-1 tag:100];
    
    [asyncSocket writeData:dataByte withTimeout:-1 tag:0];
    [asyncSocket readDataWithTimeout:-1 tag:100];
    
    
}

- (NSString *)dataAndString:(NSData *)reader
{
    
    
    char a;
    int b;
    char c;
    int d;
    char e;
    long long f;
    int g;
    

    [reader getBytes:&a range:NSMakeRange(0, sizeof(a))];
    [reader getBytes:&b range:NSMakeRange(sizeof(a), sizeof(b))];
    [reader getBytes:&c range:NSMakeRange(sizeof(a)+sizeof(b), sizeof(c))];
    [reader getBytes:&d range:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c), sizeof(d))];
    [reader getBytes:&e range:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c)+sizeof(d), sizeof(e))];
    [reader getBytes:&f range:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c)+sizeof(d)+sizeof(e), sizeof(f))];
    [reader getBytes:&g range:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c)+sizeof(d)+sizeof(e)+sizeof(f), sizeof(g))];
    NSString * str = [[NSString alloc] initWithData:[reader subdataWithRange:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c)+sizeof(d)+sizeof(e)+sizeof(f)+sizeof(g), g)] encoding:NSUTF8StringEncoding];
    
    NSString *string = [NSString stringWithFormat:@"%c %d %c %d %c %lld %d %@",a,b,c,d,e,f,g,str];

    return string;
}


- (long long )dataturn:(NSData *)reader
{
    
    
    char a;
    int b;
    char c;
    int d;
    char e;
    long long f;
    int g;
    
    
    [reader getBytes:&a range:NSMakeRange(0, sizeof(a))];
    [reader getBytes:&b range:NSMakeRange(sizeof(a), sizeof(b))];
    [reader getBytes:&c range:NSMakeRange(sizeof(a)+sizeof(b), sizeof(c))];
    [reader getBytes:&d range:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c), sizeof(d))];
    [reader getBytes:&e range:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c)+sizeof(d), sizeof(e))];
    [reader getBytes:&f range:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c)+sizeof(d)+sizeof(e), sizeof(f))];
    [reader getBytes:&g range:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c)+sizeof(d)+sizeof(e)+sizeof(f), sizeof(g))];
    NSString * str = [[NSString alloc] initWithData:[reader subdataWithRange:NSMakeRange(sizeof(a)+sizeof(b)+sizeof(c)+sizeof(d)+sizeof(e)+sizeof(f)+sizeof(g), g)] encoding:NSUTF8StringEncoding];
    
    NSString *string = [NSString stringWithFormat:@"%c %d %c %d %c %lld %d %@",a,b,c,d,e,f,g,str];

    return f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
