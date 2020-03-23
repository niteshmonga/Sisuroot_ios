

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
#import "ChatViewController.h"
#import "BS1ViewController.h"
#import "UIView+Toast.h"
#import "FriendRequestViewController.h"
#import <Photos/Photos.h>
#import "smilepage1ViewController.h"
#import "chatfroupconratcViewController.h"

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
    NSString *checkstr;

}
@end

@implementation ChatfriendViewController


-(void)sendDataToA:(NSString *)mhpstr11
{
    
        _sisuchatview.hidden=NO;
        
    
 }
-(void)viewWillAppear:(BOOL)animated
{
    _view_Alert.hidden=YES;
}
-(void)viewDidAppear:(BOOL)animated
{
    if(![_sisuchat_noti isEqualToString:@"sisuchat_noti"])
    {
    [self callfetchprofile];
    }
    if(![_chat_noti isEqualToString:@"chat_noti"])
    {
        [self callfetchprofile];
    }
    _view_Alert.hidden=YES;
 
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
        [_SisuchatBtnobj setBackgroundImage:[UIImage imageNamed:@"sos"] forState:UIControlStateNormal];
          _therapistcountlbl.hidden=YES;
    }
    
    [self callchatlist];
    _groupviewobj.hidden=YES;
    _CreatenameViewobj.hidden=YES;
    
    //[self.view showActivityViewWithLabel:@"Loading"];
    [_NextGBtnActionobj setUserInteractionEnabled:NO];
    [_CreateGroupBtnobj setUserInteractionEnabled:NO];
    
}

- (IBAction)btn_okalert:(id)sender {
    _view_Alert.hidden=YES;
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"chatwindowstatus" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:checkstr forKey:@"status"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"chatwindowstatus" :dict :dict1];
}

- (IBAction)btn_checkbox:(id)sender {
    if([_chck_alert isSelected]==YES)
    {
        //uncheck_60px.png
         [_chck_alert setBackgroundImage:[UIImage imageNamed:@"uncheck_60px.png"] forState:UIControlStateNormal];
         checkstr=@"0";
        [_chck_alert setSelected:NO];
        
    }
    else
    {
        [_chck_alert setBackgroundImage:[UIImage imageNamed:@"check_60px (1).png"] forState:UIControlStateNormal];
        checkstr=@"1";
        //check_60px (1).png
        [_chck_alert setSelected:YES];
    }
}

- (void)viewDidLoad {
     [FIRAnalytics setScreenName:@"Chat Friends" screenClass:@"Chat Friends"];
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//             gradient.frame = self.view.bounds;
//             gradient.colors = @[(id)[UIColor colorWithRed:(0.0/255.0) green:(100.0/255) blue:(200.0/255) alpha:1].CGColor, (id)[UIColor colorWithRed:(0.0/255.0) green:(50.0/255) blue:(100.0/255) alpha:1].CGColor];
//             [self.view.layer insertSublayer:gradient atIndex:0];
    
    _btn_okalert.layer.borderColor = [UIColor blackColor].CGColor;
    _btn_okalert.layer.borderWidth=2;
    _btn_okalert.layer.cornerRadius=2;
    
       [self callfetchprofile];
 
     [super viewDidLoad];
    _mhpinfoview.hidden=YES;
    
     self.navigationController.navigationBar.hidden=YES;
    
    _view_Alert.layer.cornerRadius=10;
    _view_Alert.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _view_Alert.layer.borderWidth =2.0f;
    
    _view_Alert.clipsToBounds=YES;
    
    
    
    
    _MenuBtnobj.hidden=YES;
    
    _mhpprofileimg.layer.cornerRadius=35;
    _mhpprofileimg.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _mhpprofileimg.layer.borderWidth =2.0f;
    
    _mhpprofileimg.clipsToBounds=YES;
    
    //[self callchatlist];
    //[self callchattherapistlist];
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
    
    _refreshControl_thep = [[UIRefreshControl alloc] init];
    [_refreshControl_thep addTarget:self action:@selector(refresh_thep:) forControlEvents:UIControlEventValueChanged];
    [_therapisttableview addSubview:_refreshControl_thep];
    
    
    
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
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // Do any additional setup after loading the view from its nib.
    
    

    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    // app =  (AppDelegate *)[[UIApplication sharedApplication]delegate];
    //    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    //    [self.view addGestureRecognizer:tapper];
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh1:) forControlEvents:UIControlEventValueChanged];
    [_FeedlistTableViewobj addSubview:refreshControl];
    
    
    if([_sisuchat_noti isEqualToString:@"sisuchat_noti"])
    {
        _view_Alert.hidden=YES;
        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUCHAT (SS) is a feature to help a monitor intervene in case of emergency only. The content of your chats is monitored by the application for limited restrictions." message:@"Do not share personal identifiable information in chats. In case of serious danger to you or others, the personal identifiable information will be used. SISUROOT is not responsible for the content of your conversations. Do you agree?" delegate:self cancelButtonTitle:@"Agree" otherButtonTitles:nil];
                
            [alertcrp addButtonWithTitle:@"Disagree"];
                [alertcrp show];
                
            
            
        }
    if([_chat_noti isEqualToString:@"chat_noti"])
    {
        _view_Alert.hidden=YES;
    }
    
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

