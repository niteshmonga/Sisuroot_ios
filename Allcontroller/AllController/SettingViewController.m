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
#import "FrontViewController.h"
#import "Base64.h"
#import "ProfileViewController.h"
#import "UIView+RNActivityView.h"
#import "MyWebserviceManager.h"
#import "Bs3ViewController.h"
#import "SelectAccountViewController.h"
#import "UIImageView+WebCache.h"
#import "FriendsViewController.h"

//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
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

- (void)viewDidLoad {
    [super viewDidLoad];
     [FIRAnalytics setScreenName:@"Setting" screenClass:@"Setting"];
    _MenuBtnobj.hidden=YES;
    self.navigationController.navigationBar.hidden=YES;
    
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
    
    Array=[[NSMutableArray alloc]initWithObjects:@"Edit Profile",@"Rate on App Store",@"Invite to Root",@"Help and FAQ",@"Logout ",@"Access contact",@"Allow Tag Reminder",@"Allow Test Reminder",@"Allow Red flags sharing with inner circle", nil];
    
     imgarr=[[NSMutableArray alloc]initWithObjects:@"edit.png",@"app-store.png",@"invite_root.png",@"Help-and-faq.png",@"signout.png",@"access-contact.png",@"",@"",@"",nil];
    
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];

    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
 
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];

    if ([_str1 isEqualToString:@"done"])
    {
        _backBtnobj.hidden=YES;
        _MenuBtnobj.hidden=NO;
        
    }
    _profileiconimg.layer.cornerRadius=20;
    _profileiconimg.clipsToBounds=YES;
    
    _profileiconimg.layer.borderWidth =2;
    _profileiconimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
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
    
   // [cell.switchobj isOn];
    if (indexPath.row == 0)
    {
        cell.backlblobj.backgroundColor=[UIColor whiteColor];
        
    }
