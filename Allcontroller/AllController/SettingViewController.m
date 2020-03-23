//
//  SettingViewController.m
//  Root_App
//
//  Created by BRIJESH KUMAR on 25/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.

#import "SettingViewController.h"
#import "SettingTableViewCell.h"
#import "SWRevealViewController.h"
#import "EditViewController.h"
#import "Base64.h"
#import "UIView+RNActivityView.h"
#import "MyWebserviceManager.h"
#import "Bs3ViewController.h"
#import "SelectAccountViewController.h"
#import "UIImageView+WebCache.h"
#import "FriendsViewController.h"
#import "FeedViewController.h"
#import "chattypeViewController.h"
#import "smilepage1ViewController.h"
#import "GraphView.h"
#import "LoginViewController.h"
#import "GraphView1.h"
#import "Sisuroot-Swift.h"
#import "ChangePasswordViewController.h"
#import "RateonappViewController.h"
#import "FriendsaddViewController.h"
#import "BS1ViewController.h"
//#import "GAIFields.h"
//#import "GAILogger.h"

@interface SettingViewController ()
{
    NSMutableArray *Array;
    NSMutableArray *imgarr;
    NSString *count;
    NSString *AddTagReminderStatus;
    NSString *TestReminderStatus;
    NSString *reminder;
    NSString *TagRedAlertInnerCircle;
}

@end

