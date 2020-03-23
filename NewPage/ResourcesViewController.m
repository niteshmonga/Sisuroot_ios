
#import <Photos/Photos.h>
#import "ResourcesViewController.h"
#import "NotificationListTableViewCell.h"
#import "SettingViewController.h"
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "SWRevealViewController.h"
#import "UIView+RNActivityView.h"
#import "ViewController.h"
#import "FeedViewController.h"
#import "BS1ViewController.h"
#import "FriendsViewController.h"
#import "GalleryViewController.h"
#import "ChatfriendViewController.h"
#import "GraphView.h"
#import "chattypeViewController.h"
#import "GraphView1.h"
#import "Base64.h"
#import "BS1ViewController.h"
#import "Reachability.h"
#import "smilepage1ViewController.h"
#import "Sisuroot-Swift.h"
#import "UIView+RNActivityView.h"
@interface ResourcesViewController ()
{
    NSMutableArray *userarr;
    NSMutableArray *imgArr;
    NSMutableArray *iconarr;
    NSMutableArray *circlearr;
    BOOL search;
    NSMutableArray *dataSource1;
    BOOL flag;
    NSString *str1;
    NSMutableArray *listArray;
    BOOL check;
}
@end

@implementation ResourcesViewController



- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.view hideActivityView];
}


- (void)viewDidLoad {
    
    
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
       graphView.backgroundColor = [UIColor clearColor];
       GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
       graphView1.backgroundColor = [UIColor clearColor];
       [self.view_footer1 addSubview:graphView];
       [self.view_footer2 addSubview:graphView1];

    
    [FIRAnalytics setScreenName:@"Resources" screenClass:@"Resources"];
    
    [super viewDidLoad];
    [self callThisWebservice];
    self.navigationController.navigationBar.hidden=YES;
    
    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
     [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    [self.view showActivityViewWithLabel:@"Loading"];
      
    NSString *baseURL= [NSString stringWithFormat:@"https://sisuroot.com/resources__v2.html"];
    [_resourcesview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:baseURL]]];
    [ _MenuBtnObj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    _profileiconimg.layer.cornerRadius=20;
    _profileiconimg.clipsToBounds=YES;
    
    _profileiconimg.layer.borderWidth =2;
    _profileiconimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _profileBtnobj1.layer.cornerRadius=20;
    _profileBtnobj1.clipsToBounds=YES;
    
    _profileBtnobj1.layer.borderWidth =2;
    _profileBtnobj1.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    [self callfetchprofile];
    
    // Do any additional setup after loading the view from its nib.
}



-(void)callThisForeGroundMethode
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"clearlist" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"user_id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"AlertNotificationClearall" :dict :dict1];
}
- (IBAction)btn_qa:(id)sender {
    smilepage1ViewController *FVC=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:FVC animated:YES];
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


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"list"])
    {
        if ([[responseDictionary valueForKey:@"success"] integerValue] == 200)
        {
               listArray =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            [tableView reloadData];
            }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"clearlist"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] == 200)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            
            listArray =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            [tableView reloadData];
            
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
            
            NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
            
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _profileiconimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                [_profileiconimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"publicurl"],@"profile_pic/",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                //[_profileiconimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://rootapp.epiksolution.org /servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
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

-(void) processFailed :(NSDictionary *)responseDictionary
{
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NotificationListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationTableViewCell"];
    
    
    if (cell == nil)
    {
        NSArray *arry = [[NSBundle mainBundle] loadNibNamed:@"NotificationListTableViewCell" owner:self options:nil];
        cell = [arry objectAtIndex:0];
    }
    cell.backlbl.layer.cornerRadius=10;
    cell.btnaccept.hidden=YES;
    cell.btndelete.hidden=YES;
    cell.btndecline.hidden=YES;
    cell.backlbl.clipsToBounds=YES;
    
    cell.backlbl.layer.borderWidth =1;
    cell.backlbl.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    cell.msglbl.text = [[listArray objectAtIndex:indexPath.row] valueForKey:@"message"];
    
    cell.datelbl.text = [[listArray objectAtIndex:indexPath.row] valueForKey:@"updated_at"];
    
    cell.typelbl.text = [[listArray objectAtIndex:indexPath.row] valueForKey:@"title"];
    
    NSString *imgStr1 = [[listArray objectAtIndex:indexPath.row]valueForKey:@"profile_img"];
    
    if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
    {
        cell.userimg.image = [UIImage imageNamed:@"user.png"];
        
    }
    else
    {
        if([[[listArray objectAtIndex:indexPath.row] valueForKey:@"image_status"] integerValue]== 1)
            
        {
            
            [cell.userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"publicurl"],@"profile_pic/",[[listArray objectAtIndex:indexPath.row]valueForKey:@"profile_img"]] placeholderImage:nil];
            
          //  [cell.userimg setImageWithURL:[NSString stringWithFormat:@"https://rootapp.epiksolution.org /servicebus/profile_pic/%@",[[listArray objectAtIndex:indexPath.row]valueForKey:@"profile_img"]] placeholderImage:nil];
            
            
            //  [cell.userimg setImageWithURL:[NSString stringWithFormat:@"https://rootapp.epiksolution.org /servicebus/profile_pic/%@",[[listArray objectAtIndex:indexPath.row]valueForKey:@"profile_img"]] placeholderImage:nil];
            //   cell.userimg.contentMode=UIViewContentModeScaleToFill;
            
        }
        else if([[[listArray objectAtIndex:indexPath.row] valueForKey:@"image_status"] integerValue]== 0)
        {
            [cell.userimg setImageWithURL:[[listArray objectAtIndex:indexPath.row]valueForKey:@"profile_img"]placeholderImage:nil];
            cell.userimg.contentMode=UIViewContentModeScaleToFill;
            
        }
    }
    
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
}


-(IBAction)backAction:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}












- (IBAction)BackBtnAction:(id)sender {
    
    [self callThisForeGroundMethode];
}

- (IBAction)SearchBtnAction:(id)sender {
    _SearchBarobj.hidden=NO;
    
}
- (IBAction)SettingBtnAction:(id)sender {
    SettingViewController *SVC=[[SettingViewController alloc]init];
    [self.navigationController pushViewController:SVC animated:YES];
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
- (IBAction)HomeBtnAction:(id)sender {
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr1:@"feed"];
    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)FriendsBtnAction:(id)sender {
    FriendsViewController *VC1=[[FriendsViewController alloc]init];
    
    // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
    // [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)GalleryBtnAction:(id)sender {
    GalleryViewController *gvc=[[GalleryViewController alloc]init];
    
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)chatbtnAction:(id)sender {
    chattypeViewController *gvc=[[chattypeViewController alloc]init];
    
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)SosBtnAction:(id)sender {
    BS1ViewController *Tvc=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:Tvc animated:YES];
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

- (IBAction)Homebtn1Action:(id)sender
{
    BS1ViewController *FVC=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:FVC animated:YES];
}


@end
