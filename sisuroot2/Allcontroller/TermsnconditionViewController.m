//
//  TermsnconditionViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 29/06/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "TermsnconditionViewController.h"
#import "SignupViewController.h"
#import "BS4ViewController.h"
#import "LoginViewController.h"
#import "MyWebserviceManager.h"

@interface TermsnconditionViewController ()

@end

@implementation TermsnconditionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    if ([_typeString isEqualToString:@"service"])
    //    {
    
    NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
    
    NSString *url=@"https://w2.sisuroot.com/servicebus/locationBasedTermandCond.php?id=";
    
    NSString *url1=[url stringByAppendingString:i];
    
    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];

    
    //https://w2.sisuroot.com/servicebus/termandconditions.php
    // headerLbl.text = @"Privacy";
    //}
    //    else if ([_typeString1 isEqualToString:@"code1"])
    //    {
    //        //[_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[_localDict valueForKey:@"gift_card_url"]]]];
    //
    //        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[_localDict valueForKey:@"gift_card_url"]]]];
    //
    //        headerLbl.text = @"Check Balance";
    //    }
    //    else if ([_typeString isEqualToString:@"termsview"])
    //    {
    //        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.myme2u.com/terms-service.html"]]];
    //    }
    //    else if ([_typeString isEqualToString:@"terms"])
    //    {
    //        //NSString *url=@"https:www.myme2u.com/gift_tnc.php?id=";
    //
    //        NSString *i=_detailidstr;
    //        NSString *url=@"https://www.myme2u.com/gift_tnc.php?id=";
    //        NSString *url1=[url stringByAppendingString:i];
    //
    //
    //        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    //    }
    //    else
    //    {
    //        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[_localDict valueForKey:@"term_condition"]]]];
    //        headerLbl.text = @"Terms and Condition";
    //    }
    
    
    
    // Do any additional setup after loading the view.
}

-(IBAction)backAction:(id)sender
{
    LoginViewController *Svc=[[LoginViewController alloc]init];
    
    [self.navigationController pushViewController:Svc animated:YES];}

- (IBAction)AgreeBtnAction:(id)sender {
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"AcceptTC" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"AcceptTC" :dict :paramDict];
    
    
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"AcceptTC"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            BS4ViewController *Svc=[[BS4ViewController alloc]init];
            [self.navigationController pushViewController:Svc animated:YES];
        }
    }
}

- (IBAction)DisAgreeBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end