@implementation SettingViewController
- (IBAction)btn_home:(id)sender {
    FeedViewController *VC1=[[FeedViewController alloc]init];
    
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnqa:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)editprofile:(id)sender {
    SWRevealViewController *revealController = [self revealViewController];
    EditViewController *Evc=[[EditViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:Evc];
    [revealController pushFrontViewController:nav animated:YES];
}



- (IBAction)btnchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (void)viewDidLoad {
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
    graphView.backgroundColor = [UIColor clearColor];
    GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
    graphView1.backgroundColor = [UIColor clearColor];
    [self.view_footer1 addSubview:graphView];
    [self.view_footer2 addSubview:graphView1];
    [super viewDidLoad];
     [FIRAnalytics setScreenName:@"Setting" screenClass:@"Setting"];
    _MenuBtnobj.hidden=YES;
    self.navigationController.navigationBar.hidden=YES;
    
      _user_image.layer.cornerRadius=35;
      _user_image.clipsToBounds=YES;
    _user_image.layer.borderWidth =1;
       _user_image.layer.borderColor = [UIColor whiteColor].CGColor;
      
    
    [self.view showActivityViewWithLabel:@"Loading"];
       
    [self callfetchprofile];
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"AddTagReminderStatus"] isEqual:@"1"])
    {
        
        AddTagReminderStatus=@"1";
    }
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"TestReminderStatus"] isEqual:@"1"])
    {
        
        TestReminderStatus=@"1";
    }
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"TagRedAlertInnerCircle"] isEqual:@"1"])
    {
        
        TagRedAlertInnerCircle=@"1";
    }
    _upgradeBtnobj.layer.cornerRadius=6;
     _upgradeBtnobj.clipsToBounds=YES;
    
    Array=[[NSMutableArray alloc]initWithObjects:@"Profile",@"Rate on App",@"Invite to Root",@"Help and FAQ",@"Logout ",@"Allow Tag Reminder",@"Allow Test Reminder",@"Allow Red flags sharing with inner circle",@"Change Password", nil];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];

    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
 
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];

    if ([_str1 isEqualToString:@"done"])
    {
        _backBtnobj.hidden=YES;
        _MenuBtnobj.hidden=NO;
        
    }
    _EDITPROFILE.layer.cornerRadius=13;
    _EDITPROFILE.clipsToBounds=YES;
    
    _EDITPROFILE.layer.borderWidth =1;
    _EDITPROFILE.layer.borderColor = [UIColor whiteColor].CGColor;
    _profileBtnobj1.layer.cornerRadius=20;
    _profileBtnobj1.clipsToBounds=YES;
    
    _profileBtnobj1.layer.borderWidth =2;
    _profileBtnobj1.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Array.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"ListtableView";
    
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SettingTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
     }
    cell.switchobj.hidden=YES;
    cell.switchobj.tag = indexPath.row;
    [cell.switchobj addTarget:self action:@selector(SwitchAction:) forControlEvents:UIControlEventTouchUpInside];
     if (indexPath.row == 5)
    {
        cell.switchobj.hidden=NO;
        if ([AddTagReminderStatus isEqual:@"1"] || [AddTagReminderStatus integerValue]==1)
        {
            cell.switchobj.on = YES;
        }
        else
        {
           cell.switchobj.on = NO;
        }
      }
    if (indexPath.row == 6)
    {
        [cell.switchobj isEnabled];
        cell.switchobj.hidden=NO;
        if ([TestReminderStatus isEqual:@"1"] || [TestReminderStatus integerValue]==1)
        {
          cell.switchobj.on = YES;
        }
        else
        {
           cell.switchobj.on = NO;
        }
    }
    if (indexPath.row == 7)
    {
        [cell.switchobj isEnabled];
       cell.switchobj.hidden=NO;
        
        if ([TagRedAlertInnerCircle isEqual:@"1"] || [TagRedAlertInnerCircle integerValue]==1)
        {
            cell.switchobj.on = YES;
        }
        else
        {
            cell.switchobj.on = NO;
        }
    }
    if (indexPath.row==3)
    {
        cell.listlblobj.textColor=[UIColor lightGrayColor];
    }
    
    cell.listlblobj.text=[Array objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        SWRevealViewController *revealController = [self revealViewController];
        EditViewController *HVC=[[EditViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:HVC];
        [revealController pushFrontViewController:nav animated:YES];
    }
    if (indexPath.row==1)
    {
        SWRevealViewController *revealController = [self revealViewController];
        RateonappViewController *HVC=[[RateonappViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:HVC];
        [revealController pushFrontViewController:nav animated:YES];
    }
    else if (indexPath.row==2)
    {
        FriendsaddViewController *FVC=[[FriendsaddViewController alloc]init];
        [self.navigationController pushViewController:FVC animated:YES];
//        SWRevealViewController *revealController = [self revealViewController];
//        FriendsViewController *OVC=[[FriendsViewController alloc]init];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
//        [revealController pushFrontViewController:nav animated:YES];
//        [OVC setStr1:@"done"];
    }
    else if (indexPath.row==3)
    {
        
    }
    else if (indexPath.row==4)
    {
       [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"id"];
       SWRevealViewController *revealController = [self revealViewController];
       LoginViewController *LVC=[[LoginViewController alloc]init];
       UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
       [revealController pushFrontViewController:nav animated:YES];
    }
//    else if (indexPath.row==5)
//    {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
//    }
    else if (indexPath.row==8)
    {
        SWRevealViewController *revealController = [self revealViewController];
        ChangePasswordViewController *HVC=[[ChangePasswordViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:HVC];
        [revealController pushFrontViewController:nav animated:YES];
    }
}

-(void)SwitchAction : (UISwitch *) btn
 {
    
     if ([btn isOn])
     {
        if (btn.tag==6)
         {
             AddTagReminderStatus=@"1";
             count=@"Tag";
             reminder=@"1";
             MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
             NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
             [dict setValue:@"AllowReminder" forKey:@"name"];
             NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
             //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
             [dict1 setValue:count forKey:@"type"];
             [dict1 setValue:AddTagReminderStatus forKey:@"status"];
             [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
             [webServiceManager setDelegateMethode:self];
             [webServiceManager callMyWebServiceManager:@"AllowReminder" :dict :dict1];
         }
         else if (btn.tag==7)
         {
             TestReminderStatus=@"1";
             count=@"Test";
             reminder=@"1";
             MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
             NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
             [dict setValue:@"AllowReminder" forKey:@"name"];
             NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
             //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
             [dict1 setValue:count forKey:@"type"];
             [dict1 setValue:TestReminderStatus forKey:@"status"];
             
             [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
             [webServiceManager setDelegateMethode:self];
             [webServiceManager callMyWebServiceManager:@"AllowReminder" :dict :dict1];
         }
         
         else if (btn.tag==8)
         {
             TagRedAlertInnerCircle=@"1";
             count=@"RedALertInner";
             reminder=@"1";
             MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
             NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
             [dict setValue:@"AllowReminder" forKey:@"name"];
             NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
             //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
             [dict1 setValue:count forKey:@"type"];
             [dict1 setValue:TagRedAlertInnerCircle forKey:@"status"];
             [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
             [webServiceManager setDelegateMethode:self];
             [webServiceManager callMyWebServiceManager:@"AllowReminder" :dict :dict1];
         }
     }
     else
     {
        if (btn.tag==6)
         {
             AddTagReminderStatus=@"0";
             count=@"Tag";
             reminder=@"0";
             
             MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
             NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
             [dict setValue:@"AllowReminder" forKey:@"name"];
             
             NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
             //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
             [dict1 setValue:count forKey:@"type"];
             [dict1 setValue:AddTagReminderStatus forKey:@"status"];
             
             [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
             
             [webServiceManager setDelegateMethode:self];
             [webServiceManager callMyWebServiceManager:@"AllowReminder" :dict :dict1];

         }
         else if (btn.tag==7)
         {
             TestReminderStatus=@"0";
            count=@"Test";
             reminder=@"0";
 MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
             NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
             [dict setValue:@"AllowReminder" forKey:@"name"];
             NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
             [dict1 setValue:count forKey:@"type"];
             [dict1 setValue:TestReminderStatus forKey:@"status"];
             [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
             [webServiceManager setDelegateMethode:self];
             [webServiceManager callMyWebServiceManager:@"AllowReminder" :dict :dict1];
             
         }
         else if (btn.tag==8)
         {
             TagRedAlertInnerCircle=@"0";
             count=@"RedALertInner";
             reminder=@"0";
             MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
             NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
             [dict setValue:@"AllowReminder" forKey:@"name"];
             
             NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
            [dict1 setValue:count forKey:@"type"];
             [dict1 setValue:TagRedAlertInnerCircle forKey:@"status"];
             
             [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
             [webServiceManager setDelegateMethode:self];
             [webServiceManager callMyWebServiceManager:@"AllowReminder" :dict :dict1];
             
         }
     }
 }

- (IBAction)BackBtnAction:(id)sender {
   
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)SosBtnAction:(id)sender {
   BS1ViewController *BSVC=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:BSVC animated:YES];
}

-(void)callfetchprofile
{
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
             
           _lbl_username.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
//            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"SOS_Status"] isEqual:@"0"])
//            {
//                [_Sosbtnobj setUserInteractionEnabled:YES];
//             }
//            else
//            {
//
//                 _Sosbtnobj.alpha = 0.5;
//                 [_Sosbtnobj setUserInteractionEnabled:NO];
//
//            }
             NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
             if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _user_image.image = [UIImage imageNamed:@"user.png"];
                
            }
            
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                  [_user_image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                
                _user_image.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                [_user_image setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _user_image.contentMode=UIViewContentModeScaleToFill;
            }
               [self.view hideActivityView];
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"AllowReminder"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
        }
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
   [self.view hideActivityView];
   NSLog(@"error");
}

- (IBAction)UpgradeBtn:(id)sender
{
    SelectAccountViewController *Svc=[[SelectAccountViewController alloc] init];
    [self.navigationController pushViewController:Svc animated:YES];
}

@end
