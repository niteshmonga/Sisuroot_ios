
#import "ProfileViewController.h"
#import "ListTableViewCell.h"

#import "EmotionCollectionViewCell.h"
#import "EditViewController.h"
#import "FeedViewController.h"
#import "FriendsViewController.h"
//#import "Base64.h"
#import "Base64.h"
#import "UIImageView+WebCache.h"
#import "MyWebserviceManager.h"
#import "ViewController.h"
#import "SettingViewController.h"
#import "ResponseViewController.h"
#import "SWRevealViewController.h"
#import "GalleryViewController.h"
#import "Tag_ProfileViewController.h"
#import "ChatViewController.h"
#import "ChatfriendViewController.h"
#import "AppDelegate.h"
#import "Bs3ViewController.h"
#import "BS1ViewController.h"

#import "SCLAlertView.h"
#import "UIView+RNActivityView.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"

@interface ProfileViewController ()
{
    NSMutableArray *Earr;
    NSMutableArray *imgArr;
    NSMutableArray *Emotionarr;
    NSArray *countarr;
    NSString *countstr;
    NSMutableDictionary *countdict;
    UIRefreshControl *refreshControl;
    AVAudioPlayer *audioPlayer;

}
@end


@implementation ProfileViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return  UIStatusBarStyleLightContent;
}
-(void)viewDidAppear:(BOOL)animated
{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self callfetchprofile];
    // [self.view showActivityViewWithLabel:@"Loading"];
    
}
/*-(void)viewDidAppear:(BOOL)animated:(BOOL)animated
 {
 [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
 [self callfetchprofile];
 [self.view showActivityViewWithLabel:@"Loading"];
 
 }*/
