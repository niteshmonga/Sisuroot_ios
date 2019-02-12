
#import "PHQ9ViewController.h"
#import "BriefstartViewController.h"
#import "SWRevealViewController.h"
#import "PPDTest1ViewController.h"
#import "Bs3ViewController.h"
#import "FeedViewController.h"
#import "MyWebserviceManager.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface PHQ9ViewController ()

@end
@implementation PHQ9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callfetchprofile];
    self.navigationController.navigationBar.hidden=YES;

    _Btn2obj.layer.cornerRadius=18;
    _Btn2obj.clipsToBounds=YES;
    _Btn3obj.layer.cornerRadius=18;
    _Btn3obj.clipsToBounds=YES;
    _Btn4obj.layer.cornerRadius=18;
    _Btn4obj.clipsToBounds=YES;
    _Btn5obj.layer.cornerRadius=18;
    _Btn5obj.clipsToBounds=YES;
    // Do any additional setup after loading the view from its nib.

    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)NotatallBtnAction:(id)sender {
    
//    PercievedViewController *BSV=[[PercievedViewController alloc]init];
//    [BSV setBrief6str:@"brief6str"];
//    [self.navigationController pushViewController:BSV animated:YES];
}

- (IBAction)Btn2Action:(id)sender {
    BriefstartViewController *LVC1=[[BriefstartViewController alloc]init];
   
    [LVC1 setIdenstr:@"idenstr1"];
    [self.navigationController pushViewController:LVC1 animated:YES];
}

- (IBAction)Btn3Action:(id)sender {
    BriefstartViewController *LVC2=[[BriefstartViewController alloc]init];
   
    [LVC2 setIdenstr:@"idenstr"];
    [self.navigationController pushViewController:LVC2 animated:YES];
}

- (IBAction)Btn4Action:(id)sender {
    BriefstartViewController *LVC3=[[BriefstartViewController alloc]init];
    
    [LVC3 setIdenstr:@"PERCEIVED"];
    [self.navigationController pushViewController:LVC3 animated:YES];
}

- (IBAction)SkipBtnAction:(id)sender {
//    PercievedViewController *BSV=[[PercievedViewController alloc]init];
//    [BSV setBrief6str:@"brief6str"];
//    [self.navigationController pushViewController:BSV animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)Btn5Action:(id)sender {
    
    Bs3ViewController *LVC3=[[Bs3ViewController alloc]init];
    
    //[LVC3 setIdenstr:@"PPDTEST"];
    [self.navigationController pushViewController:LVC3 animated:YES];
}
- (IBAction)HomeBtnAction:(id)sender {
    
    FeedViewController *LVC3=[[FeedViewController alloc]init];
    
     [self.navigationController pushViewController:LVC3 animated:YES];
}

-(void)callfetchprofile
{
    // hud.hidden=NO;
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
    
}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            
            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Brief_State_Status"] isEqual:@"0"]) {
                
                if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"BriefStatus"] isEqual:@"0"]) {
                    
                    
                }
                else
                {
                    _iconimg1.image = [UIImage imageNamed:@"Perceived1.png"];
                    
                    [_Btn2obj setBackgroundColor: [[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0]];
                }
            }
            else
            {
                [_Btn2obj setUserInteractionEnabled:NO];
                 [_Btn2obj setBackgroundColor: [UIColor grayColor]];
                
            }
            
            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Phq_Test_Status"] isEqual:@"0"]) {
                
                if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"PhqStatus"] isEqual:@"0"]) {
                    
                    
                }
                else
                {
                    _iconimg2.image = [UIImage imageNamed:@"Perceived1.png"];
                    
                    [_Btn3obj setBackgroundColor: [[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0]];
                }
            }
            else
            {
                [_Btn3obj setUserInteractionEnabled:NO];
                [_Btn3obj setBackgroundColor: [UIColor grayColor]];

            }
            
            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Perceived_Status"] isEqual:@"0"]) {
                
                if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"PerceivedStatus"] isEqual:@"0"]) {
                    
                    
                }
                else
                {
                    _iconimg3.image = [UIImage imageNamed:@"Perceived1.png"];
                    
                    [_Btn4obj setBackgroundColor: [[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0]];
                }
            }
            else
            {
                [_Btn4obj setUserInteractionEnabled:NO];
                [_Btn4obj setBackgroundColor: [UIColor grayColor]];

            }
            
            
            
            
//            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"PPDTestSecD_Group_Status"] isEqual:@"0"])
//            {
//                if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"PPDTestSecD_Status"] isEqual:@"0"]) {
//
//
//                }
//                else
//                {
//                    [_Btn5obj setBackgroundColor:[UIColor blueColor]];
//
//                }
//
//            }
//            else
//            {
//                [_Btn5obj setUserInteractionEnabled:NO];
//
//
//            }
            
        }
        
    }
    
}
@end
