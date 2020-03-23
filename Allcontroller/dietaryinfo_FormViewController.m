//
//  dietaryinfo_FormViewController.m
//  Sisuroot
//
//  Created by Epikso on 05/04/19.
//  Copyright © 2019 Epikso Inc. All rights reserved.
//
#import "dietaryinfo_FormViewController.h"
#import "DemoOtherViewController.h"
#import "FeedViewController.h"
#import "SWRevealViewController.h"
#import "FeedViewController.h"
#import "FriendsViewController.h"
#import "SelectContactViewController.h"
#import "Reachability.h"

@interface dietaryinfo_FormViewController ()
{
    
    NSString *URLneme;
    NSURL *url;
    NSString *checkstr;
}
@end

@implementation dietaryinfo_FormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [FIRAnalytics setScreenName:@"Dietary Info Form" screenClass:@"Dietary Info Form"];
    
    [self callnetconnection];
    
    self.navigationController.navigationBar.hidden=YES;
    _MenuBtnobj.hidden=YES;
    _footerlbl.hidden=YES;
    _quizstmtlbl.hidden=YES;
    
    
    
        _backbtnobj.hidden=YES;
        _homebtnobj.hidden=YES;
    
    [_webview setDelegate:self];
    _headerLbl.text=@"Dietary Info Form";
        
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://rootapp.epiksolution.org/servicebus/DietaryInfo.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidFinishLoad:(UIWebView *) webView {
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = request.URL;
    //NSString *url1=url;
    NSString *urlString = [url absoluteString];
    URLneme=url;
    if ([urlString isEqualToString:@"https://rootapp.epiksolution.org/servicebus/cancel.php"]) {
        FeedViewController *fvc=[[FeedViewController alloc]init];
        [self.navigationController pushViewController:fvc animated:YES];
        // URLneme=@"https://rootapp.epiksolution.org/servicebus/cancel.php";
        return YES;
    }
    
    else if ([urlString isEqualToString:@"https://rootapp.epiksolution.org/servicebus/invite.php"]){
        // Process data from form
        // URLneme=@"https://rootapp.epiksolution.org/servicebus/cancel.php";
        
        SelectContactViewController *EVC=[[SelectContactViewController alloc]init];
        [EVC setStr1:@"done"];
        [self.navigationController pushViewController:EVC animated:YES];
        return NO;
    }
    return YES;
    
    
}


-(IBAction)backAction:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)AgreeBtnAction:(id)sender {
    
    FeedViewController *fvc=[[FeedViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
    
    
}

-(void)callnetconnection
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You should connect with wifi for optimal use." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        alert.tag=2000;
        [alert show];
    }
    else if (status == ReachableViaWiFi)
    {
        //WiFi
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
    }
}
@end
