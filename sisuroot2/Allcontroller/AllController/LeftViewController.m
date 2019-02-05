//
//  LeftViewController.m
//  Root_App
//
//  Created by BRIJESH KUMAR on 14/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftMenuTableViewCell.h"
#import "EditViewController.h"
#import "SWRevealViewController.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "FriendsViewController.h"
#import "SettingViewController.h"
#import "FrontViewController.h"
#import "ResponseViewController.h"
#import "FeedViewController.h"
#import "BriefstartViewController.h"
#import "PHQ9ViewController.h"
#import "DemoGraphicViewController.h"
#import "Bs2ViewController.h"
#import "PHQ8ViewController.h"
#import "EmotionViewController.h"
#import "TestlistViewController.h"
#import "VoiceTestViewController.h"
#import "DemoOtherViewController.h"

//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
#import "BS6ViewController.h"

@interface LeftViewController ()
{
    NSMutableArray *titles;
    NSMutableArray *imgarr;
    NSArray *listarray;
}

@end

@implementation LeftViewController
-(void)viewDidAppear:(BOOL)animated
{
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self callfetchprofile];
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self callfetchprofile];
    
    self.navigationController.navigationBar.hidden=YES;
    
    //    _Profilepicbtnobj.layer.cornerRadius=35;
    //    _Profilepicbtnobj.clipsToBounds=YES;
    //    _Profilepicbtnobj.layer.borderWidth=1;
    //    _Profilepicbtnobj.layer.borderColor = [UIColor whiteColor].CGColor;
    _profilepicimg.layer.cornerRadius=35;
    _profilepicimg.clipsToBounds=YES;
    _profilepicimg.layer.borderWidth =2;
    _profilepicimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    
    _LogoutBtnobj.layer.cornerRadius=16;
    _LogoutBtnobj.clipsToBounds=YES;
    
    _LogoutBtnobj.layer.borderWidth =1;
    _LogoutBtnobj.layer.borderColor = [UIColor whiteColor].CGColor;
    // Do any additional setup after loading the view from its nib.
    //
    titles=[[NSArray alloc]initWithObjects:@"HOME",@"FRIEND CIRCLE",@"NOTIFICATIONS",@"SETTINGS",@"TEST",@"DEMOGRAPHIC FORM",@"BUG REPORT",@"LOGOUT",nil];
    imgarr=[[NSArray alloc]initWithObjects:@"icons8-home.png",@"dashboard_icon_friends_white.png",@"notification.png",@"settings1.png",@"test.png",@"forms.png",@"Feedback.png",@"logout-2.png",nil];
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
    
    cell.liststmtlbl.text=[titles objectAtIndex:indexPath.row];
    cell.listiconimg.image = [UIImage imageNamed:[imgarr objectAtIndex:indexPath.row]];
    
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
    //    else if (indexPath.row==1)
    //    {
    //        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //        [tracker set:kGAIScreenName value:@"click on feed button"];
    //        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //
    //                SWRevealViewController *revealController = [self revealViewController];
    //                FeedViewController *OVC=[[FeedViewController alloc]init];
    //                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
    //                [revealController pushFrontViewController:nav animated:YES];
    //               [OVC setStr2:@"feed"];
    //
    //
    //    }
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
        SettingViewController *HVC=[[SettingViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:HVC];
        [revealController pushFrontViewController:nav animated:YES];
        [HVC setStr1:@"done"];
    }
    
    else if(indexPath.row==4)
    {
        SWRevealViewController *revealController = [self revealViewController];
        TestlistViewController *LVC=[[TestlistViewController alloc]init];
        [LVC setListarray12:listarray];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
        [revealController pushFrontViewController:nav animated:YES];
        
    }
    else if(indexPath.row==5)
    {
        
        // [[NSUserDefaults standardUserDefaults] setValue:@" " forKey:@"id"];
        
        SWRevealViewController *revealController = [self revealViewController];
        PHQ8ViewController *LVC=[[PHQ8ViewController alloc]init];
        [LVC setListarray12:listarray];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
        [revealController pushFrontViewController:nav animated:YES];
 
     }
    else if(indexPath.row==6)
    {
        SWRevealViewController *revealController = [self revealViewController];
        EmotionViewController *LVC=[[EmotionViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
        [revealController pushFrontViewController:nav animated:YES];
        
    }
//       else if(indexPath.row==7)
//        {
//
//            SWRevealViewController *revealController = [self revealViewController];
//            DemoOtherViewController *LVC=[[DemoOtherViewController alloc]init];
//            [LVC setTypeString:@"quiz"];
//
//            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
//            [revealController pushFrontViewController:nav animated:YES];
//
//
//        }
    
    else if(indexPath.row==7)
    {
        [self calllogout];
        
    }
    
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
    return 45;
}


- (IBAction)profilepicBtn:(id)sender {
    
   
    SWRevealViewController *revealController = [self revealViewController];
    
    EditViewController *Evc=[[EditViewController alloc]init];
    // [self.navigationController pushViewController:Evc animated:YES];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Evc];
    [revealController pushFrontViewController:nav animated:YES];
    
    
}
- (IBAction)LogoutBtn:(id)sender {
    [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"id"];
    
    SWRevealViewController *revealController = [self revealViewController];
    
    FrontViewController *LVC=[[FrontViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
    [revealController pushFrontViewController:nav animated:YES];
    // [LVC setLogoutstr:@"logout"];
    
}
-(void)callfetchprofile
{
    //hud.hidden=NO;
    
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
            //hud.hidden=YES;
            listarray =[responseDictionary valueForKey:@"data"];
             //  [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserImage"] forKey:@"UserImage"];
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Phq_Test_Status"] forKey:@"Phq_Test_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Brief_State_Status"] forKey:@"Brief_State_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Perceived_Status"] forKey:@"Perceived_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Sisuchat_Status"] forKey:@"Sisuchat_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] forKey:@"Chat_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Demographic_Form_Group_Status"] forKey:@"Demographic_Form_Group_Status"];
            
 
             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"AddTagReminderStatus"] forKey:@"AddTagReminderStatus"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"TestReminderStatus"] forKey:@"TestReminderStatus"];
            
            _Usernamelbl.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
            
              [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"TagRedAlertInnerCircle"] forKey:@"TagRedAlertInnerCircle"];
            
            //            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"UserPassword"] isEqual:(id)[NSNull null]])
            //            {
            //                _passwordTF.text = @"";
            //
            //            }
            //            else
            //            {
            //                _passwordTF.text = [[responseDictionary valueForKey:@"data"] valueForKey:@"UserPassword"];
            //
            //            }
            // _PhoneTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"UserPhone"];
            
            
            //
            //            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"UserPhone"] isEqual:(id)[NSNull null]])
            //            {
            //                _PhoneTF.text=@"";
            //
            //            }
 
            NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
 
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _profilepicimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                [_profilepicimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _profilepicimg.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                [_profilepicimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _profilepicimg.contentMode=UIViewContentModeScaleToFill;
            }
            
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"logout"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"id"];
           
            
            SWRevealViewController *revealController = [self revealViewController];
            FrontViewController *LVC=[[FrontViewController alloc]init];
            
            [LVC setLogoutstr:@"logout"];
            
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

