//
//  AppDelegate.m
//  ch13闹钟讲解
//
//  Created by jredu on 15/6/10.
//  Copyright (c) 2015年 jredu. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate ()
{
    //定义播放器播放音乐
    AVAudioPlayer * player;
    //用来判断是不是从通知窗口打开
    BOOL isFromNotification;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
     isFromNotification=YES;
    
 //================
}

- (void)applicationDidBecomeActive:(UIApplication *)application{
       isFromNotification=NO;
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
 

    //如果是从通知窗口进来的则不需要播放音频
    if (isFromNotification) {
        return;
    }
    

    //初始化音乐播放音乐
    NSURL * url=[[NSBundle mainBundle] URLForResource:@"4195.mp3" withExtension:nil];
    player=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    player.numberOfLoops=0;
    
    [player prepareToPlay];
    [player play];
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [player stop];
}


@end



