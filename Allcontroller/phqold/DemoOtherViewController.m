#import "DemoOtherViewController.h"
#import "FeedViewController.h"
#import "SWRevealViewController.h"
#import "FeedViewController.h"
#import "FriendsViewController.h"
#import "SelectContactViewController.h"
#import "Reachability.h"
#import "UIView+RNActivityView.h"
@interface DemoOtherViewController ()
{
    NSString *URLneme;
    NSURL *url;
    NSString *checkstr;
}
@end

@implementation DemoOtherViewController

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.view hideActivityView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [FIRAnalytics setScreenName:@"Demographic Form" screenClass:@"Demographic Form"];
    [self.view showActivityViewWithLabel:@"Loading"];
    [self callnetconnection];
    self.navigationController.navigationBar.hidden=YES;
    _MenuBtnobj.hidden=YES;
    _footerlbl.hidden=YES;
    _quizstmtlbl.hidden=YES;
    if ([_demostr isEqualToString:@"demostr"])
    {
        _backbtnobj.hidden=YES;
        _homebtnobj.hidden=YES;
    }
    [_webview setDelegate:self];
    checkstr=@"https://w2.sisuroot.com/servicebus/thankyou.php";
    if ([_typeString isEqualToString:@"demo1"])
    {
        _headerLbl.text=@"Tell us about yourself";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w2.sisuroot.com/servicebus/Demographicform_2_therapy.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    else if([_typeString isEqualToString:@"demo2"])
    {
        _headerLbl.text=@"Tell us about yourself";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w2.sisuroot.com/servicebus/Demographicform_3_teens.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    else if([_typeString isEqualToString:@"demo3"])
    {
        _headerLbl.text=@"Tell us about yourself";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w2.sisuroot.com/servicebus/Demographicform_4_PPD.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    else if([_typeString isEqualToString:@"demo4"])
    {
        _headerLbl.text=@"Dietary info form";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w2.sisuroot.com/servicebus/DietaryInfo.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    else if([_typeString isEqualToString:@"Quiz1"])
    {
        _footerlbl.hidden=NO;
        _quizstmtlbl.hidden=NO;
        _quizstmtlbl.text=@"Dairy Quiz";
        _headerLbl.text=@"Quiz Time";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
       // NSString *url=@"https://w2.sisuroot.com/DairyQuiz.php?id=";
        NSString *url=@"https://w1.sisuroot.com/DairyQuizv3.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    else if([_typeString isEqualToString:@"Quiz2"])
    {
        _footerlbl.hidden=NO;
        _quizstmtlbl.hidden=NO;
        _quizstmtlbl.text=@"Vegetable Quiz";
        _headerLbl.text=@"Quiz Time";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w1.sisuroot.com/VegetableQuizv3.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    else if([_typeString isEqualToString:@"Quiz3"])
    {
        _footerlbl.hidden=NO;
        _quizstmtlbl.hidden=NO;
        _quizstmtlbl.text=@"Protein Foods Quiz";
        _headerLbl.text=@"Quiz Time";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w1.sisuroot.com/ProteinFoodsQuizv3.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    else if([_typeString isEqualToString:@"Quiz4"])
    {
       _footerlbl.hidden=NO;
        _quizstmtlbl.hidden=NO;
        _quizstmtlbl.text=@"Fruit Quiz";
        _headerLbl.text=@"Quiz Time";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w1.sisuroot.com/FruitQuizv3.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
    else if([_typeString isEqualToString:@"Quiz5"])
    {
        _footerlbl.hidden=NO;
        _quizstmtlbl.hidden=NO;
        _quizstmtlbl.text=@"Grains Quiz";
        _headerLbl.text=@"Quiz Time";
        NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
        NSString *url=@"https://w1.sisuroot.com/GrainsQuizv3.php?id=";
        NSString *url1=[url stringByAppendingString:i];
        [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = request.URL;
    //NSString *url1=url;
    NSString *urlString = [url absoluteString];
    URLneme=url;
    if ([urlString isEqualToString:@"https://w2.sisuroot.com/servicebus/cancel.php"]) {
        FeedViewController *fvc=[[FeedViewController alloc]init];
        [self.navigationController pushViewController:fvc animated:YES];
        return YES;
    }
    
    else if ([urlString isEqualToString:@"https://w2.sisuroot.com/servicebus/invite.php"]){
        // Process data from form
        // URLneme=@"https://w2.sisuroot.com/servicebus/cancel.php";
        SelectContactViewController *EVC=[[SelectContactViewController alloc]init];
        [EVC setStr1:@"done"];
        [self.navigationController pushViewController:EVC animated:YES];
        return NO;
    }
    return YES;
}
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

// Do any additional setup after loading the view from its nib.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)AgreeBtnAction:(id)sender {
    FeedViewController *fvc=[[FeedViewController alloc]init];
    [self.navigationController pushViewController:fvc animated:YES];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
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
