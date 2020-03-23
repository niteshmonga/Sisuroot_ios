
#import "BS1ViewController.h"
#import "FeedViewController.h"
#import "MyWebserviceManager.h"
#import "Reachability.h"
#import "GraphView.h"
#import "GraphView1.h"
#import "Sisuroot-Swift.h"
#import "chattypeViewController.h"
#import "UIView+RNActivityView.h"
#import "smilepage1ViewController.h"
@interface BS1ViewController ()
{
    NSString *phNo;
}
@end

@implementation BS1ViewController

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.webview.opaque = NO;
    [self.view hideActivityView];
}

- (IBAction)btnhome:(id)sender {
     FeedViewController *VC1=[[FeedViewController alloc]init];
        [self.navigationController pushViewController:VC1 animated:YES];
    }
- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
       [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)btnfaq:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self callnetconnection];
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
    graphView.backgroundColor = [UIColor clearColor];
    
    GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
       graphView1.backgroundColor = [UIColor clearColor];
    
    
       [self.view_footer1 addSubview:graphView];
    [self.view_footer2 addSubview:graphView1];
    self.navigationController.navigationBar.hidden=YES;
    [self.view showActivityViewWithLabel:@"Loading"];
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
       NSString *url=@"https://w2.sisuroot.com/servicebus/sosnumbernew.php?id=";
       NSString *url1=[url stringByAppendingString:i];
       [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
       [_webview setBackgroundColor:[UIColor clearColor]];
       [_webview setOpaque:NO];
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