//    if (indexPath.row == 1)
//    {
//        cell.backlblobj.backgroundColor=[UIColor whiteColor];
//
//    }
    if (indexPath.row == 2)
    {
        cell.backlblobj.backgroundColor=[UIColor whiteColor];
        
    }
    if (indexPath.row == 4)
    {
        cell.backlblobj.backgroundColor=[UIColor whiteColor];
        
    }
    if (indexPath.row == 5)
    {
        cell.backlblobj.backgroundColor=[UIColor whiteColor];
        
    }
    if (indexPath.row == 6)
    {
 
        cell.backlblobj.backgroundColor=[UIColor whiteColor];
        cell.switchobj.hidden=NO;

        if ([AddTagReminderStatus isEqual:@"1"] || [AddTagReminderStatus integerValue]==1)
        {
            //[cell.switchobj isOn];
            //cell.switchobj.enabled = YES;
            cell.switchobj.on = YES;
        }
        else
        {
           // cell.switchobj.enabled = NO;
            cell.switchobj.on = NO;
        }
        
     }
    if (indexPath.row == 7)
    {
        [cell.switchobj isEnabled];

        cell.backlblobj.backgroundColor=[UIColor whiteColor];
        cell.switchobj.hidden=NO;

        if ([TestReminderStatus isEqual:@"1"] || [TestReminderStatus integerValue]==1)
        {
            //[cell.switchobj isOn];
            // cell.switchobj.enabled = YES;
            cell.switchobj.on = YES;
        }
        else
        {
            //cell.switchobj.enabled = NO;
            cell.switchobj.on = NO;

        }
    }
    if (indexPath.row == 8)
    {
        [cell.switchobj isEnabled];
        
        cell.backlblobj.backgroundColor=[UIColor whiteColor];
        cell.switchobj.hidden=NO;
        
        if ([TagRedAlertInnerCircle isEqual:@"1"] || [TagRedAlertInnerCircle integerValue]==1)
        {
            //[cell.switchobj isOn];
            // cell.switchobj.enabled = YES;
            cell.switchobj.on = YES;
        }
        else
        {
            //cell.switchobj.enabled = NO;
            cell.switchobj.on = NO;
            
        }
    }
    // [cell.CircleBtnobj setTitle:[iconarr objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    cell.iconimg.image = [UIImage imageNamed:[imgarr objectAtIndex:indexPath.row]];
    cell.listlblobj.text=[Array objectAtIndex:indexPath.row];
    
    return cell;
}

 //        cell.imgsObj.image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
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
//    else if (indexPath.row==1)
//    {
//
//        NSString *str = @"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=";
////        str = [NSString stringWithFormat:@"%@/wa/viewContentsUserReviews?", str];
////        str = [NSString stringWithFormat:@"%@type=Purple+Software&id=", str];
//
//        // Here is the app id from itunesconnect
//        str = [NSString stringWithFormat:@"%@ios.Sisuroot", str];
//
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//
//
//    }
    
    else if (indexPath.row==2)
    {
                //SWRevealViewController *revealController = [self revealViewController];
        
 //               FriendsViewController *pvc=[[FriendsViewController alloc]init];
//                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:pvc];
//                [revealController pushFrontViewController:nav animated:YES];
 //                [self.navigationController pushViewController:pvc animated:YES];
        SWRevealViewController *revealController = [self revealViewController];
        FriendsViewController *OVC=[[FriendsViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
        [revealController pushFrontViewController:nav animated:YES];
        [OVC setStr1:@"done"];
        
    }
    
    
    else if (indexPath.row==3)
    {
        //        SWRevealViewController *revealController = [self revealViewController];
        //
        //        OrderViewController *OVC=[[OrderViewController alloc]init];
        //        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
        //        [revealController pushFrontViewController:nav animated:YES];
        
        
    }
    else if (indexPath.row==4)
    {
        //        SWRevealViewController *revealController = [self revealViewController];
        //
        //        WishlistViewController *WVC=[[WishlistViewController alloc]init];
        //        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:WVC];
        //        [revealController pushFrontViewController:nav animated:YES];
        //
        
        [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"id"];
         SWRevealViewController *revealController = [self revealViewController];
         FrontViewController *LVC=[[FrontViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
        [revealController pushFrontViewController:nav animated:YES];

    }
    else if (indexPath.row==5)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

        //        SWRevealViewController *revealController = [self revealViewController];
        //
        //        OrderViewController *OVC=[[OrderViewController alloc]init];
        //        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:OVC];
        //        [revealController pushFrontViewController:nav animated:YES];
        
        
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
         //[self callpublicSwitchBtn];
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
             //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
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
             //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
             [dict1 setValue:count forKey:@"type"];
             [dict1 setValue:TagRedAlertInnerCircle forKey:@"status"];
             
             [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
             
             [webServiceManager setDelegateMethode:self];
             [webServiceManager callMyWebServiceManager:@"AllowReminder" :dict :dict1];
             
         }
         //[self callprivateSwitchBtn];
         
     }
 }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BackBtnAction:(id)sender {
   
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)profileiconBtnAction:(id)sender {
    ProfileViewController *evc=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:evc animated:YES];
}

- (IBAction)SosBtnAction:(id)sender {
    Bs3ViewController *evc=[[Bs3ViewController alloc]init];
    [self.navigationController pushViewController:evc animated:YES];
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


//-(void)callSwitchMethod
//{
//    //hud.hidden=NO;
//
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"AllowReminder" forKey:@"name"];
//
//    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
//    [dict1 setValue:count forKey:@"type"];
//    [dict1 setValue:count forKey:@"type"];
//
//    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManager:@"AllowReminder" :dict :dict1];
//
//
//}




-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
           
            
//            AddTagReminderStatus=[[responseDictionary valueForKey:@"data"]valueForKey:@"AddTagReminderStatus"];
//            TestReminderStatus=[[responseDictionary valueForKey:@"data"]valueForKey:@"TestReminderStatus"];

            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"SOS_Status"] isEqual:@"0"])
            {
                [_Sosbtnobj setUserInteractionEnabled:YES];
             }
            else
            {
                
                 _Sosbtnobj.alpha = 0.5;
                 [_Sosbtnobj setUserInteractionEnabled:NO];
                
            }
             NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
             if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _profileiconimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                [_profileiconimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ec2-18-216-29-175.us-east-2.compute.amazonaws.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _profileiconimg.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                [_profileiconimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _profileiconimg.contentMode=UIViewContentModeScaleToFill;
            }
            
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
    // ActivityIdenter.hidden=NO;
    
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
}

- (IBAction)UpgradeBtn:(id)sender
{
    SelectAccountViewController *Svc=[[SelectAccountViewController alloc] init];
    [self.navigationController pushViewController:Svc animated:YES];
    
}

@end
