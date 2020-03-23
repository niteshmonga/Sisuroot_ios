
#import "ResponseViewController.h"
#import "ResponseTableViewCell.h"
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "SWRevealViewController.h"
#import "UIView+RNActivityView.h"
#import "ViewController.h"
#import "FeedViewController.h"
#import "FriendsViewController.h"
#import "Base64.h"
#import "BS1ViewController.h"
#import "Reachability.h"
#import <Photos/Photos.h>
#import "smilepage1ViewController.h"
#import "GraphView1.h"
#import "GraphView.h"
#import "chattypeViewController.h"
#import "Sisuroot-Swift.h"
@interface ResponseViewController ()
{
    NSMutableArray *userarr;
    BOOL flag;
}

@end

@implementation ResponseViewController

- (void)viewDidLoad {
    _Backgroundimg.hidden=YES;
    _Backgroundimg1.hidden=YES;

      [FIRAnalytics setScreenName:@"Notification" screenClass:@"Notification"];
    [super viewDidLoad];
    [self callnetconnection];
    [self.view endEditing:YES];

    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
      graphView.backgroundColor = [UIColor clearColor];
      GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
      graphView1.backgroundColor = [UIColor clearColor];
      [self.view_footer1 addSubview:graphView];
      [self.view_footer2 addSubview:graphView1];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.view showActivityViewWithLabel:@"Loading"];
    flag=1;
    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    _Circlegrpview.hidden=YES;
    self.navigationController.navigationBar.hidden=YES;
    _MenuBtnObj.hidden=YES;
    [self Requestlist];
    if ([_str2 isEqualToString:@"done"])
    {
        _backBtnobj.hidden=YES;
        _MenuBtnObj.hidden=NO;
    }
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnObj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [self callfetchprofile];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [userarr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden=@"ListtableView";
    ResponseTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:iden];
    if (cell==nil)
    {
        NSArray * array =[[NSBundle mainBundle]loadNibNamed:@"ResponseTableViewCell" owner:self options:nil];
        
        cell=[array objectAtIndex:0];
        
    }
    
    //[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    cell.backBtnobj.tag = indexPath.row;
     [cell.backBtnobj addTarget:self action:@selector(DeleteRequest:) forControlEvents:UIControlEventTouchUpInside];
    cell.Usernamelbl.text=[[userarr valueForKey:@"friendUsername" ] objectAtIndex:indexPath.row];
    cell.commentlbl.text=[[userarr valueForKey:@"msg" ] objectAtIndex:indexPath.row];

    if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"iconStatus"] integerValue] ==1)
    {
        
        [cell.DeleteresponseBtnobj setImage:[UIImage imageNamed:@"tag"] forState:UIControlStateNormal];
        
    }
    else
    {
        [cell.DeleteresponseBtnobj setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
        
    }
    NSString *imgStr =  [[userarr objectAtIndex:indexPath.row]valueForKey:@"friendImg"];
    
    if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
    {
        cell.Userimg.image = [UIImage imageNamed:@"user.png"];
        
    }
    else
    {
        //[cell.Userimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://rootapp.epiksolution.org /servicebus/tag_photo/%@",[[userarr objectAtIndex:indexPath.row]valueForKey:@"friendImg"]]] placeholderImage:nil];
         [cell.Userimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[userarr objectAtIndex:indexPath.row]valueForKey:@"friendImg"]]] placeholderImage:nil];
        cell.Userimg.contentMode=UIViewContentModeScaleToFill;
    }
//  [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

-(void)DeleteRequest  : (UIButton *) btn
{
     MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"TagShareNotifyUpdate" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[[userarr objectAtIndex:btn.tag]valueForKey:@"TagShareID"] forKey:@"tagshareid"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"TagShareNotifyUpdate":dict :dict1];
    
    
    if ([[[userarr objectAtIndex:btn.tag] valueForKey:@"tagging_status"] integerValue] ==1)
    {
        if ([[[userarr objectAtIndex:btn.tag] valueForKey:@"view_status"] isEqual:@"1"])
        {
            ViewController *VC1=[[ViewController alloc]init];
            [VC1 setDatestrarr:[userarr objectAtIndex:btn.tag]];
            [VC1 setStr11:[[userarr objectAtIndex:btn.tag]valueForKey:@"tagId"]];
            [VC1 setTagmestr:@"tagged"];
            [self.navigationController pushViewController:VC1 animated:YES];
        }
        else
        {
            ViewController *VC1=[[ViewController alloc]init];
            [VC1 setDatestrarr:[userarr objectAtIndex:btn.tag]];
            [VC1 setStr11:[[userarr objectAtIndex:btn.tag]valueForKey:@"tagId"]];
            [VC1 setTagmestr:@"tagme"];
            [self.navigationController pushViewController:VC1 animated:YES];
        }
       
        
    }
    else
    {
       
     ViewController *VC1=[[ViewController alloc]init];
     [VC1 setDatestrarr:[userarr objectAtIndex:btn.tag]];
    [VC1 setStr11:[[userarr objectAtIndex:btn.tag]valueForKey:@"tagId"]];
    [VC1 setTagmestr:@"tagme"];
    [self.navigationController pushViewController:VC1 animated:YES];
        
    }
 
}
-(void)Requestlist
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"requestList" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"tagShareNotifications" :dict :paramDict];
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"requestList"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];

            NSString *imgStr1 = [responseDictionary valueForKey:@"data"];
            
            if ([imgStr1 isEqual:(id)[NSNull null]])
            {
                _Backgroundimg.hidden=NO;
                _Backgroundimg1.hidden=NO;
                _ResponseTableviewobj.hidden=YES;
            }
            else
            {
                userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                if(userarr.count>0)
                {
                    _Backgroundimg.hidden=YES;
                    _Backgroundimg1.hidden=YES;
                    _ResponseTableviewobj.hidden=NO;
                   [_ResponseTableviewobj reloadData];
                }
                else
                {
                    _Backgroundimg.hidden=NO;
                    _Backgroundimg1.hidden=NO;
                    _ResponseTableviewobj.hidden=YES;
                 }
            }
        }
        else
        {
            _Backgroundimg.hidden=NO;
            _Backgroundimg1.hidden=NO;
            _ResponseTableviewobj.hidden=YES;
        }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TagShareNotifyUpdate"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
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
        }
    }

}


-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    NSLog(@"error");
}


- (IBAction)BackBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
- (IBAction)HomeBtnAction:(id)sender {
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr1:@"feed"];
    
   
    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)chatbtnAction:(id)sender {
    chattypeViewController *gvc=[[chattypeViewController alloc]init];
   
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)bnt_qa:(id)sender {
        smilepage1ViewController *FVC=[[smilepage1ViewController alloc]init];
        [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)SosBtnAction:(id)sender {
  BS1ViewController *Tvc=[[BS1ViewController alloc]init];
  [self.navigationController pushViewController:Tvc animated:YES];
}

- (IBAction)btn_you:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
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
@end
