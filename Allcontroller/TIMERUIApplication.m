//
//  TIMERUIApplication.m
//  Root
//
//  Created by Epikso on 05/12/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "TIMERUIApplication.h"

@implementation TIMERUIApplication
-(void)sendEvent:(UIEvent *)event
{
    [super sendEvent:event];
    
    if (!myidleTimer)
    {
        [self resetIdleTimer];
    }
    
    NSSet *allTouches = [event allTouches];
    if ([allTouches count] > 0)
    {
        UITouchPhase phase = ((UITouch *)[allTouches anyObject]).phase;
        if (phase == UITouchPhaseBegan)
        {
            [self resetIdleTimer];
        }
        
    }
}
//as labeled...reset the timer

-(void)resetIdleTimer
{
    if (myidleTimer)
    {
        [myidleTimer invalidate];
    }
    
    //convert the wait period into minutes rather than seconds
    
    int timeout = kApplicationTimeoutInMinutes * 60;
   
    myidleTimer = [NSTimer scheduledTimerWithTimeInterval:timeout target:self selector:@selector(idleTimerExceeded) userInfo:nil repeats:NO];
    
}
//if the timer reaches the limit as defined in kApplicationTimeoutInMinutes, post this notification
-(void)idleTimerExceeded
{
[[NSNotificationCenter defaultCenter] postNotificationName:kApplicationDidTimeoutNotification object:nil];
}
@end
