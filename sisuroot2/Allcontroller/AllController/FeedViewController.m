
#import "FeedViewController.h"
#import "ListTableViewCell.h"
#import "EmotionCollectionViewCell.h"
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
#import "ChatfriendViewController.h"
#import "ResponseViewController.h"
#import "ProfileViewController.h"
#import "BriefstateViewController.h"
#import "Bs3ViewController.h"
#import "BS1ViewController.h"
#import "FrontViewController.h"

//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"

#import "BS6ViewController.h"
#import <sys/utsname.h>
@interface FeedViewController ()
{
    NSMutableArray *Earr;
    NSMutableArray *imgArr;
    NSMutableArray *Emotionarr;
    //  AppDelegate *app;
    BOOL *isfiltered;
    NSMutableArray *FilteredDevices;
    BOOL flag;
    UIRefreshControl *refreshControl;
    AVAudioPlayer *audioPlayer;
     NSString *imgstrtagid;
    NSString *imgstruname;
    NSString *imgstrtagid1;
    NSString *imgstruname1;
}

@end

@implementation FeedViewController
//-(void)viewDidAppear:(BOOL)animated
//{
//    [self callTaglist];
//    [self callfetchprofile];
//
//    // [self.view showActivityViewWithLabel:@"Loading"];
//
//}

