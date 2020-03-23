
#import "LeftViewController.h"
#import "LeftMenuTableViewCell.h"
#import "EditViewController.h"
#import "SWRevealViewController.h"
#import "LoginViewController.h"
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "FriendsViewController.h"
#import "SettingViewController.h"
#import "ResponseViewController.h"
#import "FeedViewController.h"
#import "BriefstartViewController.h"
#import "DemoGraphicViewController.h"
#import "PHQ8ViewController.h"
#import "EmotionViewController.h"
#import "TestlistViewController.h"
#import "DemoOtherViewController.h"
#import "ResourcesViewController.h"
#import "FriendRequestViewController.h"
@interface LeftViewController ()
{
    NSMutableArray *titles;
    NSMutableArray *imgarr;
    NSArray *listarray;
}

@end

@implementation LeftViewController
- (IBAction)btn_cross:(id)sender {
    SWRevealViewController *revealController = [self revealViewController];
    FeedViewController *OVC=[[FeedViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
    [revealController pushFrontViewController:nav animated:YES];
    [OVC setStr2:@"feed"];
}
-(void)viewDidAppear:(BOOL)animated
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self callfetchprofile];
}
- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer
{
     SWRevealViewController *revealController = [self revealViewController];
     EditViewController *Evc=[[EditViewController alloc]init];
     UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Evc];
     [revealController pushFrontViewController:nav animated:YES];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
     [FIRAnalytics setScreenName:@"SlideMenu" screenClass:@"SlideMenu"];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self callfetchprofile];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self.view_edit addGestureRecognizer:tapGestureRecognizer];
    tapGestureRecognizer.delegate = self;
    self.navigationController.navigationBar.hidden=YES;
    
    _Profilepicbtnobj.layer.cornerRadius=13;
    _Profilepicbtnobj.clipsToBounds=YES;
    _Profilepicbtnobj.layer.borderWidth=1;
    _Profilepicbtnobj.layer.borderColor = [UIColor whiteColor].CGColor;
    _profilepicimg.layer.cornerRadius=33;
    _profilepicimg.clipsToBounds=YES;
    _profilepicimg.layer.borderWidth =2;
    _profilepicimg.layer.borderColor = [UIColor whiteColor].CGColor;
    _LogoutBtnobj.layer.cornerRadius=16;
    _LogoutBtnobj.clipsToBounds=YES;
    _LogoutBtnobj.layer.borderWidth =1;
    _LogoutBtnobj.layer.borderColor = [UIColor whiteColor].CGColor;
    // Do any additional setup after loading the view from its nib.
    titles=[[NSArray alloc]initWithObjects:@"Home",@"Friend Circle",@"Notification",@"Friend Request",@"Setting",@"Test",@"Demographic Form",@"Resources",@"Feedback",nil];
    imgarr=[[NSArray alloc]initWithObjects:@"homes",@"frcir",@"noti",@"frreq",@"setting",@"test",@"demform",@"resource",@"feedback",nil];
    //@"icons8-voice_presentation.png",,@"VOICE TEST"
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titles.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"LeftMenuTableView";
    LeftMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LeftMenuTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.notificationlbl.text=[listarray valueForKey:@"AlertCount"];
    cell.notificationlbl.hidden=YES;
    cell.liststmtlbl.text=[titles objectAtIndex:indexPath.row];
    cell.listiconimg.image = [UIImage imageNamed:[imgarr objectAtIndex:indexPath.row]];
      cell.listiconimg.contentMode=UIViewContentModeScaleToFill;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        SWRevealViewController *revealController = [self revealViewController];
        FeedViewController *OVC=[[FeedViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
        [revealController pushFrontViewController:nav animated:YES];
        [OVC setStr2:@"feed"];
        
    }
    else if (indexPath.row==1)
    {
        SWRevealViewController *revealController = [self revealViewController];
        FriendsViewController *OVC=[[FriendsViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
        [revealController pushFrontViewController:nav animated:YES];
        [OVC setStr1:@"done"];
    }
    
    
    else if (indexPath.row==2)
    {
        
        SWRevealViewController *revealController = [self revealViewController];
        ResponseViewController *OVC=[[ResponseViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
        [revealController pushFrontViewController:nav animated:YES];
        [OVC setStr2:@"done"];
    }
    else if (indexPath.row==3)
    {
        
        SWRevealViewController *revealController = [self revealViewController];
               FriendRequestViewController *OVC=[[FriendRequestViewController alloc]init];
               UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
               [revealController pushFrontViewController:nav animated:YES];
               [OVC setStr1:@"done"];
      }
    
    else if(indexPath.row==4)
    {
        
        SWRevealViewController *revealController = [self revealViewController];
        SettingViewController *HVC=[[SettingViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:HVC];
        [revealController pushFrontViewController:nav animated:YES];
        [HVC setStr1:@"done"];
        
       
        
    }
    else if(indexPath.row==5)
    {
        SWRevealViewController *revealController = [self revealViewController];
        TestlistViewController *LVC=[[TestlistViewController alloc]init];
        [LVC setListarray12:listarray];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
        [revealController pushFrontViewController:nav animated:YES];
        // [[NSUserDefaults standardUserDefaults] setValue:@" " forKey:@"id"];
        
      
        
    }
    
    else if(indexPath.row==6)
    {
        SWRevealViewController *revealController = [self revealViewController];
        PHQ8ViewController *LVC=[[PHQ8ViewController alloc]init];
        [LVC setListarray12:listarray];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
        [revealController pushFrontViewController:nav animated:YES];
        
        // [[NSUserDefaults standardUserDefaults] setValue:@" " forKey:@"id"];
        
      
        
    }
    else if(indexPath.row==7)
    {
        SWRevealViewController *revealController = [self revealViewController];
        ResourcesViewController *LVC=[[ResourcesViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
        [revealController pushFrontViewController:nav animated:YES];
        
       
        
    }
    else if(indexPath.row==8)
    {
        SWRevealViewController *revealController = [self revealViewController];
        EmotionViewController *LVC=[[EmotionViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
        [revealController pushFrontViewController:nav animated:YES];
    }
//    else if(indexPath.row==9)
//    {
//        SWRevealViewController *revealController = [self revealViewController];
//        BlockedListViewController *LVC=[[BlockedListViewController alloc]init];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
//        [revealController pushFrontViewController:nav animated:YES];
//    }
   // else if(indexPath.row==10)
//    {
//        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
//        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//        // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
//        NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
//
//      if([[[NSUserDefaults standardUserDefaults] valueForKey:@" "]isEqualToString:[dateFormatter stringFromDate:[NSDate date]]])
//      {
//        SWRevealViewController *revealController = [self revealViewController];
//        question_mood2ViewController *LVC=[[question_mood2ViewController alloc]init];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
//        [revealController pushFrontViewController:nav animated:YES];
//      }
//        else
//        {
//            SWRevealViewController *revealController = [self revealViewController];
//            question_mood1ViewController *LVC=[[question_mood1ViewController alloc]init];
//            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
//            [revealController pushFrontViewController:nav animated:YES];
//        }
//    }
   // else if(indexPath.row==9)
   // {
        
      //  [self calllogout];
   // }
}

-(void)calllogout
{
   MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"logout" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];

    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"logout" :dict :dict1];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 47;
}


- (IBAction)profilepicBtn:(id)sender {
    SWRevealViewController *revealController = [self revealViewController];
    EditViewController *Evc=[[EditViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Evc];
    [revealController pushFrontViewController:nav animated:YES];
}
- (IBAction)LogoutBtn:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"id"];
    SWRevealViewController *revealController = [self revealViewController];
    
    LoginViewController *LVC=[[LoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
    [revealController pushFrontViewController:nav animated:YES];
}
-(void)callfetchprofile
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
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
            listarray =[responseDictionary valueForKey:@"data"];
            
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"phq2_status_remind"] forKey:@"phq2_status_remind"];

            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Phq_Test_Status"] forKey:@"Phq_Test_Status"];
           // [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"activity_ans_date"] forKey:@"activity_ans_date"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Brief_State_Status"] forKey:@"Brief_State_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Perceived_Status"] forKey:@"Perceived_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Sisuchat_Status"] forKey:@"Sisuchat_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] forKey:@"Chat_Status"];
            
             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Voice_Test_StatusA"] forKey:@"Voice_Test_StatusA"];
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Voice_Test_StatusB"] forKey:@"Voice_Test_StatusB"];
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Voice_Test_StatusC"] forKey:@"Voice_Test_StatusC"];
            
             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Demographic_Form_Group_Status"] forKey:@"Demographic_Form_Group_Status"];
 
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"AddTagReminderStatus"] forKey:@"AddTagReminderStatus"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"TestReminderStatus"] forKey:@"TestReminderStatus"];
            
            _Usernamelbl.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"TagRedAlertInnerCircle"] forKey:@"TagRedAlertInnerCircle"];
            
             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"NZ_Group_status"] forKey:@"NZ_Group_status"];
            
              NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _profilepicimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                 [_profilepicimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                
              //  [_profilepicimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://rootapp.epiksolution.org /servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _profilepicimg.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                [_profilepicimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _profilepicimg.contentMode=UIViewContentModeScaleToFill;
            }
            
        }
        [_profilelisttableview reloadData];
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"logout"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [[NSUserDefaults standardUserDefaults] setValue:@"0" forKey:@"id"];
             [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"activity_ans_date"];
            [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"activity_ans_date1"];
            SWRevealViewController *revealController = [self revealViewController];
            //FrontViewController *LVC=[[FrontViewController alloc]init];
            LoginViewController *LVC=[[LoginViewController alloc]init];
            //[LVC setLogoutstr:@"logout"];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
            [revealController pushFrontViewController:nav animated:YES];
            //
        }
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
    // ActivityIdenter.hidden=NO;
    
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
}



@end

