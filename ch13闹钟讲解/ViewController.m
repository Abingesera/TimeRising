//
//  ViewController.m
//  ch13闹钟讲解
//
//  Created by jredu on 15/6/10.
//  Copyright (c) 2015年 jredu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    
//    NSString * path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSLog(@"%@",path);
//    
//    NSURL * url=[NSURL URLWithString:@"http://localhost/logo.php?userName=jereh&pwd=123"];
//    NSMutableURLRequest * request=[NSMutableURLRequest requestWithURL:url];
//    request.cachePolicy=NSURLRequestReturnCacheDataElseLoad;
//    NSOperationQueue *mainQueue=[NSOperationQueue mainQueue];
//    
//    NSURLCache * catche=[NSURLCache sharedURLCache];
//    
//    [catche removeCachedResponseForRequest:request];
//    [catche removeAllCachedResponses];
//    
//   NSCachedURLResponse * res= [catche cachedResponseForRequest:request];
//    
//    NSLog(@"===%d",res==nil);
//
//
//    
//    [NSURLConnection sendAsynchronousRequest:request queue:mainQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
// 
//       
//    }];

}





//注册通知
- (IBAction)setAlert:(id)sender {

    UIApplication * application=[UIApplication sharedApplication];

    //如果当前应用程序没有注册本地通知，需要注册
    if([application currentUserNotificationSettings].types==UIUserNotificationTypeNone){
        
        //设置提示支持的提示方式
//        UIUserNotificationTypeBadge   提示图标
//        UIUserNotificationTypeSound   提示声音
//        UIUserNotificationTypeAlert   提示弹框
        UIUserNotificationSettings * setting=[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeAlert categories:nil];
        [application registerUserNotificationSettings:setting];
        
    }
    

    //删除之前的重复通知
    [application cancelAllLocalNotifications];
    
    //添加本地通知
    NSDate * date=[NSDate dateWithTimeIntervalSinceNow:10];

    [self _addLocalNotification:date];

    
    
}



#pragma mark - 添加本地通知
- (void) _addLocalNotification:(NSDate *) date{
    
    UILocalNotification * noti=[[UILocalNotification alloc] init];
    //设置开始时间
    noti.fireDate=date;
    
    //设置body
    noti.alertBody=@"该起床了";
    
    //设置action
    noti.alertAction=@"解锁";
    
    //设置闹铃
    noti.soundName=@"4195.mp3";
    
#warning 注册完之后如果不删除，下次会继续存在，即使从模拟器卸载掉也会保留
    //注册通知
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];
    
}


 

@end