//-(void)registerToReceivePushNotification {
//    // Register for push notifications
//    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound |    UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
//    //        [[UIApplication sharedApplication] registerForRemoteNotifications];
//    //
//}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden=YES;
    //_Searchbarobj.hidden=YES;
    // [self countNotifications];
    //[[NSUserDefaults standardUserDefaults] setValue:@"true" forKey:@"launch"];
    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    
    [self callfetchprofile];
    //  [self callTaglist];
    [self.view showActivityViewWithLabel:@"Loading"];
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    Earr=[[NSMutableArray alloc]initWithObjects:@"HAPPY",@"SAD",@"ANGRY",@"HAPPY",@"SAD",@"ANGRY",@"HAPPY",@"SAD",@"ANGRY",@"HAPPY",@"SAD",@"ANGRY", nil];
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _revealBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    //_FrndResnotificationlblobj.layer.borderWidth =1;
    // _FrndResnotificationlblobj.layer.borderColor = [UIColor blackColor].CGColor;
    _FrndResnotificationlblobj.layer.cornerRadius=10;
    _FrndResnotificationlblobj.clipsToBounds=YES;
    _Profilepicimg.layer.cornerRadius=45;
    _Profilepicimg.clipsToBounds=YES;
    
    _Profilepicimg.layer.borderWidth =2;
    _Profilepicimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _FitBtnobj.layer.cornerRadius=12;
    _FitBtnobj.clipsToBounds=YES;
    
    _profileBtnobj.layer.cornerRadius=45;
    _profileBtnobj.clipsToBounds=YES;
    
    _profileBtnobj.layer.borderWidth =2;
    _profileBtnobj.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    
    _profileBtnobj1.layer.cornerRadius=20;
    _profileBtnobj1.clipsToBounds=YES;
    
    _profileBtnobj1.layer.borderWidth =2;
    _profileBtnobj1.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    
    _profileiconimg.layer.cornerRadius=20;
    _profileiconimg.clipsToBounds=YES;
    
    _profileiconimg.layer.borderWidth =2;
    _profileiconimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    
    _ChangecoverBtnobj.layer.borderWidth =1;
    _ChangecoverBtnobj.layer.borderColor = [UIColor whiteColor].CGColor;
    _FitBtnobj.layer.borderWidth =1;
    _FitBtnobj.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _ChangecoverBtnobj.layer.cornerRadius=11;
    _ChangecoverBtnobj.clipsToBounds=YES;
    
    [_EmotionCollectionViewobj registerNib:[UINib nibWithNibName:@"EmotionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"EmotionCollectionViewCell"];
    
    idstr1=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]];
    
    //    if ([_friendstr1 isEqualToString:@"contact"])
    //    {
    //        SCLAlertView *alert = [[SCLAlertView alloc] init];
    //        UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
    //        [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"" subTitle:@"Contact import done" closeButtonTitle:@"OK" duration:0.0f];
    
    //  }
    
    if ([_str1 isEqualToString:@"done"])
    {
        //    _backBtnobj.hidden=YES;
        //    _MenuBtnobj.hidden=NO;
        
    }
    
    if ([_tagstr1 isEqualToString:@"tagstr"])
    {
        SCLAlertView *alert = [[SCLAlertView alloc] init];
        
        UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
        [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"" subTitle:@"Tagged" closeButtonTitle:@"OK" duration:0.0f];
        
    }
    // UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    // [self.view addGestureRecognizer:tapper];
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh1:) forControlEvents:UIControlEventValueChanged];
    [_DashTableviewobj addSubview:refreshControl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refresh1:(UIRefreshControl *)refreshControl
{
    
    [self callTaglist];
    
}
//-(void) tapped:(UIGestureRecognizer *) sender
//{
////    TapView.backgroundColor=[UIColor colorWithRed:r green:g blue:b alpha:1];
//    [_Searchbarobj resignFirstResponder];
//    _Searchbarobj.hidden=YES;
//}
//



//-(void)favAction  : (UIButton *) btn
//{
//    Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
//    [dcv setStr11:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
//    [dcv setStr12:[[imgArr objectAtIndex:btn.tag]valueForKey:@"username"]];
//    [self.navigationController pushViewController:dcv animated:YES];
//
//}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return imgArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"ListtableView";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)
//    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    
    //}
    
    
   
    
    cell.OtherEmoBtnobj.tag = indexPath.row;
    
    [cell.OtherEmoBtnobj addTarget:self action:@selector(OtherEmotionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.EmotionBtnobj.tag = indexPath.row;
    [cell.EmotionBtnobj addTarget:self action:@selector(EmotionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.chatBtnobj.tag = indexPath.row;
    [cell.chatBtnobj addTarget:self action:@selector(ChatAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.chatBtnobj.hidden=YES;

    [cell.listprofileimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/tag_photo/%@",[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tagImg"]] placeholderImage:nil];
    cell.listprofileimg.contentMode=UIViewContentModeScaleToFill;
    
     NSString *userstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"];
    if ( [userstr isEqualToString:_profilelblobj.text ]) {
        
        //[cell.EmotionBtnobj setTitle:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"] forState:UIControlStateNormal];
        NSString *countstr11=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
        if ([countstr11 isEqual:(id)[NSNull null]] || countstr11.length <1)
        {
            // cell.EmotionBtnlblobj.text=@"";
            cell.EmotionBtnlblobj.hidden=YES;
        }
        else
        {
            cell.EmotionBtnlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
        }
        NSString *countstr12=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"];
        
        if ([countstr12 isEqual:(id)[NSNull null]] || countstr12.length <1)
        {
            // cell.EmotionBtnlblobj.text=@"";
            cell.EmotionBtnobj.hidden=YES;
            
        }
        else
        {
            cell.EmotionBtnobj.hidden=NO;
            
        }
        
        cell.usernamelblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"];
        //cell.usernamelblobj.textColor=[UIColor orangeColor];
        cell.shareimg.hidden = YES;
        cell.share1img.hidden = NO;
        cell.inviteBtnobj.hidden=NO;
        
        cell.taggedimg.hidden=YES;
        cell.backlbl.layer.cornerRadius=10;
        cell.backlbl.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
        cell.backlbl.layer.borderWidth =1.0f;
        cell.backlbl.clipsToBounds=YES;
        
        // cell.inviteBtnobj.frame = CGRectMake(300.0, 21.0, 25.0, 25.0);
        // [cell.EmotionBtnobj setTitle:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"] forState:UIControlStateNormal];
        // [cell.EmotionBtnobj setBackgroundImage:[UIImage imageNamed:@"green_botton.png"] forState:UIControlStateNormal];
        // cell.Taggedlbl.text=@"Last Tagged";
        
        cell.chatBtnobj.hidden=YES;
        
        NSString *countstr2=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
        
        if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
        {
            cell.OtherEmoBtnlblobj.text=@"None";
        }
        else
        {
            cell.OtherEmoBtnlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
        }
        
        NSString *countstr3=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
        
        if ([countstr3 isEqual:(id)[NSNull null]] || countstr3.length < 1)
        {
            // cell.EmotionBtnlblobj.text=@"";
            cell.OtherEmoBtnobj.hidden=YES;
            cell.OtherEmoBtnlblobj.frame = CGRectMake(195, 58, 119, 21);
            
        }
        else
        {
            
            cell.OtherEmoBtnobj.hidden=NO;
            
        }
        
        
        NSString *commentstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
        if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
        {
            NSString *commentstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
            if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
            {
                cell.Liststmtlblobj.text=@"No Comments";
            }
            else
            {
                cell.Liststmtlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
            }
        }
        else
        {
            cell.Liststmtlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
        }
        
    }
    else
    {
        
        cell.chatBtnobj.hidden=NO;
        // cell.inviteBtnobj.frame = CGRectMake(319.0, 48.0, 25.0, 25.0);
        cell.EmotionBtnlblobj.hidden=YES;
        cell.EmotionBtnobj.hidden=YES;
        
        // [cell.EmotionBtnobj setTitle:@"Tagme" forState:UIControlStateNormal];
        //[cell.EmotionBtnobj setTitle:@"Tag Me" forState:UIControlStateNormal];
        //  [cell.EmotionBtnobj setBackgroundImage:[UIImage imageNamed:@"tagmeback.png"] forState:UIControlStateNormal];
        //  cell.Taggedlbl.text=@"Tagged";
        cell.taggedimg.hidden=NO;
        
        NSString *imgStr3 = [[imgArr objectAtIndex:indexPath.row]valueForKey:@"tagging_status"];
        
        if ([imgStr3 isEqual:(id)[NSNull null]] || [imgStr3 isEqual:@"0"] )
        {
            //[cell.OtherEmoBtnobj setTitle:@"None" forState:UIControlStateNormal];
            //[cell.EmotionBtnobj setTitle:@"Tag Me" forState:UIControlStateNormal];
            //cell.OtherEmoBtnlblobj.text=@"None";
            
            NSString *commentstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
            if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
            {
                NSString *commentstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
                if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
                {
                    cell.Liststmtlblobj.text=@"No Comments";
                }
                else
                {
                    cell.Liststmtlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
                    
                }
            }
            else
            {
                cell.Liststmtlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
            }
            
            
            cell.usernamelblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"];
            
            cell.shareimg.image = [UIImage imageNamed:@"tag.png"];
            cell.taggedimg.image = [UIImage imageNamed:@"tag_me1.png"];
            cell.shareimg.hidden = NO;
            cell.share1img.hidden = YES;
            cell.inviteBtnobj.hidden=YES;
            cell.backlbl.layer.cornerRadius=10;
            cell.backlbl.layer.borderColor=[UIColor orangeColor].CGColor;
            cell.backlbl.layer.borderWidth =1.0f;
            cell.backlbl.clipsToBounds=YES;
            
            NSString *countstr2=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
            
            if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
            {
                cell.OtherEmoBtnlblobj.text=@"None";
            }
            else
            {
                cell.OtherEmoBtnlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
            }
            
            NSString *countstr3=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
            
            if ([countstr3 isEqual:(id)[NSNull null]] || countstr3.length < 1)
            {
                // cell.EmotionBtnlblobj.text=@"";
                cell.OtherEmoBtnobj.hidden=YES;
                cell.OtherEmoBtnlblobj.frame = CGRectMake(195, 58, 119, 21);
            }
            else
            {
                cell.OtherEmoBtnobj.hidden=NO;
                
            }
            
        }
        else
        {
            cell.usernamelblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"];
            //  cell.usernamelblobj.textColor=[UIColor blackColor];
            
            NSString *commentstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
             if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
            {
                NSString *commentstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
                if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
                {
                    cell.Liststmtlblobj.text=@"No Comments";
                    
                }
                else
                {
                    cell.Liststmtlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
                }
            }
            else
            {
                cell.Liststmtlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
            }
            
            
            cell.shareimg.image = [UIImage imageNamed:@"tagged.png"];
            cell.taggedimg.image = [UIImage imageNamed:@"tag_me.png"];
            cell.shareimg.hidden = NO;
            cell.share1img.hidden = YES;
            cell.inviteBtnobj.hidden=YES;
            cell.backlbl.layer.cornerRadius=10;
            cell.backlbl.layer.borderColor=[UIColor colorWithRed:(61.0/255.0) green:(230.0/255) blue:(181.0/255) alpha:1].CGColor;
            cell.backlbl.layer.borderWidth =1.0f;
            cell.backlbl.clipsToBounds=YES;
            
            //[cell.EmotionBtnobj setTitle:@"Tagged" forState:UIControlStateNormal];
            // [cell.EmotionBtnobj setBackgroundImage:[UIImage imageNamed:@"green_botton1.png"] forState:UIControlStateNormal];
            
            //[cell.OtherEmoBtnobj setTitle:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"] forState:UIControlStateNormal];
            NSString *countstr2=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
            
            if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
            {
                cell.OtherEmoBtnlblobj.text=@"None";
            }
            else
            {
                cell.OtherEmoBtnlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
            }
            
            NSString *countstr3=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
            
            if ([countstr3 isEqual:(id)[NSNull null]] || countstr3.length < 1)
            {
                // cell.EmotionBtnlblobj.text=@"";
                cell.OtherEmoBtnobj.hidden=YES;
                cell.OtherEmoBtnlblobj.frame = CGRectMake(195, 58, 119, 21);
                
            }
            else
            {
                cell.OtherEmoBtnobj.hidden=NO;
                
            }
            // cell.OtherEmoBtnlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
            
        }
    }
    
    //[cell.EmotionBtnobj setTitle:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"] forState:UIControlStateNormal];
    
    [cell.listprofileimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/tag_photo/%@",[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tagImg"]] placeholderImage:nil];
    
    cell.listprofileimg.contentMode=UIViewContentModeScaleToFill;
    
    
    
    // cell.usernamelblobj.text=@"My Post";
    
    if([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"1"])
    {
        [cell.inviteBtnobj setImage:[UIImage imageNamed:@"inner_circle_green40.png"] forState:UIControlStateNormal];
    }
    else if([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"2"])
    {
        [cell.inviteBtnobj setImage:[UIImage imageNamed:@"outer_circle_green40.png"] forState:UIControlStateNormal];
        
    }
    else if([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"3"])
    {
        
        [cell.inviteBtnobj setImage:[UIImage imageNamed:@"both_circle-green40.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        [cell.inviteBtnobj setImage:[UIImage imageNamed:@"both_circle_golden40.png"] forState:UIControlStateNormal];
        
    }
    
    
    NSString *imgStr = [[imgArr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
    
    if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
    {
        cell.profileimg.image = [UIImage imageNamed:@"user.png"];
        
    }
    //
    else if([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"img_status"] integerValue]==1)
        
    {
        [cell.profileimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[imgArr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]]] placeholderImage:nil];
        cell.profileimg.contentMode=UIViewContentModeScaleToFill;
    }
    else
    {
        
        [cell.profileimg setImageWithURL:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"] placeholderImage:nil];
        cell.profileimg.contentMode=UIViewContentModeScaleToFill;
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}


//
//        cell.imgsObj.image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    if ( [[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"] isEqualToString:_profilelblobj.text ])
    {
        
 
        
        
        
        
        NSString *fstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
        NSString *f1str=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"];
        
        if (fstr.length >1 && f1str.length >1)
        {
            Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
            
            [dcv setStr11:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
            [dcv setStr12:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"]];
            [dcv setSharestr:@"Share"];
            [dcv setVoicestr111:@"voicestrboth"];
            
            [self.navigationController pushViewController:dcv animated:YES];
        }
        else if ([f1str isEqual:[NSNull null]] || f1str.length <1)
        {
            
            Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
            
            [dcv setStr11:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
            [dcv setStr12:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"]];
            [dcv setSharestr:@"Share"];
            [self.navigationController pushViewController:dcv animated:YES];
        }
        else if ([fstr isEqual:[NSNull null]] || fstr.length <1)
        {
            Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
            
            [dcv setStr11:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
            [dcv setStr12:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"]];
            [dcv setSharestr:@"Share"];
            [dcv setVoicestr111:@"voicestr"];
            
            [self.navigationController pushViewController:dcv animated:YES];
        }
        
     }
    else
    {
        if ([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tagging_status"] isEqual:@"1"])
        {
            
            ViewController *VC1=[[ViewController alloc]init];
            [VC1 setTagmestr:@"tagged"];
            [VC1 setDatestrarr:[imgArr objectAtIndex:indexPath.row]];
            
            [VC1 setStr11:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
            [self.navigationController pushViewController:VC1 animated:YES];
            
        }
        else
        {
            ViewController *VC1=[[ViewController alloc]init];
            [VC1 setTagmestr:@"tagme"];
            [VC1 setDatestrarr:[imgArr objectAtIndex:indexPath.row]];
            [VC1 setStr11:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
            [self.navigationController pushViewController:VC1 animated:YES];
            
         }
    }
}


-(void)ChatAction  : (UIButton *) btn
{
    ChatViewController *VC1=[[ChatViewController alloc]init];
    
    // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
    [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
    [self.navigationController pushViewController:VC1 animated:YES];
}
-(void)EmotionAction  : (UIButton *) btn
{
    
//    if ( [[[imgArr objectAtIndex:btn.tag]valueForKey:@"username"] isEqualToString:_profilelblobj.text]) {
//
//        //  [cell.EmotionBtnobj setTitle:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"] forState:UIControlStateNormal];
//
//    }
//    else
//    {
//        if ([[[imgArr objectAtIndex:btn.tag]valueForKey:@"tagging_status"] isEqual:@"1"]) {
//
//
//
//
//        }
//        else
//        {
//            ViewController *VC1=[[ViewController alloc]init];
//
//            [VC1 setTagmestr:@"tagme"];
//            [VC1 setStr11:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
//            [self.navigationController pushViewController:VC1 animated:YES];
//
//        }
//    }
    if (audioPlayer.playing)
    {
        [audioPlayer stop];
        [btn setBackgroundImage:[UIImage imageNamed:@"play_button_white.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        NSString *voicename=[[imgArr objectAtIndex:btn.tag]valueForKey:@"emotionName"];
        NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
        NSURL *url = [NSURL URLWithString:mainUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
        [audioPlayer play];
        
        audioPlayer.delegate = self;
        [btn setBackgroundImage:[UIImage imageNamed:@"pause_button_white.png"] forState:UIControlStateNormal];
    }
}


-(void)OtherEmotionAction : (UIButton *) btn
{
    
        if (audioPlayer.playing)
        {
            [audioPlayer stop];
            [btn setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
            
        }
        else
        {
            NSString *voicename=[[imgArr objectAtIndex:btn.tag]valueForKey:@"emotionLatest"];
            NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
            NSURL *url = [NSURL URLWithString:mainUrl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
            [audioPlayer play];
            audioPlayer.delegate = self;
            
            [btn setBackgroundImage:[UIImage imageNamed:@"pause_button_green.png"] forState:UIControlStateNormal];
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
                // imagePicker.allowsEditing = NO;
                
                imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:imagePicker animated:YES];
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
            {
                
                // Set source to the Photo Library
                //  imagePicker.allowsEditing = NO;
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
    CGFloat scale = 1.00f;
    
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
    
    // UIImage *originalImage = [info objectForKey:@"UIImagePickerControllerCropRect"];
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
}

- (IBAction)searchBtn:(id)sender {
    
    _Searchbarobj.hidden=NO;
}
- (IBAction)CameraBtn:(id)sender {
}
- (IBAction)SettingBtn:(id)sender {
    SettingViewController *SVC=[[SettingViewController alloc]init];
   
    [self.navigationController pushViewController:SVC animated:YES];
    
}
- (IBAction)FITBtn:(id)sender {
    FeedViewController *SVC=[[FeedViewController alloc]init];
    [SVC setStr2:@"done"];
    
    [self.navigationController pushViewController:SVC animated:YES];
}
- (IBAction)TagpostBtn:(id)sender {
    
    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [selectImgAS setTag:6];
    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [selectImgAS showInView:self.view];
    
}
- (IBAction)galleryBtn:(id)sender {
    GalleryViewController *gvc=[[GalleryViewController alloc]init];
    
    [self.navigationController pushViewController:gvc animated:YES];
}
- (IBAction)FriendsBtn:(id)sender {
   
    FriendsViewController *FVC=[[FriendsViewController alloc]init];
    [FVC setStrcount:_FrndResnotificationlblobj.text];
    [self.navigationController pushViewController:FVC animated:YES];
    
}
- (IBAction)ProfileBtnAction:(id)sender {
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on feed"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    BS1ViewController *BSVC=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:BSVC animated:YES];
}
- (IBAction)NextBtn:(id)sender {
}

- (IBAction)ChangeCoverBtn:(id)sender {
    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [selectImgAS setTag:6];
    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [selectImgAS showInView:self.view];
    
    
}
- (IBAction)ProfilepicBtn:(id)sender {
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [Earr count];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/4, 45);
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"EmotionCollectionViewCell";
    EmotionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //        [cell.mproductimg setImageWithURL:[NSString stringWithFormat:@"http://swadeshiayurved.com/admin/admin/category_image/%@",[[arr objectAtIndex:indexPath.row]valueForKey:@"cat_image"]]placeholderImage:nil];
    //
    cell.Emotion2lbl.text=[Earr objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    ViewController *pvc=[[ViewController alloc]init];
    //    [self.navigationController pushViewController:pvc animated:YES];
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
    
}

// Layout: Set Edges
- (UIEdgeInsets)collectionView: (UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
    
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

-(void)callTaglist
{
 
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"tagslisting" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"tagslisting" :dict :dict1];
    
    
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self callTaglist];
 
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] isEqual:@"0"])
            {
                
                [_ChatBtnobj setUserInteractionEnabled:YES];
                
            }
            else
            {
                _ChatBtnobj.alpha = 0.5;
                
                [_ChatBtnobj setUserInteractionEnabled:NO];
                
            }
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"SOS_Status"] isEqual:@"0"])
            {
                [_ProfileButtonActionobj setUserInteractionEnabled:YES];
 
            }
            else
            {
                 _ProfileButtonActionobj.alpha = 0.5;
                
                [_ProfileButtonActionobj setUserInteractionEnabled:NO];
            }
            // fetcharr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            //  [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserImage"] forKey:@"UserImage"];
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Sisuchat_Status"] integerValue]==1)
            {
                if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"])
                {
                    chatnotification.hidden=YES;
                    
                }
                else
                {
                    chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
                    
                }
            }
            else
            {
                chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
                NSInteger b = [chatnotification.text integerValue];
                
                NSString *str = [[responseDictionary valueForKey:@"data"]valueForKey:@"therapist_chat_count"];
                NSInteger j=[str integerValue];;
                j=b+j;
                NSString* myNewString = [NSString stringWithFormat:@"%li", (long)j];
                
                chatnotification.text=myNewString;
                
            }
            
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"] && [[[responseDictionary valueForKey:@"data"]valueForKey:@"therapist_chat_count"] integerValue]==0)
            {
                chatnotification.hidden=YES;
                
            }
            NSString *str1=@"Last Post Date: ";
            NSString *str2=[[responseDictionary valueForKey:@"data"]valueForKey:@"LastPostDate"];
            str1=[str1 stringByAppendingString:str2];

            _lastpostdatelbl.text = str1;

            _profilelblobj.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
            
            NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _Profilepicimg.image = [UIImage imageNamed:@"user.png"];
                _profileiconimg.image = [UIImage imageNamed:@"user.png"];
                
                
            }
            //        else if([[[responseDictionary valueForKey:@"data"]valueForKey:@"email_verified"] isEqual:(id)[NSNull null]])
            //        {
            //            [_Profilepicimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://epiksolution.org/rootapp/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
            //            _Profilepicimg.contentMode=UIViewContentModeScaleToFill;
            //
            //
            //        }
            
            //        else if([[[responseDictionary valueForKey:@"data"]valueForKey:@"email_verified"] integerValue]==1)
            //
            //        {
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
                
            {
                [_Profilepicimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _Profilepicimg.contentMode=UIViewContentModeScaleToFill;
                
                [_profileiconimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _profileiconimg.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                
                [_Profilepicimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _Profilepicimg.contentMode=UIViewContentModeScaleToFill;
                
                [_profileiconimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _profileiconimg.contentMode=UIViewContentModeScaleToFill;
            }
            // }
            
            
        }
        NSString *imgStr1 = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img_two"];
        
        
        if ([imgStr1 isEqual:(id)[NSNull null]] || imgStr1.length < 1 )
        {
            _coverimg.image = [UIImage imageNamed:@" "];
            _profilelblobj.textColor=[UIColor blackColor];
        }
        else
        {
           // _profilelblobj.textColor=[UIColor whiteColor];
            
            [_coverimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ec2-18-216-29-175.us-east-2.compute.amazonaws.com/servicebus/cover_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img_two"]]] placeholderImage:nil];
            _coverimg.contentMode=UIViewContentModeScaleToFill;
            
            
            
        }
        
        
        
        //   _nameTF.text = [indexDict valueForKey:@"name"];
        
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"tagslisting"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [self.view hideActivityView];
            
            [refreshControl endRefreshing];
            
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Tags not found"])
            {
                //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                //                [alert show];
                
            }
            else{
                
                imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
                
            }
            
            [_DashTableviewobj reloadData];
            
            NSString *totalcount = [[responseDictionary valueForKey:@"count_notifications"]valueForKey:@"count"];
            
            
            if ([totalcount isEqual:(id)[NSNull null]] || [totalcount isEqual:@"0"] ||totalcount.length < 1 )
            {
                //_FrndResnotificationlblobj.text=@"0";
                _FrndResnotificationlblobj.hidden=YES;
            }
            
            else
            {
                _FrndResnotificationlblobj.text=[[responseDictionary valueForKey:@"count_notifications"] valueForKey:@"count"];
                
            }
            
            
        }
    }
    
}


-(void) processFailed :(NSError *)responseDictionary
{
    // ActivityIdenter.hidden=NO;
    
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
}


- (IBAction)FriendresponseBtnAction:(id)sender {
    ResponseViewController *RVC=[[ResponseViewController alloc]init];
    [self.navigationController pushViewController:RVC animated:YES];
}



- (IBAction)ExtraBtn:(id)sender {
    
    
}
- (IBAction)ChatBtnAction:(id)sender {
    ChatfriendViewController *VC1=[[ChatfriendViewController alloc]init];
    
    // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
    // [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)profileiconBtnAction:(id)sender {
    EditViewController *evc=[[EditViewController alloc]init];
    [self.navigationController pushViewController:evc animated:YES];
}
@end

