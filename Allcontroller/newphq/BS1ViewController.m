
#import "BS1ViewController.h"
#import "FeedViewController.h"
#import "MyWebserviceManager.h"
#import "Reachability.h"
@interface BS1ViewController ()
{
    NSString *phNo;
}
@end

@implementation BS1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callnetconnection];
   // [self callviewdemo];
    
    self.navigationController.navigationBar.hidden=YES;
    
    if ([_msgcheckstr isEqualToString:@"Testmsg"])
    {
        _backbtnobj.hidden=YES;
        
       [_SkipBtnobj setTitle:@"Done" forState:UIControlStateNormal];
        headerLbl.text=@"Message";
        _SkipBtnobj.hidden=NO;
         NSString *i=_countstr;
        NSString *j=_scaletype;
        NSString *k=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];

        NSString *baseURL= [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/TestMsgShow.php?id=%@&scaletype=%@&score=%@", k, j, i];
 
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:baseURL]]];
     }
    else
    {
        
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w2.sisuroot.com/servicebus/sosnumber.php?id=";
        NSString *url1=[url stringByAppendingString:i];
 
         [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    _SkipBtnobj.layer.cornerRadius=20;
    _SkipBtnobj.clipsToBounds=YES;
    _SkipBtnobj.layer.borderColor=[UIColor whiteColor].CGColor;
    _SkipBtnobj.layer.borderWidth = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


- (IBAction)NotatallBtnAction:(id)sender {
    
    
}

- (IBAction)Btn2Action:(id)sender {
    
}

- (IBAction)Btn3Action:(id)sender {
    
}

- (IBAction)Btn4Action:(id)sender {
    
}

- (IBAction)SkipBtnAction:(id)sender {
    
    FeedViewController *BSV=[[FeedViewController alloc]init];
    [BSV setStr2:@"feed"];
    [self.navigationController pushViewController:BSV animated:YES];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = request.URL;
    //NSString *url1=url;
    NSString *urlString = [url absoluteString];
   // URLneme=url;
    if ([urlString isEqualToString:@"https://w2.sisuroot.com/servicebus/backtohome.php"]) {
        FeedViewController *fvc=[[FeedViewController alloc]init];
        [self.navigationController pushViewController:fvc animated:YES];
        // URLneme=@"https://w2.sisuroot.com/servicebus/cancel.php";
        return YES;
    }
    
    else if ([urlString isEqualToString:@"https://w2.sisuroot.com/servicebus/backtohome.php"]){
        // Process data from form
        // URLneme=@"https://w2.sisuroot.com/servicebus/cancel.php";
        
        FeedViewController *fvc=[[FeedViewController alloc]init];
        [self.navigationController pushViewController:fvc animated:YES];
        
        return NO;
    }
    return YES;
    
    
}



//-(void)callviewdemo
//{
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"GetHotlineNumberbylocation" forKey:@"name"];
//
//    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
//
//    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManager:@"GetHotlineNumberbylocation" :dict :paramDict];
//
//}
//
//
//-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
//{
//    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"GetHotlineNumberbylocation"])
//    {
//        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
//        {
//            phNo=[[responseDictionary valueForKey:@"data"] valueForKey:@"number"];
//
////            FeedViewController *EVC=[[FeedViewController alloc]init];
////            [EVC setStr2:@"feed"];
////            [self.navigationController pushViewController:EVC animated:YES];
//            [_hotlinenumberobj setTitle:[[responseDictionary valueForKey:@"data"] valueForKey:@"number"] forState:UIControlStateNormal];
//
//        }
//        else
//        {
//              phNo=@"1-800-799-7233";
//             [_hotlinenumberobj setTitle:phNo forState:UIControlStateNormal];
//        }
//
//    }
//}

//- (IBAction)hotlineBtnAction:(id)sender {
//     phNo=@"1-800-799-7233";
//    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
//
//    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
//        [[UIApplication sharedApplication] openURL:phoneUrl];
//    } else
//    {
//        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//        [calert show];
//    }
//}

- (IBAction)BackBtnAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)HomeBtnAction:(id)sender
{
    FeedViewController *EVC=[[FeedViewController alloc]init];
    //            [EVC setStr2:@"feed"];
    [self.navigationController pushViewController:EVC animated:YES];
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
