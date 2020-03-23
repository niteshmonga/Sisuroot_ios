#import "FriendsViewController.h"
#import "FriendsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "SWRevealViewController.h"
#import "MyWebserviceManager.h"
#import "SCLAlertView.h"
#import "FeedViewController.h"
#import "ViewController.h"
#import "Base64.h"
#import "BS1ViewController.h"
#import "UIView+RNActivityView.h"
#import "Reachability.h"
#import "smilepage1ViewController.h"
#import <Photos/Photos.h>
#import "GraphView.h"
#import "GraphView1.h"
#import "chattypeViewController.h"
#import "FriendsaddViewController.h"
#import "Sisuroot-Swift.h"
@interface FriendsViewController ()
{
    NSMutableArray *userarr;
    NSMutableArray *innerdata;
    NSMutableArray *outerdata;
    NSMutableArray *bothdata;
    BOOL flag;
    NSArray *animalIndexTitles;
    NSMutableArray *FilteredDevices;
    BOOL isfiltered;
    NSString *searchtextstr;
    UIRefreshControl *refreshControl;
}
@end

@implementation FriendsViewController

- (IBAction)innerbtnclick:(id)sender {
    _view_inner.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
    
    UIBezierPath *maskPath = [UIBezierPath
          bezierPathWithRoundedRect:self.view_inner.bounds
          byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
          cornerRadii:CGSizeMake(20, 20)
      ];

      CAShapeLayer *maskLayer = [CAShapeLayer layer];

      maskLayer.frame = _view_inner.bounds;
      maskLayer.path = maskPath.CGPath;

      self.view_inner.layer.mask = maskLayer;
    userarr = innerdata;
    [FriendsTableviewobj reloadData];
    _view_outer.backgroundColor=[UIColor clearColor];
}

- (IBAction)outerbtnclick:(id)sender {
    _view_outer.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
   UIBezierPath *maskPath = [UIBezierPath
        bezierPathWithRoundedRect:self.view_outer.bounds
        byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
        cornerRadii:CGSizeMake(20, 20)
    ];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = _view_outer.bounds;
    maskLayer.path = maskPath.CGPath;
    self.view_outer.layer.mask = maskLayer;
    userarr = outerdata;
    [FriendsTableviewobj reloadData];
    _view_inner.backgroundColor=[UIColor clearColor];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
}
-(void)viewDidAppear:(BOOL)animated
{
   self.navigationController.navigationBar.hidden=YES;
    if ([_invitestr isEqualToString:@"invite"])
    {
       _Friendsstmtlbl.text=@"Invite Friends";
        _backBtnobj.hidden=YES;
        _MenuBtnObj.hidden=YES;
        _Sosbtnobj.hidden=YES;
        [self contactList];
    }
}

//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    NSString* filter = @"%K CONTAINS %@";
//    NSPredicate* predicate = [NSPredicate predicateWithFormat:filter, @"SELF",title];
//    NSMutableArray* filteredData = [[NSMutableArray alloc]init];
//    filteredData = [userarr filteredArrayUsingPredicate:predicate];
//    [FriendsTableviewobj reloadData];
//    return [animalIndexTitles indexOfObject:title];
//}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return animalIndexTitles;
//}

