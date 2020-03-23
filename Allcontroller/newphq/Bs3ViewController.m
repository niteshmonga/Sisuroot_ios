//
//  Bs3ViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "Bs3ViewController.h"
#import "PHQ8ViewController.h"
#import "PPDTest1ViewController.h"
#import "PPDTestCViewController.h"
#import "PPDTestDViewController.h"
#import "PPDTestEViewController.h"
#import "MyWebserviceManager.h"
#import "BS1ViewController.h"

@interface Bs3ViewController ()

@end

@implementation Bs3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([_msgcheckstr isEqualToString:@"Testmsg"])
    {
         //headerLbl.text=@"Message";
        
        NSString *i=_countstr;
        NSString *j=_scaletype;
        NSString *k=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
    NSString *baseURL= [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/TestAddonQuetion.php?id=%@&scaletype=%@&score=%@", k, j, i];
        
         [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:baseURL]]];
    }
    
//    else
//    {
//
//        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
//        NSString *url=@"https://w2.sisuroot.com/servicebus/sosnumber.php?id=";
//        NSString *url1=[url stringByAppendingString:i];
//
//        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
//    }
    
 
   
}


-(void)webViewDidFinishLoad:(UIWebView *) webView {

}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    NSString *i=_countstr;
    NSString *j=_scaletype;
    NSString *k=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
    
    NSString *baseURL1= [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/TestMsgShow.php?scaletype=%@&score=%@&id=%@", j, i, k];
    
    
    NSURL *url = request.URL;
    //NSString *url1=url;
    NSString *urlString = [url absoluteString];
    
     if ([urlString isEqualToString:baseURL1]) {
        BS1ViewController *FVC=[[BS1ViewController alloc]init];
         [FVC setCountstr:_countstr];
         [FVC setScaletype:_scaletype];
         [FVC setMsgcheckstr:@"Testmsg"];
        [self.navigationController pushViewController:FVC animated:YES];
         return YES;
         
         
    }
    
    else if ([urlString isEqualToString:baseURL1]){
        // Process data from form
        // URLneme=@"https://w2.sisuroot.com/servicebus/cancel.php";
        
        BS1ViewController *FVC=[[BS1ViewController alloc]init];
        [FVC setCountstr:_countstr];
        [FVC setScaletype:_scaletype];
        [FVC setMsgcheckstr:@"Testmsg"];
        [self.navigationController pushViewController:FVC animated:YES];
        
        return NO;
    }
    return YES;
    
    
}


- (IBAction)SkipBtnAction:(id)sender
{
     [self.navigationController popViewControllerAnimated:YES];
 }



@end
