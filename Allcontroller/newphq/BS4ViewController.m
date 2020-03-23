//
//  BS4ViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
#import "BS4ViewController.h"
#import "MyWebserviceManager.h"
#import "BS6ViewController.h"
#import "DemoGraphicViewController.h"
#import "DemoOtherViewController.h"
@interface BS4ViewController ()
@end
@implementation BS4ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CloseBtnAction:(id)sender {
    [self callfetchprofile];
}

- (IBAction)NextBtnAction:(id)sender {
    BS6ViewController *fvc=[[BS6ViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
}

-(void)callfetchprofile
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"]
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
}
-(void) processFailed :(NSError *)responseDictionary
{
     NSLog(@"error");
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
       if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
       {
          if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] isEqual:@"1"])
            {
                DemoGraphicViewController *EVC=[[DemoGraphicViewController alloc]init];
                [self.navigationController pushViewController:EVC animated:YES];
            }
            
            else if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] isEqual:@"2"])
            {
                DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                [BSV setTypeString:@"demo1"];
                [BSV setDemostr:@"demostr"];
                [self.navigationController pushViewController:BSV animated:YES];
            }
            else if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] isEqual:@"3"])
            {
                DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                [BSV setTypeString:@"demo2"];
                [BSV setDemostr:@"demostr"];
                [self.navigationController pushViewController:BSV animated:YES];
            }
            
            else if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] isEqual:@"4"])
            {
                DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
                [BSV setTypeString:@"demo3"];
                [BSV setDemostr:@"demostr"];
                [self.navigationController pushViewController:BSV animated:YES];
            }
         }
    }
}
@end




