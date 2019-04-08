
#import "ResponseViewController.h"
#import "ResponseTableViewCell.h"
#import "SettingViewController.h"
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "SWRevealViewController.h"
#import "UIView+RNActivityView.h"
#import "ViewController.h"
#import "ProfileViewController.h"
#import "FeedViewController.h"
#import "FriendsViewController.h"
#import "GalleryViewController.h"
#import "ChatfriendViewController.h"
#import "Base64.h"
#import "Tag_ProfileViewController.h"
#import "Bs3ViewController.h"
#import "BS1ViewController.h"
#import "Reachability.h"

//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface ResponseViewController ()
{
    NSMutableArray *userarr;
    NSMutableArray *imgArr;
    NSMutableArray *iconarr;
    NSMutableArray *circlearr;
    BOOL search;
    NSMutableArray *dataSource1;
    BOOL flag;
    NSString *str1;
    //    NSString *str2;
    //    NSString *str3;
    BOOL check;

}

@end

@implementation ResponseViewController

- (void)viewDidLoad {
      [FIRAnalytics setScreenName:@"Notification" screenClass:@"Notification"];
    [super viewDidLoad];
    [self callnetconnection];

    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.view showActivityViewWithLabel:@"Loading"];

    //_backBtnobj.hidden=YES;
    flag=1;
    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    //_MenuBtnObj.hidden=NO;
    //[self callFriendList];
    _Circlegrpview.hidden=YES;
    self.navigationController.navigationBar.hidden=YES;
    _SearchBarobj.hidden=YES;
    _MenuBtnObj.hidden=YES;
    search = NO;
    [self Requestlist];
    
    
    if ([_str2 isEqualToString:@"done"])
    {
        _backBtnobj.hidden=YES;
        _MenuBtnObj.hidden=NO;

    }
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
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

    dataSource1=[[NSMutableArray alloc]init];
    
    imgArr=[[NSMutableArray alloc]initWithObjects:@"dummy_contact_e.png",@"dummy_contact_d.png",@"dummy_contact_c.png",@"dummy_contact_b.png",@"dummy_contact_a.png",@"dummy_contact_e.png",@"dummy_contact_d.png",@"dummy_contact_c.png",@"dummy_contact_b.png",@"dummy_contact_a.png",nil];
    
    iconarr=[[NSMutableArray alloc]initWithObjects:@"root_inner_circle.png",@"root_outer_circle.png",@"root_inner_circle.png",@"root_inner_circle.png",@"root_no_circles.png",@"root_inner_circle.png",@"root_outer_circle.png",@"root_inner_circle.png",@"root_inner_circle.png",@"root_no_circles.png",nil];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // circlearr=[[NSMutableArray alloc]initWithObjects:@"dummy_user_e.jpg",@"dummy_user_d.jpg",@"dummy_user_c.jpg",@"dummy_user_b.jpg",@"dummy_user_a.jpg",@"dummy_user_c.jpg",@"dummy_user_e.jpg",nil];
    
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    
    //    SWRevealViewController *revealController = [self revealViewController];
    //
    //
    //    [revealController panGestureRecognizer];
    //    [revealController tapGestureRecognizer];
 
    //    [ _MenuBtnObj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    //    if ([_str1 isEqualToString:@"done"])
    //    {
    //        _backBtnobj.hidden=YES;
    //        _MenuBtnObj.hidden=NO;
    //
    //    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    //    CGFloat r=(CGFloat) random()/(CGFloat) RAND_MAX;
    //    CGFloat g=(CGFloat) random()/(CGFloat) RAND_MAX;
    //    CGFloat b=(CGFloat) random()/(CGFloat) RAND_MAX;
    //    TapView.backgroundColor=[UIColor colorWithRed:r green:g blue:b alpha:1];
    [_SearchBarobj resignFirstResponder];
    _SearchBarobj.hidden=YES;
}


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return userarr.count;
//
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    static NSString *simpleTableIdentifier = @"ListtableView";
//
//    FriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"FriendsTableViewCell" owner:self options:nil];
//
//        cell = [nib objectAtIndex:0];
//
//    }
//   // [cell.CircleBtnobj setTitle:[iconarr objectAtIndex:indexPath.row] forState:UIControlStateNormal];
//
//    cell.Userimg.image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];
//    cell.Circleimg.image = [UIImage imageNamed:[iconarr objectAtIndex:indexPath.row]];
//
//    //cell..image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];
//    cell.Usernamelbl.text=[userarr objectAtIndex:indexPath.row];
//
//    return cell;
//}


