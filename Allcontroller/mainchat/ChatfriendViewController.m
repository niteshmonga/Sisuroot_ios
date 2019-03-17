//
//  ChatfriendViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 30/03/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "ChatfriendViewController.h"
#import "chatfriendTableViewCell.h"
#import "FeedViewController.h"

#import "AppDelegate.h"
#import "FriendsViewController.h"
#import "SettingViewController.h"
#import "UIImageView+WebCache.h"
#import "MyWebserviceManager.h"
#import "Base64.h"
#import "ViewController.h"
#import "GalleryViewController.h"
#import "SWRevealViewController.h"
#import "UIView+RNActivityView.h"
#import "Tag_ProfileViewController.h"
#import "ChatViewController.h"
#import "BS6ViewController.h"
#import "BS4ViewController.h"
#import "BS1ViewController.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface ChatfriendViewController ()

{
    NSMutableArray *Earr;
    NSMutableArray *imgArr;
    NSMutableArray *imgArr1;
    NSMutableArray *imgArr2;
    
    NSMutableArray *Emotionarr;
    //AppDelegate *app;
    BOOL *isfiltered;
    NSMutableArray *FilteredDevices;
    BOOL flag;
    BOOL check;
    BOOL check1;
    UIRefreshControl *refreshControl;
    NSString *imgstrtagid;
    NSString *imgstruname;
    NSString *imgstrtagid1;
    NSString *imgstruname1;
    NSString *selectid;
    NSString *selectid1;
    NSMutableDictionary *dict11;
    
}
@end

@implementation ChatfriendViewController


-(void)sendDataToA:(NSString *)mhpstr11
{
    
        _sisuchatview.hidden=NO;
        
    
    // data will come here inside of ViewControllerA
}
-(void)viewDidAppear:(BOOL)animated
{
    [self callfetchprofile];
    
 
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Sisuchat_Status"] isEqual:@"0"])
    {
         _therapistcountlbl.hidden=NO;
        [_SisuchatBtnobj setUserInteractionEnabled:YES];
        
    }
    else
    {
//        _SisuchatBtnobj.alpha = 0.5;
//      [_SisuchatBtnobj setUserInteractionEnabled:NO];
        
        [_SisuchatBtnobj setUserInteractionEnabled:YES];
        [_SisuchatBtnobj setBackgroundImage:[UIImage imageNamed:@"sos_icon1 (2).png"] forState:UIControlStateNormal];
          _therapistcountlbl.hidden=YES;
    }
    
    [self callchatlist];
    [self callchattherapistlist];
    
    _groupviewobj.hidden=YES;
    _CreatenameViewobj.hidden=YES;
    
    //[self.view showActivityViewWithLabel:@"Loading"];
    [_NextGBtnActionobj setUserInteractionEnabled:NO];
    [_CreateGroupBtnobj setUserInteractionEnabled:NO];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _mhpinfoview.hidden=YES;
    
     self.navigationController.navigationBar.hidden=YES;
    
    _MenuBtnobj.hidden=YES;
    
    _mhpprofileimg.layer.cornerRadius=35;
    _mhpprofileimg.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _mhpprofileimg.layer.borderWidth =2.0f;
    
    _mhpprofileimg.clipsToBounds=YES;
    
    [self callchatlist];
    [self callchattherapistlist];
    _therapistcountlbl.layer.cornerRadius=10;
    _therapistcountlbl.clipsToBounds=YES;
    
  //  _sisuchatview.hidden=YES;
    _mhpinfoview.layer.cornerRadius=8;
    _mhpinfoview.clipsToBounds=YES;
    _mhpinfoview.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _mhpinfoview.layer.borderWidth =2.0f;

    if ([_therapistviewstr isEqualToString:@"showmhpview"])
    {
        _sisuchatview.hidden=NO;
        _therapistcountlbl.hidden=NO;
    }
    else
    {
        _sisuchatview.hidden=YES;
        _therapistcountlbl.hidden=YES;

    }
    
    //    if ([_sisustr isEqualToString:@"sisu"])
    //    {
    //
    //        [self callchattherapistlist];
    //        _addgroupbtnobj.hidden=YES;
    //        _MenuBtnobj.hidden=NO;
    //        _backbtnobj1.hidden=YES;
    //
    //    }
    //    else
    //    {
    //        _MenuBtnobj.hidden=YES;
    //
    //        _addgroupbtnobj.hidden=NO;
    //        _backbtnobj1.hidden=NO;
    //
    //        [self callchatlist];
    //
    //    }
    _groupviewobj.hidden=YES;
    _CreatenameViewobj.hidden=YES;
    
    [self.view showActivityViewWithLabel:@"Loading"];
    
    [_CreateGroupBtnobj setUserInteractionEnabled:NO];
    
    
    // _searchbarobj.hidden=YES;
    isfiltered=false;
    //    flag=1;
    //  self.searchbarobj.delegate=self;
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view from its nib.
    
    
    // imgArr=[[NSMutableArray alloc]initWithObjects:@"dummy_user_e.jpg",@"dummy_user_d.jpg",@"dummy_user_c.jpg",@"dummy_user_b.jpg",@"dummy_user_a.jpg",@"dummy_user_c.jpg",@"dummy_user_e.jpg",nil];
    
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    // app =  (AppDelegate *)[[UIApplication sharedApplication]delegate];
    //    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    //    [self.view addGestureRecognizer:tapper];
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh1:) forControlEvents:UIControlEventValueChanged];
    [_FeedlistTableViewobj addSubview:refreshControl];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}
