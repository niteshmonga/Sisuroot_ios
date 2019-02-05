
#import "FrontViewController.h"
#import "LoginViewController.h"
#import "SignupViewController.h"
#import "DemoGraphicViewController.h"
#import "TermsnconditionViewController.h"
#import "SWRevealViewController.h"
#import "LeftViewController.h"

//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface FrontViewController ()

@end

@implementation FrontViewController



-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

   // [self.navigationController.interactivePopGestureRecognizer requireGestureRecognizerToFail: myPanGestureRecognizer];
    SWRevealViewController *reveal = self.revealViewController;
    reveal.panGestureRecognizer.enabled = NO;
    reveal.tapGestureRecognizer.enabled = NO;

}


//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return NO;
//}

- (void)viewDidLoad { 
    [super viewDidLoad];
 
    
    self.navigationController.navigationBar.hidden=YES;
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    _loginBtnobj.layer.cornerRadius=24;
    _loginBtnobj.clipsToBounds=YES;
    
    //    _loginBtnobj.layer.borderWidth =1;
    //    _loginBtnobj.layer.borderColor = [UIColor whiteColor].CGColor;
    _signupBtnobj.layer.cornerRadius=24;
    _signupBtnobj.clipsToBounds=YES;
    
    _signupBtnobj.layer.borderWidth =1;
    _signupBtnobj.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    if ([_logoutstr isEqualToString:@"logout"])
    {
 
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;

    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LoginBtn:(id)sender {
    //    LoginViewController *myNewVC = [[LoginViewController alloc] init];
    //    myNewVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //
    //    [self presentModalViewController:myNewVC animated:YES];
    LoginViewController *LVC=[[LoginViewController alloc]init];
    
    //  self.navigationController.navigationBar.hidden=YES;
    [self.navigationController pushViewController:LVC animated:YES];
    
    
    // LVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    // myNewVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    // myNewVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //myNewVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    //  [self presentViewController:myNewVC animated:YES completion:nil];
}
- (IBAction)SignupBtn:(id)sender {
    // DemoGraphicViewController *Svc=[[DemoGraphicViewController alloc]init];
    
    SignupViewController *Svc=[[SignupViewController alloc]init];
     
    // self.navigationController.navigationBar.hidden=YES;
    [self.navigationController pushViewController:Svc animated:YES];
    
}
@end