//
//        cell.imgsObj.image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"contacts error in num of row");
    //    if (search == YES)
    //    {
    //        return dataSource1.count;
    //
    //    }
    //    else
    //    {
    //        return userarr.count;
    //    }
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
        
        [cell.DeleteresponseBtnobj setImage:[UIImage imageNamed:@"tag_usernew.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        [cell.DeleteresponseBtnobj setImage:[UIImage imageNamed:@"shareo.png"] forState:UIControlStateNormal];
        
    }
    NSString *imgStr =  [[userarr objectAtIndex:indexPath.row]valueForKey:@"friendImg"];
    
    if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
    {
        cell.Userimg.image = [UIImage imageNamed:@"user.png"];
        
    }
    else
    {
        [cell.Userimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/tag_photo/%@",[[userarr objectAtIndex:indexPath.row]valueForKey:@"friendImg"]]] placeholderImage:nil];
        cell.Userimg.contentMode=UIViewContentModeScaleToFill;
    }
 
    if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"tagging_status"] isEqual:@"1"]) {
        // cell.backlblobj.backgroundColor=[UIColor colorNamed:]
       
        
        
        if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"view_status"] isEqual:@"1"])
        {
            cell.backlblobj.layer.backgroundColor = [[UIColor colorWithRed:(235.0/255.0)
                                                                     green:(235.0/255.0)
                                                                      blue:(241.0/255.0)
                                                                     alpha:(1.0)] CGColor];
        }
        else
        {
            
            cell.backlblobj.layer.backgroundColor = [[UIColor whiteColor] CGColor];
            
        }
    }
    else
    {
          if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"view_status"] isEqual:@"1"])
          {
              cell.backlblobj.layer.backgroundColor = [[UIColor colorWithRed:(128.0/255.0)
                                                                       green:(255.0/255.0)
                                                                        blue:(170.0/255.0)
                                                                       alpha:(1.0)] CGColor];
          }
        else
        {
            
            cell.backlblobj.layer.backgroundColor = [[UIColor whiteColor] CGColor];

        }
        
//        for (int i=0; i<[_countstr count]; i++)
//        {
//            if ([[_countstr objectAtIndex:i] isEqual:[[userarr objectAtIndex:i] valueForKey:@"tagId"]]) {
//
//                cell.backlblobj.layer.backgroundColor = [[UIColor lightGrayColor] CGColor];
//
//            }
//            else
//            {
//                cell.backlblobj.layer.backgroundColor = [[UIColor whiteColor] CGColor];
//            }
//        }
        
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ViewController *VC1=[[ViewController alloc]init];
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"click on Tagme button"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//    [VC1 setStr11:[[userarr objectAtIndex:indexPath.row]valueForKey:@"tagId"]];
//    [VC1 setTagmestr:@"tagme"];
//    [self.navigationController pushViewController:VC1 animated:YES];
    //    DetailCarViewController *dtl=[[DetailCarViewController alloc]init];
    //    [self.navigationController pushViewController:dtl animated:YES];
    
}
-(void)RequestAction  : (UIButton *) btn
{
    // NSString *str2;
    str1= [[userarr objectAtIndex:btn.tag]valueForKey:@"id"];
    //    str2=@"inner";
    //    str3=@"outer";
    
    //  [dict1 setValue:_friendstr forKey:@"requestToId"];
    // [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
    if (flag==1) {
        flag=0;
        
        _Circlegrpview.hidden=NO;
    }
    else{
        flag=1;
        _Circlegrpview.hidden=YES;
        
    }
    
}
-(void)callviewstatus
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
        
        
    //    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    //    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    //    [dict setValue:@"cancelRequest" forKey:@"name"];
    //
    //    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    //
    //    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestToId"];
    //
    //    [dict1 setValue:[[userarr objectAtIndex:btn.tag]valueForKey:@"id"] forKey:@"requestFromId"];
   
    //    [webServiceManager setDelegateMethode:self];
    //    [webServiceManager callMyWebServiceManager:@"cancelRequest":dict :dict1];
 
}
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    [dataSource1 removeAllObjects];
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchBar.text];
    if (searchBar.text.length == 0)
    {
        search = NO;
    }
    else
    {
        // [self callSearchList];
        
        search = YES;
        dataSource1 = [NSMutableArray arrayWithArray: [userarr filteredArrayUsingPredicate:resultPredicate]];
    }
    [_ResponseTableviewobj reloadData];
    return YES;
}


