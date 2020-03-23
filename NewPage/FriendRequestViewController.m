
#import <Photos/Photos.h>
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "SWRevealViewController.h"
#import "UIView+RNActivityView.h"
#import "ViewController.h"
#import "FeedViewController.h"
#import "Base64.h"
#import "BS1ViewController.h"
#import "Reachability.h"
#import "SCLAlertView.h"
#import "GraphView.h"
#import "GraphView1.h"
#import "FriendRequestViewController.h"
#import "smilepage1ViewController.h"
#import "friendrequestCollectionViewCell.h"
#import "chattypeViewController.h"
#import "FriendsViewController.h"
#import "Sisuroot-Swift.h"
@import Firebase;

@interface FriendRequestViewController ()
{
     NSMutableArray *listArray;
}

@end

@implementation FriendRequestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imgnodata.hidden=YES;
    _MenuBtnObj.hidden=YES;
       [self callThisWebservice];
    self.navigationController.navigationBar.hidden=YES;
      
        [FIRAnalytics setScreenName:@"Friend Request" screenClass:@"Friend Request"];
       [_collectionview registerNib:[UINib nibWithNibName:@"friendrequestCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"friendrequestCollectionViewCell"];
    
    if ([_str1 isEqualToString:@"done"])
    {
        _backBtnobj.hidden=YES;
        _MenuBtnObj.hidden=NO;
    }
    
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];

           graphView.backgroundColor = [UIColor clearColor];
              
              GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
                 graphView1.backgroundColor = [UIColor clearColor];
              
              
                 [self.view_footer1 addSubview:graphView];
              [self.view_footer2 addSubview:graphView1];
    SWRevealViewController *revealController = [self revealViewController];
       revealController.panGestureRecognizer.enabled = YES;
         revealController.tapGestureRecognizer.enabled=YES;
       [revealController panGestureRecognizer];
       [revealController tapGestureRecognizer];
       
       [ _MenuBtnObj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [self callnetconnection];
       [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)callnetconnection
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You should connect with wifi for optimal use." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        alert.tag=2000;
        [alert show];
    }
    else if (status == ReachableViaWiFi)
    {
        //WiFi
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
    }
}

-(void)actionSheet:(UIActionSheet *)myActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(myActionSheet.tag==11)
    {
        switch (buttonIndex)
        {
                case 0:
                [self callAcceptAPI:@"1"];
                break;
                case 1:
                [self callAcceptAPI:@"2"];
                break;
            default:
                break;
        }
    }
    else
    {
        switch (buttonIndex)
        {
            case 0:
                break;
            case 1:
                   break;
            default:
                break;
        }
    }
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return listArray.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
          return CGSizeMake(300, 335);
}
-(void)btnacceptaction : (UIButton *) btn
{
    _str_Sel_sendby=[[listArray objectAtIndex:btn.tag] valueForKey:@"sendBy"];
    _str_sel_frnd_request_post_status=[[listArray objectAtIndex:btn.tag] valueForKey:@"frnd_request_post_status"];
   UIActionSheet *selectcircle = [[UIActionSheet alloc] initWithTitle:@"Circle Type" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer", nil];
    [selectcircle setTag:11];
    selectcircle.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [selectcircle showInView:self.view];
}


-(void)btndeclineaction : (UIButton *) btn
{
    _str_Sel_sendby=[[listArray objectAtIndex:btn.tag] valueForKey:@"sendBy"];
    _str_sel_frnd_request_post_status=[[listArray objectAtIndex:btn.tag] valueForKey:@"frnd_request_post_status"];
    UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Do you want to block the user? " delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
    [alertcrp addButtonWithTitle:@"Yes"];
    alertcrp.tag=12;
    [alertcrp show];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *identifier = @"friendrequestCollectionViewCell";
             friendrequestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if([[[listArray objectAtIndex:indexPath.row] valueForKey:@"alert_type"] isEqualToString:@"friend"] &&  [[[listArray objectAtIndex:indexPath.row] valueForKey:@"accepted_status"] isEqualToString:@"0"])
       {
           cell.btn_accept.hidden=NO;
           cell.btn_reject.hidden=NO;
           cell.view_btn.hidden=NO;
           cell.btn_accept.tag=indexPath.row;
           cell.btn_reject.tag=indexPath.row;
           [cell.btn_accept addTarget:self action:@selector(btnacceptaction:) forControlEvents:UIControlEventTouchUpInside];
           [cell.btn_reject addTarget:self action:@selector(btndeclineaction:) forControlEvents:UIControlEventTouchUpInside];
       }
        else
        {
            cell.btn_accept.hidden=YES;
            cell.btn_reject.hidden=YES;
            cell.view_btn.hidden=YES;
        }
        cell.lbl_username.text=[[listArray objectAtIndex:indexPath.row]valueForKey:@"username"];
        NSString *imgStr1 = [[listArray objectAtIndex:indexPath.row]valueForKey:@"profile_img"];
    
        if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
        {
            cell.image_user.image = [UIImage imageNamed:@"user.png"];
        }
        else
        {
        if([[[listArray objectAtIndex:indexPath.row] valueForKey:@"image_status"] integerValue]== 1)
            
        {
            [cell.image_user setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[listArray objectAtIndex:indexPath.row]valueForKey:@"profile_img"]] placeholderImage:nil];
         }
        else if([[[listArray objectAtIndex:indexPath.row] valueForKey:@"image_status"] integerValue]== 0)
        {
            [cell.image_user setImageWithURL:[[listArray objectAtIndex:indexPath.row]valueForKey:@"profile_img"]placeholderImage:nil];
            cell.image_user.contentMode=UIViewContentModeScaleToFill;
            
        }
    }
     return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//  if([[[listArray objectAtIndex:indexPath.row] valueForKey:@"alert_type"] isEqualToString:@"sisuchat"])
