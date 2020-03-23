
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
     [FIRAnalytics setScreenName:@"Term and Condition" screenClass:@"Term and Condition"];
     NSString *i=[[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
    NSString *url=@"https://w2.sisuroot.com/servicebus/locationBasedTermandCondnew.php?id=";
    NSString *url1=[url stringByAppendingString:i];
    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url1]]];
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
-(void) processFailed :(NSError *)responseDictionary
{
    NSLog(@"error");
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