- (void)refresh1:(UIRefreshControl *)refreshControl
{
    
    // [self callchatlist];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView== chattableview)
    {
        return [imgArr count];
    }
    else if (tableView== _therapisttableview)
    {
        return [imgArr2 count];
    }
    else
    {
        return [imgArr1 count];
    }
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"chatfriendTableView";
    
    chatfriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    // if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"chatfriendTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    cell.onlinelbl.hidden=YES;
    cell.cellBtnobj.tag = indexPath.row;
    
    [cell.cellBtnobj addTarget:self action:@selector(EmotionAction1:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.mhpinfo.tag = indexPath.row;
    
    [cell.mhpinfo addTarget:self action:@selector(mhpinfoAction:) forControlEvents:UIControlEventTouchUpInside];
    // [cell.CircleBtnobj setTitle:[iconarr objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    cell.selectBtnobj.hidden=YES;
    cell.mhpinfo.hidden=YES;
    cell.mhpinfoimg.hidden=YES;

    
    
    if (tableView== chattableview)
    {
        cell.cellBtnobj.hidden=YES;
        cell.Usernamelbl.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"friend_username"];
        NSString *imgStr2 = [[imgArr objectAtIndex:indexPath.row]valueForKey:@"LastMessage"];
        
        if ([imgStr2 isEqual:(id)[NSNull null]] || [imgStr2 isEqualToString:@""])
        {
            cell.messagenamelbl.text=@"";
            
        }
        else
        {
            cell.messagenamelbl.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"LastMessage"];
            
        }
        
        NSString *imgStr3 = [[imgArr objectAtIndex:indexPath.row]valueForKey:@"MsgDate"];
        
        if ([imgStr3 isEqual:(id)[NSNull null]] || [imgStr3 isEqualToString:@""])
        {
            cell.datelbl.text=@"mobile";
 
        }
        else
        {
            cell.datelbl.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"MsgDate"];
            
        }
        NSString *imgStr4 = [[imgArr objectAtIndex:indexPath.row]valueForKey:@"Count"];
        
        if ([imgStr4 isEqual:@"0"])
        {
            cell.countlbl.hidden=YES;
            
        }
        else
        {
            cell.countlbl.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"Count"];
            
        }
        //
        NSString *imgStr1 = [[imgArr objectAtIndex:indexPath.row]valueForKey:@"friend_img"];
        
        if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
        {
            cell.Userimg.image = [UIImage imageNamed:@"user.png"];
            
        }
        else
        {
            if([[[imgArr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
            {
                
                [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
            }
            else if([[[imgArr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
            {
                [cell.Userimg setImageWithURL:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"friend_img"]placeholderImage:nil];
                cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                
            }
        }
    }
    
    
    if (tableView== _therapisttableview)
    {
        cell.cellBtnobj.hidden=YES;
        cell.mhpinfo.hidden=NO;
        cell.mhpinfoimg.hidden=NO;

        if ([[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"online_status"] isEqual:@"0"])
        {
            cell.onlinelbl.hidden=YES;
            
        }
        else
        {
            cell.onlinelbl.hidden=NO;
            // cell.backlblobj.backgroundColor=CFBridgingRelease([UIColor colorWithRed:(177.0/255.0) green:(248.0/255) blue:(177.0/255) alpha:1].CGColor);
            
            cell.backlblobj.backgroundColor = [[UIColor alloc] initWithRed:177.0/255.0 green:248.0/255.0
                                                                      blue:177.0/255.0 alpha:1.0];
        }
        cell.Usernamelbl.text=[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_username"];
        NSString *imgStr2 = [[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"LastMessage"];
        
        if ([imgStr2 isEqual:(id)[NSNull null]] || [imgStr2 isEqualToString:@""])
        {
            cell.messagenamelbl.text=@"";
            
        }
        else
        {
            cell.messagenamelbl.text=[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"LastMessage"];
            
        }
        
        NSString *imgStr3 = [[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"MsgDate"];
        
        if ([imgStr3 isEqual:(id)[NSNull null]] || [imgStr3 isEqualToString:@""])
        {
            cell.datelbl.text=@"mobile";
            
        }
        else
        {
            cell.datelbl.text=[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"MsgDate"];
            
        }
        NSString *imgStr4 = [[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"Count"];
        
        if ([imgStr4 isEqual:@"0"])
        {
            cell.countlbl.hidden=YES;
            
        }
        else
        {
            cell.countlbl.text=[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"Count"];
            
        }
        //
        NSString *imgStr1 = [[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"];
        
        if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
        {
            cell.Userimg.image = [UIImage imageNamed:@"user.png"];
            
        }
        else
        {
            if([[[imgArr2 objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
            {
                [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
            }
            else if([[[imgArr2 objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
            {
                [cell.Userimg setImageWithURL:[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]placeholderImage:nil];
                cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                
            }
        }
        
    }
    
    if (tableView== _FeedlistTableViewobj1)
    {
        cell.cellBtnobj.hidden=NO;
        cell.mhpinfo.hidden=YES;
        cell.mhpinfoimg.hidden=YES;

        NSString *imgStr2 = [[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_username"];
        
        if ([imgStr2 isEqual:(id)[NSNull null]] || [imgStr2 isEqualToString:@""])
        {
            
        }
        else
        {
            cell.countlbl.hidden=YES;
            cell.selectBtnobj.hidden=NO;
            
            if ([[[imgArr1 objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 0)
            {
                cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-0_percents.png"];
            }
            else
            {
                [_NextGBtnActionobj setUserInteractionEnabled:YES];
                
                cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
                
            }
            
            cell.Usernamelbl.text=[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_username"];
            
            NSString *imgStr1 = [[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"];
            
            if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
            {
                cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            else
            {
                if([[[imgArr1 objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
                {
                    
                    [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
                }
                else if([[[imgArr1 objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
                {
                    [cell.Userimg setImageWithURL:[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]placeholderImage:nil];
                    cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                    
                }
            }
        }
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 87;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==chattableview)
    {
        ChatViewController *VC1=[[ChatViewController alloc]init];
         // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
        [VC1 setDetail1:[imgArr objectAtIndex:indexPath.row]];
        [VC1 setDetail2str:@"check12"];
        [self.navigationController pushViewController:VC1 animated:YES];
    }
    else if (tableView==_therapisttableview)
    {
        ChatViewController *VC1=[[ChatViewController alloc]init];
        [VC1 setDetail1:[imgArr2 objectAtIndex:indexPath.row]];
         [VC1 setSisuchatstr:@"checktherapist"];
        VC1.delegate=self; // protocol listener

        [self.navigationController pushViewController:VC1 animated:YES];
    }
    //    else
    //    {
    //
    //        if(isfiltered)
    //        {
    //            //cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
    //            isfiltered=NO;
    //        }
    //        else
    //        {
    //            //cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-0_percents.png"];
    //            isfiltered=YES;
    //        }
    //        [_FeedlistTableViewobj1 reloadData];
    //    }
    
    
    
    //
    //    if ( [[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"] isEqualToString:_usernamestr] || [[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"username"] isEqualToString:_usernamestr])
    //    {
    //        Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
    //        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //        [tracker set:kGAIScreenName value:@"click on Self Tag"];
    //        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //        if ( [[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"] isEqualToString:_usernamestr])
    //        {
    //            [dcv setStr11:imgstrtagid];
    //            [dcv setStr12:imgstruname];
    //        }
    //        if([[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"username"] isEqualToString:_usernamestr])
    //        {
    //            [dcv setStr11:imgstrtagid1];
    //            [dcv setStr12:imgstruname1];
    //        }
    //
    //        [dcv setSharestr:@"Share"];
    //
    //        [self.navigationController pushViewController:dcv animated:YES];
    //  }
    //    Tag_ProfileViewController *TPVC=[[Tag_ProfileViewController alloc]init];
    //    [self.navigationController pushViewController:TPVC animated:YES];
}

-(void)mhpinfoAction  : (UIButton *) btn
{
    
       _mhpinfoview.hidden=NO;
     _mhpnamelbl.text=[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"friend_username"];
    if ([[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"group_type"] isEqual:[NSNull null]] || [[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"group_type"] isEqual:@""])
    {
        _grouptypelbl.text=@"Not Available";

    }
    else
    {
        _grouptypelbl.text=[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"group_type"];

    }
    
    if ([[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"licence_type"] isEqual:[NSNull null]] || [[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"licence_type"] isEqual:@""])
    {
        _licencetypelbl.text=@"Not Available";
        
    }
    else
    {
        _licencetypelbl.text=[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"licence_type"];

    }

    _mhpdetaillbl.text=[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"therapist_type"];
    
    _mhplocationlbl.text=[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"location"];
     //
    NSString *imgStr1 = [[imgArr2 objectAtIndex:btn.tag]valueForKey:@"friend_img"];
    
    if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
    {
        _mhpprofileimg.image = [UIImage imageNamed:@"user.png"];
        
    }
    else
    {
        if([[[imgArr2 objectAtIndex:btn.tag] valueForKey:@"img_status"] integerValue]== 1)
        {
            [_mhpprofileimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"friend_img"]] placeholderImage:nil];
        }
        else if([[[imgArr2 objectAtIndex:btn.tag] valueForKey:@"img_status"] integerValue]== 0)
        {
            [_mhpprofileimg setImageWithURL:[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"friend_img"]placeholderImage:nil];
            _mhpprofileimg.contentMode=UIViewContentModeScaleToFill;
            
        }
    }
    
}
-(void)EmotionAction1  : (UIButton *) btn
{
    
    NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
    
    localDict = [imgArr1 objectAtIndex:btn.tag];
    
    if ([[localDict valueForKey:@"status"] integerValue] == 0)
    {
        [localDict setValue:@"1" forKey:@"status"];
        
    }
    else
    {
        
        [localDict setValue:@"0" forKey:@"status"];
    }
    [_FeedlistTableViewobj1 reloadData];
}




//    if ( [[[imgArr objectAtIndex:btn.tag]valueForKey:@"username"] isEqualToString:_usernamestr]) {
//
//        //  [cell.EmotionBtnobj setTitle:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"] forState:UIControlStateNormal];

//    }
//
//    else
//    {
//        ViewController *VC1=[[ViewController alloc]init];
//        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//        [tracker set:kGAIScreenName value:@"click on Tagme button"];
//        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//        [VC1 setTagmestr:@"tagme"];
//        [VC1 setStr11:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
//        [self.navigationController pushViewController:VC1 animated:YES];
//    }
//
//}

//-(void)ChatAction  : (UIButton *) btn
//{
//
//        ChatViewController *VC1=[[ChatViewController alloc]init];
//        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//        [tracker set:kGAIScreenName value:@"click on Tagme button"];
//        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//        // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
//        [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
//        [VC1 setStrdetail:@"withoutsearch"];
//
//        [self.navigationController pushViewController:VC1 animated:YES];
//}

-(void)callchattherapistlist
{
    //hud.hidden=NO;
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"TherapistListing" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"location"] forKey:@"location"];

    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"TherapistListing" :dict :dict1];
    
}

-(void)callchatlist
{
    //hud.hidden=NO;
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"chatListing" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"ChatFriendListing" :dict :dict1];
 
}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [refreshControl endRefreshing];
            
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Friend Listing"])
            {
                //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                //                [alert show];
                
                if ([[responseDictionary valueForKey:@"data"] isEqual:[NSNull null]])
                {
                    
                }
                else
                {
                    if ([[responseDictionary valueForKey:@"count_frnd"] integerValue] >1)
                    {
                        [_addgroupbtnobj setUserInteractionEnabled:YES];
 
                    }
                    else
                    {
                        [_addgroupbtnobj setUserInteractionEnabled:NO];

                    }
                    imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                    
                }
                
            }
            
            
            [chattableview reloadData];
            
            
        }        //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        //                [alert show];
        
        
        // imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
        
        
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TherapistListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [refreshControl endRefreshing];
 
            if ([[responseDictionary valueForKey:@"data"] isEqual:[NSNull null]])
            {
                
            }
            else
            {
                imgArr2 =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
            }
            
            
            if ([[responseDictionary valueForKey:@"total_count"] isEqual:[NSNull null]] || [[responseDictionary valueForKey:@"total_count"] isEqual:@"0"])
            {
                _therapistcountlbl.hidden=YES;
            }
            else
            {
                if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Sisuchat_Status"] isEqual:@"0"])
                {
                    _therapistcountlbl.hidden=NO;
 
                }
                else
                {
                       _therapistcountlbl.hidden=YES;
                }
 
                _therapistcountlbl.text=[responseDictionary valueForKey:@"total_count"];
            }
            [_therapisttableview reloadData];
            
            
        }        //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        //                [alert show];
        
        
        // imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
        
        
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatListing1"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [refreshControl endRefreshing];
            if ([[responseDictionary valueForKey:@"data"] isEqual:[NSNull null]])
            {
                
            }
            else
            {
                NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
                imgArr1 = [[NSMutableArray alloc] init];
                
                for (int i = 0; i <localArray.count; i++)
                {
                    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                    dict = [[localArray objectAtIndex:i] mutableCopy];
                    [dict setValue:@"0" forKey:@"status"];
                    [imgArr1 addObject:dict];
                }
                
                [_FeedlistTableViewobj1 reloadData];
                
            }
        }
    }
    
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"addgroup"])
    {
        
        [self callchatlist];
        //        if ([[responseDictionary valueForKey:@"status"] integerValue] ==1)
        //        {
        //
        //        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
           
         
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Phq_Test_Status"] forKey:@"Phq_Test_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"location"] forKey:@"location"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Brief_State_Status"] forKey:@"Brief_State_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Perceived_Status"] forKey:@"Perceived_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Sisuchat_Status"] forKey:@"Sisuchat_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] forKey:@"Chat_Status"];
      }
}
}
-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
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
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)BackBtn:(id)sender {
    
    
   
    [self.navigationController popViewControllerAnimated:YES];
 }

- (IBAction)SettingBtnAction:(id)sender {
    SettingViewController *SVC=[[SettingViewController alloc]init];
    
    [self.navigationController pushViewController:SVC animated:YES];
}
- (IBAction)FeedBtnAction:(id)sender {
    FeedViewController *gvc=[[FeedViewController alloc]init];
    [gvc setStr1:@"feed"];
    
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)FriendsBtnAction:(id)sender {
    FriendsViewController *FVC=[[FriendsViewController alloc]init];
   
    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)GalleryBtnAction:(id)sender {
    GalleryViewController *gvc=[[GalleryViewController alloc]init];
    
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)TagBtnAction:(id)sender {
     
    
    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [selectImgAS setTag:6];
    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [selectImgAS showInView:self.view];
 }

-(void)actionSheet:(UIActionSheet *)myActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
     UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    switch (buttonIndex)
    {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                //imagePicker.allowsEditing = NO;
                
                imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:imagePicker animated:YES];
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
            {
                //imagePicker.allowsEditing = NO;
                
                imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                [self presentModalViewController:imagePicker animated:YES];
            }
            
            break;
        default:
            break;
    }
}



-(void)actionSheet1:(UIActionSheet *)myActionSheet1 clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    switch (buttonIndex)
    {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                //imagePicker.allowsEditing = NO;
                
                imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:imagePicker animated:YES];
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
            {
                //imagePicker.allowsEditing = NO;
                
                imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                [self presentModalViewController:imagePicker animated:YES];
            }
            
            break;
        default:
            break;
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    
    _groupviewobj.hidden=NO;
    _CreatenameViewobj.hidden=NO;
    
    
    CGFloat scale = 1.00f;
    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width/2,newSize.height/2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//- (UIImage *)crop:(UIImage *)image inRect:(CGRect)cropRect
//{
//    CGImageRef cropRef = CGImageCreateWithImageInRect(image.CGImage, cropRect);
//    UIImage* cropImage = [UIImage imageWithCGImage:cropRef];
//    CGImageRelease(cropRef);
//
//    return cropImage;
//}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *originalImage = info[UIImagePickerControllerEditedImage];
    
    
    
    CGSize destinationSize1 = CGSizeMake(200, 200);
    UIGraphicsBeginImageContext(destinationSize1);
    [originalImage drawInRect:CGRectMake(0,0,destinationSize1.width,destinationSize1.height)];
    UIImage *newImage1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // _Backgroundimg.image = newImage1;
    NSData *daataa = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
    
    
    base64_encoded_image =  [Base64 encode:daataa];
    
    
    NSDate *dtTime = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
    imageNameStr = [df stringFromDate:dtTime];
    
    NSArray *arra = [imageNameStr componentsSeparatedByString:@" "];
    
    imageNameStr = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
    
    // [picker dismissModalViewControllerAnimated:YES];
    
    ViewController *Tvc=[[ViewController alloc]init];
    [Tvc setBackimg:newImage1];
    [Tvc setImageNameStr1:imageNameStr];
    [Tvc setBase64_encoded_image1:base64_encoded_image];
    [Tvc setDetailstr:@"done"];
    
    [self.navigationController pushViewController:Tvc animated:YES];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    //  check=NO;
    
    
    
    
}
// UIImage *originalImage = [info objectForKey:@"UIImagePickerControllerCropRect"];




- (IBAction)addgroupBtnAction:(id)sender {
    
    
    //    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    //    [self.splitViewController.displayModeButtonItem action];
    //    ChatfriendViewController *rootviewcontroller = [[ChatfriendViewController alloc]init];
    //
    //
    //
    //    UISplitViewController* splitVC = [[UISplitViewController alloc] init];
    //   // [ splitVC.parentViewController:rootviewcontroller animated:YES];
    //    //splitVC.parentViewController = [NSArray arrayWithObjects:rootviewcontroller, nil];
    //    splitVC.viewControllers = [NSArray arrayWithObjects:rootviewcontroller, nil];
    //    //[ChatfriendViewController:(UIViewController*)splitVC];
    
    isfiltered=false;
    
    _groupviewobj.hidden=NO;
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"chatListing1" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"fetchalluser" :dict :dict1];
    
}

- (IBAction)callthisAction:(id)sender
{
    
    
}

- (IBAction)BackgroupBtn:(id)sender {
    _groupviewobj.hidden=YES;
    _CreatenameViewobj.hidden=YES;
    
    
}
- (IBAction)NextGBtnAction:(id)sender {
    _CreatenameViewobj.hidden=NO;
    
    
}
- (IBAction)backGroupnameBtn:(id)sender {
    _groupviewobj.hidden=NO;
    _CreatenameViewobj.hidden=YES;
    
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if(textField==_GroupNameTF)
    {
        
        [_CreateGroupBtnobj setUserInteractionEnabled:YES];
        
    }
}
- (IBAction)CreateGroupBtnAction:(id)sender {
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *laxString1 =@"^[7-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]";
    
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    // NSPredicate *emailTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", laxString1];
    
    
    NSString *msg  = @"0";
    if([_GroupNameTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        
        msg = @"Please enter Groupname";
    }
    else if(_GroupNameTF.text.length < 1)
    {
        
        msg = @"Please enter Groupname";
    }
    else
    {
        _groupviewobj.hidden=YES;
        _CreatenameViewobj.hidden=YES;
        [_CreateGroupBtnobj setUserInteractionEnabled:YES];
        NSString *allContactIdString;
        for (int i = 0; i < imgArr1.count; i++)
        {
            if ([[[imgArr1 objectAtIndex:i] valueForKey:@"status"] integerValue] == 1)
            {
                if (i == 0)
                {
                    allContactIdString = [[imgArr1 objectAtIndex:i] valueForKey:@"friend_id"];
                }
                else
                {
                    allContactIdString = [NSString stringWithFormat:@"%@,%@",allContactIdString,[[imgArr1 objectAtIndex:i] valueForKey:@"friend_id"]];
                    
                }
            }
        }
        
        //        UIImageView *imagestr;
        //        imagestr.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
        
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"addgroup" forKey:@"name"];
        
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
        [dict1 setValue:_GroupNameTF.text forKey:@"group_name"];
        //[dict1 setValue:imagestr forKey:@"image"];
        
        [dict1 setValue:allContactIdString forKey:@"user_id"];
        
        [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"admin_id"];
        
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"addgroup" :dict :dict1];
    }
    
 
}

- (IBAction)SelectGroupimgBtn:(id)sender {
    
    
    
    //    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    //    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    //    [selectImgAS showInView:self.view];
    //
    //    check1=YES;
    
}





- (IBAction)SisuchatBtnAction:(id)sender {
    //    [self callchattherapistlist];
    
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Sisuchat_Status"] isEqual:@"0"])
    {
        
        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"The content of your chats is monitored by a mental health professional to intervene in case of emergency." message:@"Do not share your personal identifiable  information in chats. In case of serious danger to you or to others, the personal identifiable information will be used. SISUROOT is not responsible for the content of your chat conversations. Do you agree?" delegate:self cancelButtonTitle:@"Agree" otherButtonTitles:nil];
        [alertcrp addButtonWithTitle:@"Disagree"];
        [alertcrp show];
        
    }
    else
    {
        BS1ViewController *bs1 = [[BS1ViewController alloc]init];
        [self.navigationController pushViewController:bs1 animated:YES];

    }
    
  
    
}

- (IBAction)TherapistbackbtnAction:(id)sender {
    _sisuchatview.hidden=YES;
    _mhpinfoview.hidden=YES;

}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        _sisuchatview.hidden=NO;
        
    }
    else if(buttonIndex == 1)
    {
        
        NSLog(@"You have clicked Cancel");
        
    }
}
- (IBAction)closeBtnAction:(id)sender {
    _mhpinfoview.hidden=YES;
    
}
@end