-(void)Requestlist
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"requestList" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    //    [paramDict setValue:_ForgotTF.text forKey:@"email"];username
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
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have no notifications" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
                
            }
            
            else
            {
                userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                [_ResponseTableviewobj reloadData];
                
                //[self Requestlist];
                //            LoginViewController *Hgn= [[LoginViewController alloc]init];
                //            [self.navigationController pushViewController:Hgn animated:YES];
                
                //                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                //                     [alert show];
                
            }
        }
        else
        {
//                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                        [alert show];
            
         }
 
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TagShareNotifyUpdate"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
        }
        
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"acceptFriendRequest"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            
            // userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            _Circlegrpview.hidden=YES;
            [_ResponseTableviewobj reloadData];
            //            LoginViewController *Hgn= [[LoginViewController alloc]init];
            //            [self.navigationController pushViewController:Hgn animated:YES];
            
            //                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //                    [alert show];
         }
        else
        {
            //                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //                    [alert show];
            
            
        }
        
        
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"cancelRequest"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            
            // userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            [_ResponseTableviewobj reloadData];
            //            LoginViewController *Hgn= [[LoginViewController alloc]init];
            //            [self.navigationController pushViewController:Hgn animated:YES];
            
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            
            
        }
        else
        {
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
    // ActivityIdenter.hidden=NO;
    [self.view hideActivityView];

    NSLog(@"error");
    
    //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //            [alert show];
    
}


- (IBAction)BackBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)SearchBtnAction:(id)sender {
    _SearchBarobj.hidden=NO;
    
}
- (IBAction)SettingBtnAction:(id)sender {
    SettingViewController *SVC=[[SettingViewController alloc]init];
    [self.navigationController pushViewController:SVC animated:YES];
}

- (IBAction)InnerCircleBtn:(id)sender {
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"acceptFriendRequest" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
    // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestToId"];
    //
    // [dict1 setValue:[[str1 objectAtIndex:sender.tag]valueForKey:@"request_id"] forKey:@"requestToId"];
    [dict1 setValue:str1 forKey:@"requestFromId"];
    //[dict1 setValue:str1 forKey:@"img_name"];
    
    //  [dict1 setValue:_friendstr forKey:@"requestToId"];
    [dict1 setValue:@"1" forKey:@"groupCircle"];
    
    //  [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"inner"] forKey:@"groupCircle"];
    
    //[dict1 setValue:@"0" forKey:@"status"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"acceptFriendRequest":dict :dict1];
    
}


- (IBAction)OuterCircleBtn:(id)sender
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"acceptFriendRequest" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
    // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestToId"];
    //
    // [dict1 setValue:[[str1 objectAtIndex:sender.tag]valueForKey:@"request_id"] forKey:@"requestToId"];
    [dict1 setValue:str1 forKey:@"requestFromId"];
    //[dict1 setValue:str1 forKey:@"img_name"];
    [dict1 setValue:@"2" forKey:@"groupCircle"];
    
    //  [dict1 setValue:_friendstr forKey:@"requestToId"];
    // [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"outer"] forKey:@"groupCircle"];
    
    //[dict1 setValue:@"0" forKey:@"status"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"acceptFriendRequest":dict :dict1];
    
}


- (IBAction)profileiconBtnAction:(id)sender {
    ProfileViewController *evc=[[ProfileViewController alloc]init];
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

- (IBAction)TagBtnAction:(id)sender {
    check=YES;
    
    
    
    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [selectImgAS setTag:6];
    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [selectImgAS showInView:self.view];
    check=YES;
}

- (IBAction)chatbtnAction:(id)sender {
    ChatfriendViewController *gvc=[[ChatfriendViewController alloc]init];
   
    [self.navigationController pushViewController:gvc animated:YES];
}





//-(void)actionSheet1:(UIActionSheet *)myActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//
//    }

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
    check=YES;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    check=YES;
    
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
    check=YES;
    
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
@end