-(void)viewWillAppear:(BOOL)animated
{
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] isEqual:@""])
    {
         FrontViewController *frontViewController=[[FrontViewController alloc]init];
         [self.navigationController pushViewController:frontViewController animated:YES];
    }
    else
    {
        [self callTaglist];
        [self callfetchprofile];
        
    }
    // [self.view showActivityViewWithLabel:@"Loading"];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    _Nointernetviewobj.hidden=YES;
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] isEqual:@""])
    {
        
        FrontViewController *frontViewController=[[FrontViewController alloc]init];
        
        [self.navigationController pushViewController:frontViewController animated:YES];
    }
    else
    {
        [self callTaglist];
        [self callfetchprofile];
        
    }
    [self.view showActivityViewWithLabel:@"Loading"];
     _indicatorviewobj.hidden=YES;
    _indicatorviewobj.layer.cornerRadius=10;
    _indicatorviewobj.clipsToBounds=YES;
    
    _FrndResnotificationlblobj.layer.cornerRadius=10;
    _FrndResnotificationlblobj.clipsToBounds=YES;
    
    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    _usernamestr=[[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
    isfiltered=false;
    flag=1;
    self.searchbarobj.delegate=self;
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    _MenuBtnobj.hidden=NO;
    _backBtnobj.hidden=YES;
    
    if ([_str1 isEqualToString:@"done"])
    {
        // _backBtnobj.hidden=YES;
        _MenuBtnobj.hidden=NO;
        
    }
    if ([_str2 isEqualToString:@"done"])
    {
        //_backBtnobj.hidden=NO;
        _MenuBtnobj.hidden=NO;
        
    }
    if ([_str2 isEqualToString:@"feed"])
    {
        //  _backBtnobj.hidden=YES;
        _MenuBtnobj.hidden=NO;
        
    }
    
    if ([_str1 isEqualToString:@"feed"])
    {
        //_backBtnobj.hidden=NO;
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
    Earr=[[NSMutableArray alloc]initWithObjects:@"HAPPY",@"SAD",@"ANGRY",@"HAPPY",@"SAD",@"ANGRY",@"HAPPY",@"SAD",@"ANGRY",@"HAPPY",@"SAD",@"ANGRY", nil];
    
    Emotionarr=[[NSMutableArray alloc]initWithObjects:@"HAPPY",@"SAD",@"ANGRY",@"HAPPY",@"SAD",@"ANGRY",@"HAPPY",nil];
    
    // imgArr=[[NSMutableArray alloc]initWithObjects:@"dummy_user_e.jpg",@"dummy_user_d.jpg",@"dummy_user_c.jpg",@"dummy_user_b.jpg",@"dummy_user_a.jpg",@"dummy_user_c.jpg",@"dummy_user_e.jpg",nil];
    
    [_CollectionViewobj registerNib:[UINib nibWithNibName:@"EmotionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"EmotionCollectionViewCell"];
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    // app =  (AppDelegate *)[[UIApplication sharedApplication]delegate];
    //    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    //    [self.view addGestureRecognizer:tapper];
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh1:) forControlEvents:UIControlEventValueChanged];
    [_FeedlistTableViewobj addSubview:refreshControl];
    
    // [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(receiveTestNotification:)
    //                                                 name:@"notification"
    //
    
   
    
//    if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//
//        switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
//
//            case 1136:
//                printf("iPhone 5 or 5S or 5C");
//                break;
//            case 1334:
//                printf("iPhone 6/6S/7/8");
//                break;
//            case 2208:
//                printf("iPhone 6+/6S+/7+/8+");
//                break;
//            case 2436:
//                printf("iPhone X");
//                break;
//            default:
//                printf("unknown");
//        }
//    }
}

//- (void) receiveTestNotification:(NSNotification *) notification
//{
//    ResponseViewController *RVC=[[ResponseViewController alloc]init];
//    [RVC setCountstr:_countlblstr];
//    [self.navigationController pushViewController:RVC animated:YES];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)refresh1:(UIRefreshControl *)refreshControl
{
    [self callTaglist];
}
-(void) tapped:(UIGestureRecognizer *) sender
{
    //    CGFloat r=(CGFloat) random()/(CGFloat) RAND_MAX;
    //    CGFloat g=(CGFloat) random()/(CGFloat) RAND_MAX;
    //    CGFloat b=(CGFloat) random()/(CGFloat) RAND_MAX;
    //    TapView.backgroundColor=[UIColor colorWithRed:r green:g blue:b alpha:1];
    [_searchbarobj resignFirstResponder];
    // _searchbarobj.hidden=YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isfiltered)
    {
        return FilteredDevices.count;
    }
    else
    {
        return imgArr.count;
        
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"ListtableView";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)
//    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    
    // }
    
    cell.activityobj.hidden=YES;
    cell.EmotionBtnobj.tag = indexPath.row;
    
    [cell.EmotionBtnobj addTarget:self action:@selector(EmotionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.OtherEmoBtnobj.tag = indexPath.row;
    
    [cell.OtherEmoBtnobj addTarget:self action:@selector(OtherEmotionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.chatBtnobj.tag = indexPath.row;
    
    [cell.chatBtnobj addTarget:self action:@selector(ChatAction:) forControlEvents:UIControlEventTouchUpInside];
    //    [cell.EmotionBtnobj setTitle:[Emotionarr objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    //
    //    cell.listprofileimg.image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];
    if (isfiltered)
    {
        NSString *userstr2=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"username"];
        if ( [userstr2 isEqualToString:_usernamestr]) {
            
            //[cell.EmotionBtnobj setTitle:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"] forState:UIControlStateNormal];
            NSString *countstr11=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
            if ([countstr11 isEqual:(id)[NSNull null]] || countstr11.length <1)
            {
                // cell.EmotionBtnlblobj.text=@"";
                 cell.EmotionBtnlblobj.hidden=YES;
            }
            else
            {
                cell.EmotionBtnlblobj.text=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
                
            }
            NSString *countstr12=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotionName"];
            
            if ([countstr12 isEqual:(id)[NSNull null]] || countstr12.length <1)
            {
                // cell.EmotionBtnlblobj.text=@"";
                cell.EmotionBtnobj.hidden=YES;
                
            }
            else
            {
                cell.EmotionBtnobj.hidden=NO;
                
            }
            
            cell.usernamelblobj.text=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"username"];
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
            
            NSString *countstr2=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
            
            if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
            {
                cell.OtherEmoBtnlblobj.text=@"None";
            }
            else
            {
                cell.OtherEmoBtnlblobj.text=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
            }
            
            NSString *countstr3=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
            
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
            cell.chatBtnobj.hidden=NO;
            // cell.inviteBtnobj.frame = CGRectMake(319.0, 48.0, 25.0, 25.0);
            cell.EmotionBtnlblobj.hidden=YES;
            cell.EmotionBtnobj.hidden=YES;
            
            // [cell.EmotionBtnobj setTitle:@"Tagme" forState:UIControlStateNormal];
            //[cell.EmotionBtnobj setTitle:@"Tag Me" forState:UIControlStateNormal];
            //  [cell.EmotionBtnobj setBackgroundImage:[UIImage imageNamed:@"tagmeback.png"] forState:UIControlStateNormal];
            //  cell.Taggedlbl.text=@"Tagged";
            cell.taggedimg.hidden=NO;
            
            NSString *imgStr3 = [[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tagging_status"];
            
            if ([imgStr3 isEqual:(id)[NSNull null]] || [imgStr3 isEqual:@"0"] )
            {
                //[cell.OtherEmoBtnobj setTitle:@"None" forState:UIControlStateNormal];
                //[cell.EmotionBtnobj setTitle:@"Tag Me" forState:UIControlStateNormal];
                //cell.OtherEmoBtnlblobj.text=@"None";
                cell.usernamelblobj.text=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"username"];
                
                cell.shareimg.image = [UIImage imageNamed:@"tag.png"];
                cell.taggedimg.image = [UIImage imageNamed:@"tag_me1.png"];
                cell.shareimg.hidden = NO;
                cell.share1img.hidden = YES;
                cell.inviteBtnobj.hidden=YES;
                cell.backlbl.layer.cornerRadius=10;
                cell.backlbl.layer.borderColor=[UIColor orangeColor].CGColor;
                cell.backlbl.layer.borderWidth =1.0f;
                cell.backlbl.clipsToBounds=YES;
                
                NSString *countstr2=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
                
                if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
                {
                    cell.OtherEmoBtnlblobj.text=@"None";
                }
                else
                {
                    cell.OtherEmoBtnlblobj.text=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
                }
                
                NSString *countstr3=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
                
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
                cell.usernamelblobj.text=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"username"];
                //  cell.usernamelblobj.textColor=[UIColor blackColor];
                
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
                
                NSString *countstr2=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
                
                if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
                {
                    cell.OtherEmoBtnlblobj.text=@"None";
                }
                else
                {
                    cell.OtherEmoBtnlblobj.text=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
                }
                
                NSString *countstr3=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
                
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
        
        [cell.listprofileimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/tag_photo/%@",[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tagImg"]] placeholderImage:nil];
        
        cell.listprofileimg.contentMode=UIViewContentModeScaleToFill;
        
        NSString *commentstr=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"comment"];
        if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
        {
            cell.Liststmtlblobj.text=@"No Comments";
        }
        else
        {
            cell.Liststmtlblobj.text=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"comment"];
        }
        
        // cell.usernamelblobj.text=@"My Post";
        
        if([[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"1"])
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"inner_circle_green40.png"] forState:UIControlStateNormal];
        }
        else if([[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"2"])
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"outer_circle_green40.png"] forState:UIControlStateNormal];
            
        }
        else if([[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"3"])
        {
            
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"both_circle-green40.png"] forState:UIControlStateNormal];
            
        }
        else
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"both_circle_golden40.png"] forState:UIControlStateNormal];
            
        }
        
        NSString *imgStr = [[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
        
        if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
        {
            cell.profileimg.image = [UIImage imageNamed:@"user.png"];
            
        }
        else if([[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"img_status"] integerValue]==1)
            
        {
            [cell.profileimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]]] placeholderImage:nil];
            cell.profileimg.contentMode=UIViewContentModeScaleToFill;
            
        }
        else
        {
            
            [cell.profileimg setImageWithURL:[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"profile_pic"] placeholderImage:nil];
            cell.profileimg.contentMode=UIViewContentModeScaleToFill;
            
        }
   
}


    else
    {
        NSString *userstr2=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"];
        if ( [userstr2 isEqualToString:_usernamestr]) {
            
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
        
        NSString *commentstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
        if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
        {
            cell.Liststmtlblobj.text=@"No Comments";
        }
        else
        {
              cell.Liststmtlblobj.text=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"comment"];
        }
        
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
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    imgstrtagid=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"];
    imgstruname=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"username"];
    imgstrtagid1=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tag_id"];
    imgstruname1=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"username"];
    
     //    if ( [imgstruname isEqualToString:_usernamestr] || [imgstruname1 isEqualToString:_usernamestr])
    //    {
    
      if (isfiltered)
    {
        if (![imgstruname1 isEqualToString:_usernamestr])
        {
                 if ([[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tagging_status"] isEqual:@"1"])
                    {
                        ViewController *VC1=[[ViewController alloc]init];
                       
                        [VC1 setTagmestr:@"tagged"];
                        [VC1 setStr11:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                        [VC1 setDatestrarr:[FilteredDevices objectAtIndex:indexPath.row]];
                        [self.navigationController pushViewController:VC1 animated:YES];
                    }
                    else
                    {
                        ViewController *VC1=[[ViewController alloc]init];
                        
                        [VC1 setTagmestr:@"tagme"];
                        [VC1 setDatestrarr:[FilteredDevices objectAtIndex:indexPath.row]];

                        [VC1 setStr11:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                        [self.navigationController pushViewController:VC1 animated:YES];
                    }
            
         }
        else
        {
            NSString *fstr=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
            NSString *f1str=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"emotionName"];

            if (fstr.length >1 && f1str.length >1)
            {
                Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
                
                [dcv setStr11:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                [dcv setStr12:imgstruname1];
                [dcv setSharestr:@"Share"];
                [dcv setVoicestr111:@"voicestrboth"];
                
                [self.navigationController pushViewController:dcv animated:YES];
            }
            else if ([f1str isEqual:[NSNull null]] || f1str.length <1)
            {
                 Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
                
                [dcv setStr11:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                [dcv setStr12:imgstruname1];
                [dcv setSharestr:@"Share"];
                [self.navigationController pushViewController:dcv animated:YES];
            }
            else if ([fstr isEqual:[NSNull null]] || fstr.length <1)
            {
                Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
                
                [dcv setStr11:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                [dcv setStr12:imgstruname1];
                [dcv setSharestr:@"Share"];
                [dcv setVoicestr111:@"voicestr"];

                [self.navigationController pushViewController:dcv animated:YES];
            }
           
        }
    }
    else
    {
        
        if ([imgstruname isEqualToString:_usernamestr])
        {
            
            NSString *fstr=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
            NSString *f1str=[[imgArr objectAtIndex:indexPath.row]valueForKey:@"emotionName"];
            
            if (fstr.length >1 && f1str.length >1)
            {
                Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
                
                [dcv setStr11:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                [dcv setStr12:imgstruname];
                [dcv setSharestr:@"Share"];
                [dcv setVoicestr111:@"voicestrboth"];
                
                [self.navigationController pushViewController:dcv animated:YES];
            }
            else if ([f1str isEqual:[NSNull null]] || f1str.length <1)
            {
                
                Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
                
                [dcv setStr11:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                [dcv setStr12:imgstruname];
                [dcv setSharestr:@"Share"];
                [self.navigationController pushViewController:dcv animated:YES];
            }
            else if ([fstr isEqual:[NSNull null]] || fstr.length <1)
            {
                Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
                
                [dcv setStr11:[[imgArr objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                [dcv setStr12:imgstruname];
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
    
    //}
    //    Tag_ProfileViewController *TPVC=[[Tag_ProfileViewController alloc]init];
    //    [self.navigationController pushViewController:TPVC animated:YES];
}


-(void)OtherEmotionAction : (UIButton *) btn
{
    
    if (isfiltered)
    {
         if (audioPlayer.playing)
         {
             _indicatorviewobj.hidden=YES;

            [audioPlayer stop];
            [btn setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
            
        }
        else
        {
           // _indicatorviewobj.hidden=NO;
            [_indicatorview startAnimating];

            NSString *voicename=[[imgArr objectAtIndex:btn.tag]valueForKey:@"emotionLatest"];
            NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
            NSURL *url = [NSURL URLWithString:mainUrl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            
            audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
            [audioPlayer play];
            audioPlayer.delegate = self;
            
        [btn setBackgroundImage:[UIImage imageNamed:@"pause_button_green.png"] forState:UIControlStateNormal];
            
            [_indicatorview stopAnimating];

            _indicatorviewobj.hidden=YES;
        }
        

    }
    else
    {
 
    
   
    if (audioPlayer.playing)
    {
        _indicatorviewobj.hidden=YES;
        [audioPlayer stop];
        [btn setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        //_indicatorviewobj.hidden=NO;
        [_indicatorview startAnimating];

        NSString *voicename=[[imgArr objectAtIndex:btn.tag]valueForKey:@"emotionLatest"];
        NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
        NSURL *url = [NSURL URLWithString:mainUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
         [audioPlayer play];
          audioPlayer.delegate = self;
        
         [btn setBackgroundImage:[UIImage imageNamed:@"pause_button_green.png"] forState:UIControlStateNormal];
        [_indicatorview stopAnimating];

        _indicatorviewobj.hidden=YES;
     }
    }
    
    
   
}

-(void)EmotionAction : (UIButton *) btn
{
    
     if (isfiltered)
    {
       
        if (audioPlayer.playing)
        {
            _indicatorviewobj.hidden=YES;
            [audioPlayer stop];
         [btn setBackgroundImage:[UIImage imageNamed:@"play_button_white.png"] forState:UIControlStateNormal];
            
         }
        else
        {
            
            //_indicatorviewobj.hidden=NO;
            [_indicatorview startAnimating];
            NSString *voicename=[[imgArr objectAtIndex:btn.tag]valueForKey:@"emotionName"];
            NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
            NSURL *url = [NSURL URLWithString:mainUrl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
            [audioPlayer play];

            audioPlayer.delegate = self;
        [btn setBackgroundImage:[UIImage imageNamed:@"pause_button_white.png"] forState:UIControlStateNormal];
            _indicatorviewobj.hidden=YES;
            [_indicatorview stopAnimating];

        }
    }
    else
    {
        
       
        if (audioPlayer.playing)
        {
            _indicatorviewobj.hidden=YES;
            [audioPlayer stop];
            [btn setBackgroundImage:[UIImage imageNamed:@"play_button_white.png"] forState:UIControlStateNormal];

        }
        else
        {
           // _indicatorviewobj.hidden=NO;
            [_indicatorview startAnimating];

            NSString *voicename=[[imgArr objectAtIndex:btn.tag]valueForKey:@"emotionName"];
            NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
            NSURL *url = [NSURL URLWithString:mainUrl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
            [audioPlayer play];

            audioPlayer.delegate = self;
            [btn setBackgroundImage:[UIImage imageNamed:@"pause_button_white.png"] forState:UIControlStateNormal];
            
        //    [_indicatorview stopAnimating];

      // _indicatorviewobj.hidden=YES;
            
        }
    }
    
 }

-(void)ChatAction  : (UIButton *) btn
{
    if(isfiltered)
    {
        ChatViewController *VC1=[[ChatViewController alloc]init];
        
        // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
        [VC1 setDetail1:[FilteredDevices objectAtIndex:btn.tag]];
        [VC1 setStrdetail:@"search"];
        [self.navigationController pushViewController:VC1 animated:YES];
    }
    else
    {
        ChatViewController *VC1=[[ChatViewController alloc]init];
        
        // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
        [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
        [VC1 setStrdetail:@"withoutsearch"];
        [self.navigationController pushViewController:VC1 animated:YES];
    }
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
    //    if (value isEqualToString:@"red")
    //    {
    //        coolectionViewCell.color = [UIColor redColor];
    //    }
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
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar                   // return NO to not become first responde
{
    tapper =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar                        // return NO to not resign first responde
{
    [self.view removeGestureRecognizer:tapper];
    return YES;
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0)
    {
        isfiltered=false;
        
        [_FeedlistTableViewobj reloadData];
        
    }
    else
    {
        isfiltered=true;
        
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"searchFeeds" forKey:@"name"];
        NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
        [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
        [paramDict setValue:searchText forKey:@"keyword"];
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"searchFeeds" :dict :paramDict];
        
    }
}
-(void)callTaglist
{
 
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"feedListing" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"feedListing" :dict :dict1];
    
    
}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"feedListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [refreshControl endRefreshing];
            
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"All tags listing"])
            {
                imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
            }
            else
            {
                
                //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                //                [alert show];
            }
             // imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            [_FeedlistTableViewobj reloadData];
            NSString *totalcount = [[responseDictionary valueForKey:@"count_notifications"]valueForKey:@"count"];
            
             if ([totalcount isEqual:(id)[NSNull null]] || [totalcount isEqual:@"0"] ||totalcount.length < 1 )
            {
                //_FrndResnotificationlblobj.text=@"0";
                _FrndResnotificationlblobj.hidden=YES;
            }
            
             else
            {
                _FrndResnotificationlblobj.text=[[responseDictionary valueForKey:@"count_notifications"] valueForKey:@"count"];
                _countlblstr=[[responseDictionary valueForKey:@"count_notifications"] valueForKey:@"countid"];
                
            }
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"searchFeeds"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            // activityIden.hidden=YES;
            //            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Tags not found"])
            //            {
            //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"data Not Match" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //                [alert show];
            //            }
            //            else
            //            {
            
            FilteredDevices=[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            [_FeedlistTableViewobj reloadData];
            
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
             if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] isEqual:@"0"])
            {
                
                [_Chatbtnobj setUserInteractionEnabled:YES];
                
            }
            else
            {
                _Chatbtnobj.alpha = 0.5;
                
                [_Chatbtnobj setUserInteractionEnabled:NO];
                
            }
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"SOS_Status"] isEqual:@"0"])
            {
                [_Sosbtnobj setUserInteractionEnabled:YES];
                
                
            }
            else
            {
                
                _Sosbtnobj.alpha = 0.5;
                
                [_Sosbtnobj setUserInteractionEnabled:NO];
            }
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Phq_Test_Status"] forKey:@"Phq_Test_Status"];
            
             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"location"] forKey:@"location"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Brief_State_Status"] forKey:@"Brief_State_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Perceived_Status"] forKey:@"Perceived_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Sisuchat_Status"] forKey:@"Sisuchat_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] forKey:@"Chat_Status"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Inner_frnd_count"] forKey:@"Inner_frnd_count"];
            
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"Outer_frnd_count"] forKey:@"Outer_frnd_count"];
            
            chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"])
            {
                chatnotification.hidden=YES;
                
            }
            NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
            
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _profileiconimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                [_profileiconimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _profileiconimg.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                [_profileiconimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _profileiconimg.contentMode=UIViewContentModeScaleToFill;
            }
            
            
        }
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    
    //  _Nointernetviewobj.hidden=NO;
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"You should connect with wifi for optimal use." delegate:nil cancelButtonTitle:@"RETRY" otherButtonTitles:nil, nil];
    //
    //    alert.tag=2000;
    //    [alert show];
    
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
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

- (IBAction)SearchbtnAction:(id)sender {
    // _searchbarobj.hidden=NO;
    
    if (flag==1)
    {
        flag=0;
        
        
        _searchbarobj.hidden=NO;
    }
    else{
        flag=1;
        //  _searchbarobj.hidden=YES;
        
    }
    
}
- (IBAction)SettingBtnAction:(id)sender {
    SettingViewController *SVC=[[SettingViewController alloc]init];
    
    [self.navigationController pushViewController:SVC animated:YES];
}
- (IBAction)FeedBtnAction:(id)sender {
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


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
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
- (IBAction)ChatBtnAction:(id)sender {
    ChatfriendViewController *VC1=[[ChatfriendViewController alloc]init];
    
    // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
    // [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)FriendresponseBtnAction:(id)sender {
    ResponseViewController *RVC=[[ResponseViewController alloc]init];
    [RVC setCountstr:_countlblstr];
    [self.navigationController pushViewController:RVC animated:YES];
}
- (IBAction)profileiconBtnAction:(id)sender {
    ProfileViewController *evc=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:evc animated:YES];
}

- (IBAction)BSBtnAction:(id)sender {
    BriefstateViewController *BSVC=[[BriefstateViewController alloc]init];
    [self.navigationController pushViewController:BSVC animated:YES];
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


- (IBAction)SosBtnAction:(id)sender {
    BS1ViewController *BSVC=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:BSVC animated:YES];
}

- (IBAction)NointernetBtnAction:(id)sender {
}
@end
    
   
    
