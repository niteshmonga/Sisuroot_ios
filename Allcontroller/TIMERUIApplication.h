//
//  TIMERUIApplication.h
//  Root
//
//  Created by Epikso on 05/12/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//
#import <Foundation/Foundation.h>

//the length of time before your application "times out". This number actually represents seconds, so we'll have to multiple it by 60 in the .m file
#define kApplicationTimeoutInMinutes 5

//the notification your AppDelegate needs to watch for in order to know that it has indeed "timed out"
#define kApplicationDidTimeoutNotification @"AppTimeOut"
#import <UIKit/UIKit.h>

@interface TIMERUIApplication : UIApplication
{
    NSTimer     *myidleTimer;
}

-(void)resetIdleTimer;
@end