//  {
//      chattypeViewController *SVC=[[chattypeViewController alloc]init];
//      [self.navigationController pushViewController:SVC animated:YES];
//     // [[NSNotificationCenter defaultCenter] postNotificationName:@"SisuchatNotification" object:self];
// }
//    else
//        if([[[listArray objectAtIndex:indexPath.row] valueForKey:@"alert_type"] isEqualToString:@"chat"])
//        {
//            chattypeViewController *SVC=[[chattypeViewController alloc]init];
//            [self.navigationController pushViewController:SVC animated:YES];
//        }
//    else
//        if([[[listArray objectAtIndex:indexPath.row] valueForKey:@"alert_type"] isEqualToString:@"friend"])
//        {
//            FriendsViewController *SVC=[[FriendsViewController alloc]init];
//            [self.navigationController pushViewController:SVC animated:YES];
//
//        }
    
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
- (IBAction)backbtnaction:(id)sender {
     [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btn_sos:(id)sender
{
    BS1ViewController *evc=[[BS1ViewController alloc]init];
      [self.navigationController pushViewController:evc animated:YES];
}
- (IBAction)btn_home:(id)sender {
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr1:@"feed"];
    [self.navigationController pushViewController:FVC animated:YES];
}
- (IBAction)btn_chat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btn_you:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btn_qa:(id)sender {
        smilepage1ViewController *FVC=[[smilepage1ViewController alloc]init];
        [self.navigationController pushViewController:FVC animated:YES];
}
-(void) processFailed :(NSDictionary *)responseDictionary
{
    
}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"list"])
    {
        if ([[responseDictionary valueForKey:@"success"] integerValue] == 200)
        {
                listArray =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            if(listArray.count==0)
                      {
                          _imgnodata.hidden=NO;
                      }
                      else
                      {
                        _imgnodata.hidden=YES;
                      }
                 [_collectionview reloadData];
       }
        else
        {
            listArray =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            if(listArray.count==0)
            {
                _imgnodata.hidden=NO;
            }
            else
            {
              _imgnodata.hidden=YES;
            }
            [_collectionview reloadData];
        }
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"RequestAccept"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
            [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"Sisuroot" subTitle:[responseDictionary valueForKey:@"status_message"] closeButtonTitle:@"OK" duration:0.0f];
              [self callThisWebservice];
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"blocknUnblockUser"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
            [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"Sisuroot" subTitle:[responseDictionary valueForKey:@"status_message"] closeButtonTitle:@"OK" duration:0.0f];
            [self callThisWebservice];
        }
    }
}

-(void)callThisWebservice
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"list" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"user_id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"AlertNotificationList" :dict :dict1];
}
-(void)callAcceptAPI:(NSString*)circletype
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"RequestAccept" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"userid"];
    [dict1 setValue:_str_Sel_sendby forKey:@"frndid"];
    [dict1 setValue:@"1" forKey:@"action"];
    [dict1 setValue:_str_sel_frnd_request_post_status forKey:@"frnd_request_post_status"];
    [dict1 setValue:circletype forKey:@"circle"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"RequestAccept" :dict :dict1];
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
        if(alertView.tag==12)
        {
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"RequestAccept" forKey:@"name"];
            
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
            //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
            
            [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"userid"];
            [dict1 setValue:_str_Sel_sendby forKey:@"frndid"];
            [dict1 setValue:@"0" forKey:@"action"];
            [dict1 setValue:_str_sel_frnd_request_post_status forKey:@"frnd_request_post_status"];
            
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"RequestAccept" :dict :dict1];
        }
    }
    else
    {
         if(alertView.tag==12)
        {
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"blocknUnblockUser" forKey:@"name"];
            
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
            //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
            
            [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"requestFromId"];
            [dict1 setValue:_str_Sel_sendby forKey:@"requestToId"];
            [dict1 setValue:@"0" forKey:@"action"];
            
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"blocknUnblockUser" :dict :dict1];
        }
    }
}

@end
