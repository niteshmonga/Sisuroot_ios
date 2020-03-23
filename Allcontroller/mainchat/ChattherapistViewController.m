#import "ChattherapistViewController.h"
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
#import <Photos/Photos.h>
#import "smilepage1ViewController.h"
#import "chattypeViewController.h"
@interface ChattherapistViewController ()
{
    NSMutableArray *imgArr2;
}
@end

@implementation ChattherapistViewController

-(void)viewDidAppear:(BOOL)animated
{
    [self callchattherapistlist];
}

- (void)viewDidLoad {
     [FIRAnalytics setScreenName:@"Therapist chat" screenClass:@"Therapist chat"];
    _btn_okalert.layer.borderColor = [UIColor blackColor].CGColor;
    _btn_okalert.layer.borderWidth=2;
    _btn_okalert.layer.cornerRadius=2;
    [self callfetchprofile];
 
     [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    _MenuBtnobj.hidden=YES;
    
     [self callchattherapistlist];
    _refreshControl_thep = [[UIRefreshControl alloc] init];
    [_refreshControl_thep addTarget:self action:@selector(refresh_thep:) forControlEvents:UIControlEventValueChanged];
    [chattableview addSubview:_refreshControl_thep];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

- (void)refresh_thep:(UIRefreshControl *)refreshControl_thep
{
    [self callchattherapistlist];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [imgArr2 count];
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

        cell.cellBtnobj.hidden=YES;
        cell.mhpinfo.hidden=NO;
        cell.mhpinfoimg.hidden=NO;

        if ([[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"online_status"] isEqual:@"0"])
        {
            cell.img_on.hidden=YES;
            
        }
        else
        {
            cell.img_on.hidden=NO;
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
//    if ([[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"online_status"] isEqual:@"0"])
//    {
//    }
//    else
//    {
        ChatViewController *VC1=[[ChatViewController alloc]init];
        [VC1 setDetail1:[imgArr2 objectAtIndex:indexPath.row]];
        [VC1 setSisuchatstr:@"checktherapist"];
        VC1.delegate=self; // protocol listener
        [self.navigationController pushViewController:VC1 animated:YES];
  //  }
}

-(void)callchattherapistlist
{
    //hud.hidden=NO;
    [self.view showActivityViewWithLabel:@"Loading"];
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


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TherapistListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [_refreshControl_thep endRefreshing];
            if ([[responseDictionary valueForKey:@"data"] isEqual:[NSNull null]])
            {
                
            }
            else
            {
                imgArr2 =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
            }
             [chattableview reloadData];
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
    
         chattypeViewController *gvc=[[chattypeViewController alloc]init];
          [self.navigationController pushViewController:gvc animated:YES];
 }



@end