- (void)refresh_thep:(UIRefreshControl *)refreshControl_thep
{
    [self callchattherapistlist];
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
    
    cell.selectBtnobj.hidden=YES;
    cell.mhpinfo.hidden=YES;
    cell.mhpinfoimg.hidden=YES;

     if (tableView== chattableview)
    {
        cell.cellBtnobj.hidden=YES;
        if ([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"online_status"] isEqual:@"0"])
               {
                   cell.img_on.hidden=YES;
                   
               }
               else
               {
                   cell.img_on.hidden=NO;
               }
        
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
                 [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[imgArr objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
                
                 //[cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
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
                 [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
                
               // [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
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
                    
                     [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
                    
                  //  [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr1 objectAtIndex:indexPath.row]valueForKey:@"friend_img"]] placeholderImage:nil];
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
    return 100;
}
- (IBAction)btn_qa:(id)sender {
        smilepage1ViewController *FVC=[[smilepage1ViewController alloc]init];
        [self.navigationController pushViewController:FVC animated:YES];
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
         if ([[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"online_status"] isEqual:@"0"])
        {
            
        }
        else
        {
            ChatViewController *VC1=[[ChatViewController alloc]init];
            [VC1 setDetail1:[imgArr2 objectAtIndex:indexPath.row]];
            [VC1 setSisuchatstr:@"checktherapist"];
            VC1.delegate=self; // protocol listener
            [self.navigationController pushViewController:VC1 animated:YES];
        }
    }
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
    
    
    _grouptypelbl.lineBreakMode = UILineBreakModeWordWrap;
    _grouptypelbl.numberOfLines = 0;
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
             [_mhpprofileimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"friend_img"]] placeholderImage:nil];
            
            //[_mhpprofileimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr2 objectAtIndex:btn.tag]valueForKey:@"friend_img"]] placeholderImage:nil];
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
                  
                    imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                }
            }
            [chattableview reloadData];
             _addgroupbtnobj.hidden=NO;
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"No Chat Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                         [alert show];
            [self.view hideActivityView];
            _addgroupbtnobj.hidden=YES;
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TherapistListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [refreshControl endRefreshing];
            [_refreshControl_thep endRefreshing];
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
        }
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
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatwindowstatus"])
    {
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            _str_view_alert_msg=@"A monitor may contact you if any restricted self-harm words are stated in chat or comments. If you are going through something difficult, please click SOS and call a hotline to speak with someone immediately.";
           _lbl_view_alert.text=_str_view_alert_msg;
            NSString *stralert=[[responseDictionary valueForKey:@"data"] valueForKey:@"chat_window_status"];
           if([_sisuchat_noti isEqualToString:@"sisuchat_noti"])
            {
                _view_Alert.hidden=YES;
            }
            else
            if([_chat_noti isEqualToString:@"chat_noti"])
            {
                _view_Alert.hidden=YES;
                
            }
            else
            {
            if ([stralert isEqualToString:@"0"])
            {
                    if(_sisuchatview.hidden==YES)
                    {
                        _view_Alert.hidden=NO;
                    }
                    else
                    {
                        _view_Alert.hidden=YES;
                    }
                }
                else
                {
                    _view_Alert.hidden=YES;
                }
            }
            
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

- (IBAction)BackBtn:(id)sender {
    
    if([_sisuchat_noti isEqualToString:@"sisuchat_noti"])
    {
        FriendRequestViewController *gvc=[[FriendRequestViewController alloc]init];
          [self.navigationController pushViewController:gvc animated:YES];
        
    }
    else if([_chat_noti isEqualToString:@"chat_noti"])
    {
        FriendRequestViewController *gvc=[[FriendRequestViewController alloc]init];
         [self.navigationController pushViewController:gvc animated:YES];
        
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];

    }
   
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

- (IBAction)addgroupBtnAction:(id)sender {
    
     chatfroupconratcViewController *VC1=[[chatfroupconratcViewController alloc]init];
             [self.navigationController pushViewController:VC1 animated:YES];

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

    
}

- (IBAction)SisuchatBtnAction:(id)sender {
    //    [self callchattherapistlist];
    
    _view_Alert.hidden=YES;
    if ([[[NSUserDefaults standardUserDefaults]valueForKey:@"Sisuchat_Status"] isEqual:@"0"])
    {
        
        
        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUCHAT (SS) is a feature to help a monitor intervene in case of emergency only. The content of your chats is monitored by the application for limited restrictions." message:@"Do not share personal identifiable information in chats. In case of serious danger to you or others, the personal identifiable information will be used. SISUROOT is not responsible for the content of your conversations. Do you agree?" delegate:self cancelButtonTitle:@"Agree" otherButtonTitles:nil];
        
        
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
        _sisuchat_noti=@"";
        _chat_noti=@"";
        _view_Alert.hidden=YES;
       /* [self.sisuchatview makeToast:@"Pull down to refresh"
                                         duration:2.0
                                         position:CSToastPositionBottom];*/
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