-(void) viewWillAppear:(BOOL)animated
{
     [self contactList];
    _view_inner.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
     // animalIndexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
        _view_outer.backgroundColor=[UIColor clearColor];
      UIBezierPath *maskPath = [UIBezierPath
            bezierPathWithRoundedRect:self.view_inner.bounds
            byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
            cornerRadii:CGSizeMake(20, 20)
        ];

        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = _view_inner.bounds;
        maskLayer.path = maskPath.CGPath;

        self.view_inner.layer.mask = maskLayer;
    [super viewWillAppear:animated];
      
}
 - (void)viewDidLoad {
   [FIRAnalytics setScreenName:@"Friends" screenClass:@"Friends"];
    [super viewDidLoad];
     [self callnetconnection];
     _searchBar.searchTextField.layer.borderColor = [UIColor whiteColor].CGColor;
     _searchBar.searchTextField.layer.borderWidth=0.5;
     _searchBar.searchTextField.layer.cornerRadius=10;
     indexCount = 3000;
     chatnotification.layer.cornerRadius=10;
     chatnotification.clipsToBounds=YES;
     GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];

      graphView.backgroundColor = [UIColor clearColor];
      GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
      graphView1.backgroundColor = [UIColor clearColor];
      [self.view_footer1 addSubview:graphView];
      [self.view_footer2 addSubview:graphView1];
      [self callfetchprofile];
      _RequestSentViewobj.hidden=YES;
    
    self.navigationController.navigationBar.hidden=YES;
     _MenuBtnObj.hidden=YES;
      isfiltered=false;
     
    self.searchBar.delegate=self;
    flag=1;
    SWRevealViewController *revealController = [self revealViewController];
     revealController.panGestureRecognizer.enabled = YES;
       revealController.tapGestureRecognizer.enabled=YES;
     [revealController panGestureRecognizer];
     [revealController tapGestureRecognizer];
    [_MenuBtnObj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    if ([_str1 isEqualToString:@"done"])
    {
        _backBtnobj.hidden=YES;
        _MenuBtnObj.hidden=NO;
    }
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    [_searchBar resignFirstResponder];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isfiltered)
    {
        return FilteredDevices.count;
    }
    else
    {
        return  userarr.count;
        
    }
    
}
- (IBAction)btn_qa:(id)sender {
        smilepage1ViewController *FVC=[[smilepage1ViewController alloc]init];
        [self.navigationController pushViewController:FVC animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *iden=@"ListtableView";
    FriendsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:iden];
         NSArray * array =[[NSBundle mainBundle]loadNibNamed:@"FriendsTableViewCell" owner:self options:nil];
        cell=[array objectAtIndex:0];
    cell.CircleBtnobj.hidden=YES;
    if (isfiltered)
    {
        NSString *contactname1=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
        if (![contactname1 isEqual:(id)[NSNull null]])
         {
             cell.Usernamelbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_name"];
             if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
            {
                cell.circlenamelbl.hidden=YES;
                NSString *imgStr1 = [[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
                if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
                {
                    cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                }
                else
                {
                    if([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
                    {
                        NSString *string = [[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
                              if ([string rangeOfString:@"https"].location == NSNotFound) {
                                [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]] placeholderImage:nil];
                              } else {
                                 [cell.Userimg setImageWithURL:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"] placeholderImage:nil];
                              }
                    
                    }
                    else if([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
                    {
                        [cell.Userimg setImageWithURL:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]placeholderImage:nil];
                        cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                    }
                }
    
            }
            else if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 0)
            {
                cell.CircleBtnobj.hidden=NO;

                cell.circlenamelbl.hidden=NO;

                cell.Usernamelbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_name"];

                cell.circlenamelbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
                cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                cell.Circleimg.image = [UIImage imageNamed:@"add-contact.png"];
            }
        }
 
    }
    else
    {
         NSString *contactname1=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
        
        if (![contactname1 isEqual:(id)[NSNull null]])
        {
             cell.Usernamelbl.text=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_name"];
 
              if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
            {
                cell.circlenamelbl.hidden=YES;

                NSString *imgStr1 = [[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
                
                if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
                {
                    cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                    
                }
                else
                {
                    if([[[userarr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
                    {
                       NSString *string = [[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
                        if ([string rangeOfString:@"https"].location == NSNotFound) {
                          [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]] placeholderImage:nil];
                        } else {
                           [cell.Userimg setImageWithURL:[[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"] placeholderImage:nil];
                        }
                    }
                    else if([[[userarr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
                    {
                        [cell.Userimg setImageWithURL:[[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]placeholderImage:nil];
                        cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                   }
                }
            }
            else if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 0)
            {
                cell.circlenamelbl.hidden=NO;
                cell.CircleBtnobj.hidden=NO;
                cell.Usernamelbl.text=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_name"];
                cell.circlenamelbl.text=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
                cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                cell.Circleimg.image = [UIImage imageNamed:@"add-contact.png"];
             }
        }
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSString *contactidstr1;
        if (isfiltered)
        {
             contactidstr1=[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"contact_id"];
        }
        else
        {
             contactidstr1=[[userarr objectAtIndex:indexPath.row]valueForKey:@"contact_id"];

        }
 
            [self.view showActivityViewWithLabel:@"Loading"];
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"deleteContact" forKey:@"name"];
            
            NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
            [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
            
            [paramDict setObject:contactidstr1 forKey:@"contact_id"];
            
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"deleteContact" :dict :paramDict];
     }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar                   // return NO to not become first
{
    tapper =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
     return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar                        // return NO to not resign first
{
    [self.view removeGestureRecognizer:tapper];
    [FriendsTableviewobj reloadData];
    return YES;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0)
    {
        isfiltered=false;
        [FriendsTableviewobj reloadData];
    }
    else
    {
        isfiltered=true;
        [self callsearchmethod];
        searchtextstr=searchText;

    }
}
-(void)callsearchmethod
{
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"searchFriends" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [paramDict setValue:_searchBar.text forKey:@"key"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"searchFriends" :dict :paramDict];
    
}

-(void)contactList
{
    [self.view showActivityViewWithLabel:@"Loading"];
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"contactList" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"contactListnew" :dict :paramDict];
    
 }
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"contactList"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [refreshControl endRefreshing];
            innerdata = [[NSMutableArray alloc]initWithArray:[[responseDictionary valueForKey:@"data"] valueForKey:@"inner_data"]];
            outerdata = [[NSMutableArray alloc]initWithArray:[[responseDictionary valueForKey:@"data"] valueForKey:@"outer_data"]];
            bothdata = [[NSMutableArray alloc]initWithArray:[[responseDictionary valueForKey:@"data"] valueForKey:@"both_data"]];
            userarr = [[NSMutableArray alloc]initWithArray:[[responseDictionary valueForKey:@"data"] valueForKey:@"inner_data"]];
            [FriendsTableviewobj reloadData];
        }
        else
        {
            [self.view hideActivityView];
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"searchFriends"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            FilteredDevices=[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            [FriendsTableviewobj reloadData];
         }
    }

    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
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
    NSLog(@"%@",responseDictionary);
}

- (IBAction)BackBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)SearchBtnAction:(id)sender {
     if (flag==1)
    {
        flag=0;
        _searchBar.hidden=NO;
    }
    else{
        flag=1;
        _searchBar.hidden=YES;
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"click on cancel");
        if (alertView.tag == 3133)
        {
             [refreshControl endRefreshing];
        }
     }
    else if(buttonIndex == 1)
    {
        if (alertView.tag == 3133)
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
       }
    }
}

-(IBAction)btyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)FeedBtnAction:(id)sender {
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr1:@"feed"];
    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)FriendsBtnAction:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)SosBtnAction:(id)sender {
    BS1ViewController *evc=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:evc animated:YES];
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

- (IBAction)addnewcontact:(id)sender {
   FriendsaddViewController *FVC=[[FriendsaddViewController alloc]init];
    [self.navigationController pushViewController:FVC animated:YES];
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
