

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
#import "SWRevealViewController.h"a
#import "UIView+RNActivityView.h"
#import "ChatViewController.h"
#import "BS1ViewController.h"
#import "UIView+Toast.h"
#import <Photos/Photos.h>
#import "smilepage1ViewController.h"
#import "chattypeViewController.h"
#import "chatfroupconratcViewController.h"
#import "FriendsaddViewController.h"
#import "ChatfriendViewController.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface chatfroupconratcViewController ()
{
    NSMutableArray *imgArr2;
}
@end

@implementation chatfroupconratcViewController


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if(textField==_groupname)
    {
        
        [_CreateGroupBtnobj setUserInteractionEnabled:YES];
        
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [self callchattherapistlist];
}
- (IBAction)btn_add_new_conact:(id)sender {
    FriendsaddViewController *FVC=[[FriendsaddViewController alloc]init];
    [self.navigationController pushViewController:FVC animated:YES];
}
- (IBAction)btn_add_new_group:(id)sender {
     _createview.hidden=NO;
    
}
- (IBAction)btn_back:(id)sender {
      _createview.hidden=YES;
}
- (IBAction)btn_create:(id)sender {
        BOOL stricterFilter = NO;
        NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
        NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
        NSString *laxString1 =@"^[7-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]";
        
        NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        
        NSString *msg  = @"0";
        if([_groupname.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
        {
            
            msg = @"Please enter Groupname";
        }
        else if(_groupname.text.length < 1)
        {
            
            msg = @"Please enter Groupname";
        }
        else
        {
            _createview.hidden=YES;
            [_CreateGroupBtnobj setUserInteractionEnabled:YES];
            NSString *allContactIdString=@"";
            for (int i = 0; i < imgArr2.count; i++)
            {
                if ([[[imgArr2 objectAtIndex:i] valueForKey:@"status"] integerValue] == 1)
                {
                    if (i == 0)
                    {
                        allContactIdString = [[imgArr2 objectAtIndex:i] valueForKey:@"friend_id"];
                    }
                    else
                    {
                        allContactIdString = [NSString stringWithFormat:@"%@,%@",allContactIdString,[[imgArr2 objectAtIndex:i] valueForKey:@"friend_id"]];
                        
                    }
                }
            }
             
            if([allContactIdString isEqualToString:@""])
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please select contact" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                _createview.hidden=YES;
            }
            else
            {
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"addgroup" forKey:@"name"];
            
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
            [dict1 setValue:_groupname.text forKey:@"group_name"];
            //[dict1 setValue:imagestr forKey:@"image"];
            
            [dict1 setValue:allContactIdString forKey:@"user_id"];
            
            [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"admin_id"];
            
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"addgroup" :dict :dict1];
            }
        }
}

- (void)viewDidLoad {
    
    _createview.hidden=YES;
    _view_group.layer.cornerRadius=15;
     _view_contact.layer.cornerRadius=15;
     [FIRAnalytics setScreenName:@"Therapist chat" screenClass:@"Therapist chat"];
    _btn_okalert.layer.borderColor = [UIColor blackColor].CGColor;
    _btn_okalert.layer.borderWidth=2;
    _btn_okalert.layer.cornerRadius=2;
    [self callfetchprofile];
    _btn_add_new_group.userInteractionEnabled=NO;
     [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    _MenuBtnobj.hidden=YES;
    
     [self callchattherapistlist];
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

-(void)EmotionAction1  : (UIButton *) btn
{
    
    NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
    
    localDict = [imgArr2 objectAtIndex:btn.tag];
    
    if ([[localDict valueForKey:@"status"] integerValue] == 0)
    {
        [localDict setValue:@"1" forKey:@"status"];
        
    }
    else
    {
        
        [localDict setValue:@"0" forKey:@"status"];
    }
    _btn_add_new_group.userInteractionEnabled=YES;
    [chattableview reloadData];
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
    if ([[[imgArr2 objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 0)
    {
        cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-0_percents.png"];
    }
    else
    {
       cell.selectBtnobj.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
    }
    cell.selectBtnobj.hidden=NO;
    cell.mhpinfo.hidden=YES;
    cell.mhpinfoimg.hidden=YES;

        //cell.cellBtnobj.hidden=YES;
        cell.mhpinfo.hidden=NO;
        cell.mhpinfoimg.hidden=NO;

       
            cell.img_on.hidden=YES;
         
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
//        if ([[[imgArr2 objectAtIndex:indexPath.row]valueForKey:@"online_status"] isEqual:@"0"])
//        {
//
//        }
//        else
//        {
//            ChatViewController *VC1=[[ChatViewController alloc]init];
//            [VC1 setDetail1:[imgArr2 objectAtIndex:indexPath.row]];
//             VC1.delegate=self; // protocol listener
//            [self.navigationController pushViewController:VC1 animated:YES];
//        }
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
    [webServiceManager callMyWebServiceManager:@"fetchalluser" :dict :dict1];
    
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TherapistListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            if ([[responseDictionary valueForKey:@"data"] isEqual:[NSNull null]])
            {
                
            }
            else
            {
                NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
                imgArr2 = [[NSMutableArray alloc] init];
                
                for (int i = 0; i <localArray.count; i++)
                {
                    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                    dict = [[localArray objectAtIndex:i] mutableCopy];
                    [dict setValue:@"0" forKey:@"status"];
                    [imgArr2 addObject:dict];
                }
                [chattableview reloadData];
                
            }
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"addgroup"])
    {
         ChatfriendViewController *VC1=[[ChatfriendViewController alloc]init];
        [self.navigationController pushViewController:VC1 animated:YES];
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    NSLog(@"error");
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

- (IBAction)BackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    //chattypeViewController *gvc=[[chattypeViewController alloc]init];
         // [self.navigationController pushViewController:gvc animated:YES];
 }
@end
