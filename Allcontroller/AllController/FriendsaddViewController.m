
#import "FriendsaddViewController.h"
#import "FriendsTableViewCell.h"
#import "SettingViewController.h"
#import <Contacts/Contacts.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBookUI/ABPersonViewController.h>
#import <AddressBookUI/ABNewPersonViewController.h>
#import <AddressBookUI/ABUnknownPersonViewController.h>
#import <AddressBookUI/ABAddressFormatting.h>
#import "UIImageView+WebCache.h"
#import "ChatfriendViewController.h"
#import "SWRevealViewController.h"
#import "MyWebserviceManager.h"
#import "EditViewController.h"
#import "SCLAlertView.h"
#import "FeedViewController.h"
#import "GalleryViewController.h"
#import "ViewController.h"
#import "Base64.h"
#import "BS1ViewController.h"
#import "UIView+RNActivityView.h"
#import "CountryListViewController.h"
#import "Reachability.h"
#import "smilepage1ViewController.h"
#import <Photos/Photos.h>
#import "GraphView.h"
#import "GraphView1.h"
#import "chattypeViewController.h"
#import "Sisuroot-Swift.h"

@interface FriendsaddViewController ()
{
    NSMutableArray *userarr;
    NSMutableArray *innerdata;
    NSMutableArray *outerdata;
    NSMutableArray *bothdata;
    NSMutableArray *imgArr;
    NSMutableArray *iconarr;
    NSMutableArray *circlearr;
    BOOL flag;
     NSArray *animalIndexTitles;
    NSMutableArray *FilteredDevices;
    BOOL isfiltered;
    NSMutableArray *arrayTableData;
    NSString *name;
    NSString *str1;
    NSString *str2;
    NSString *str21;
    NSString *strsearch3;
    NSString *contacts;
    NSString *strsearch1;
    NSString *strsearch2;
    NSString *searchtextstr;
    NSString *conatactname1;
    NSString *conatactphone1;
    NSMutableArray *contactarray;
    UIRefreshControl *refreshControl;
    BOOL check;
    BOOL selectaddto_index;
    int selectedindex;
    NSString *sel_circle;
    NSString *innercount;
    NSString *outercount;
    NSString *invitestr;
    NSString *invitestrname;
    NSString *importcodestr;
    NSString *contactidstr;
    NSString *selfcreatenumberstr;

}
@end

@implementation FriendsaddViewController



- (IBAction)addcontact:(id)sender
{
    //_Addcontactview.hidden=NO;
    _FirstnameTF.text=@"";
    _LastnameTF.text=@"";
    _PhoneTF.text=@"";
    [_FirstnameTF resignFirstResponder];
    [_LastnameTF resignFirstResponder];
    [_PhoneTF resignFirstResponder];
}

- (IBAction)addtonewcontactbtnclick:(id)sender
{
   if([sel_circle isEqualToString:@"Inner"])
    {
                if ([innercount integerValue] >=25)
                   {
                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have 7 friends in your inner circle. Please remove a user from your inner circle to add more." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                       [alert show];
                    }
                   else
                   {
                       if([[[NSUserDefaults standardUserDefaults]valueForKey:@"searchgroupid"] isEqual: @"1"])
                       {
                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Already added in inner circle" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                           [alert show];
                       }
                       else
                       {
                         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT!" message:@"Do you want to share your red flags with your inner circle?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                       alert.tag=2009;
                       [alert show];
                       }
                    }
            }
            else  if([sel_circle isEqualToString:@"Outer"])
            {
                   if ([outercount integerValue] >=25)
                   {
                       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have 25 friends in your outer circle. Please remove a user from your outer circle to add more." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                       
                       [alert show];
                   }
                   else
                   {
                   
                       if([[[NSUserDefaults standardUserDefaults]valueForKey:@"searchgroupid"] isEqual: @"2"])
                       {
                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Already added in outer circle" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                           [alert show];
                       }
                       else
                {
                    [self.view showActivityViewWithLabel:@"Loading"];
                   
                   MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                   NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                   [dict setValue:@"friendRequest" forKey:@"name"];
                   
                   NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
        
                   [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                   
                   [dict1 setValue:@"2" forKey:@"circle"];
                   if(isfiltered)
                   {
                       [dict1 setValue:strsearch1 forKey:@"requestToId"];
                    }
                   else
                   {
                       [dict1 setValue:str1 forKey:@"requestToId"];
                   }
                   if([[[NSUserDefaults standardUserDefaults]valueForKey:@"searchgroupid"] isEqual: @"1"] || [[[NSUserDefaults standardUserDefaults]valueForKey:@"searchgroupid"] isEqual: @"2"])
                   {
                        [dict1 setValue:@"1" forKey:@"alreadyfriendstatus"];
                   }
                   else
                   {
                           [dict1 setValue:@"0" forKey:@"alreadyfriendstatus"];
                    }
                           
                  // [dict1 setValue:@"1" forKey:@"friend_request_type"];
                   [webServiceManager setDelegateMethode:self];
                   [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
                   }
                    }
                }
}



- (IBAction)addtobtnclick:(id)sender {
  
    if(selectaddto_index== YES)
    {
         
          NSString *checkstatus;
          NSString *resendinvite1;
        sel_circle=@"Inner";
          if (isfiltered)
          {
             if ([[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"group"] == nil || [[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"group"] == (id)[NSNull null]) {
                  [[NSUserDefaults standardUserDefaults]setValue:@""  forKey:@"searchgroupid"];
              } else
              {
                    [[NSUserDefaults standardUserDefaults]setValue:[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"group"]  forKey:@"searchgroupid"];
              }
              checkstatus=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"status"];
              NSString *contactname1=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"contact_name"];
              conatactphone1=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"contact_phone"];
              resendinvite1=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"invite_status"];

              if ([contactname1 isEqual:(id)[NSNull null]] || [contactname1 isEqualToString:@""])
              {
                  conatactname1=@"";
              }
              else
              {
                  conatactname1=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"contact_name"];
                  
              }
          }
          else
          {
              if ([[userarr objectAtIndex:selectedindex] valueForKey:@"group"] == nil || [[userarr objectAtIndex:selectedindex] valueForKey:@"group"] == (id)[NSNull null]) {
                   [[NSUserDefaults standardUserDefaults]setValue:@""  forKey:@"searchgroupid"];
                // nil branch
              } else {
                    [[NSUserDefaults standardUserDefaults]setValue:[[userarr objectAtIndex:selectedindex] valueForKey:@"group"]  forKey:@"searchgroupid"];
              }
              NSString *contactname1=[[userarr objectAtIndex:selectedindex] valueForKey:@"contact_name"];
              conatactphone1=[[userarr objectAtIndex:selectedindex] valueForKey:@"contact_phone"];
              checkstatus=[[userarr objectAtIndex:selectedindex] valueForKey:@"status"];
              resendinvite1=[[userarr objectAtIndex:selectedindex] valueForKey:@"invite_status"];

              if ([contactname1 isEqual:(id)[NSNull null]] || [contactname1 isEqualToString:@""])
              {
                  conatactname1=@"";
              }
              else
              {
                  conatactname1=[[userarr objectAtIndex:selectedindex] valueForKey:@"contact_name"];
               }
          }
        
          if([checkstatus integerValue] == 1)
            {
               _view_add_new_conaact.hidden=NO;
           check=NO;
          str1= [[userarr objectAtIndex:selectedindex]valueForKey:@"request_id"];
          str2=[[userarr objectAtIndex:selectedindex] valueForKey:@"block_status"];
          str21=[[userarr objectAtIndex:selectedindex] valueForKey:@"status"];
          strsearch1= [[FilteredDevices objectAtIndex:selectedindex]valueForKey:@"request_id"];
          strsearch2=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"block_status"];
          strsearch3=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"status"];
               }
            else if([checkstatus integerValue] == 0 )
            {
            if (isfiltered)
               {
                   invitestr=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"contact_phone"];
                   contactidstr=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"contact_id"];
                   invitestrname=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"contact_name"];
                   selfcreatenumberstr=[[FilteredDevices objectAtIndex:selectedindex] valueForKey:@"selfcreated_status"];

               }
               else
               {
                   contactidstr=[[userarr objectAtIndex:selectedindex] valueForKey:@"contact_id"];

                   invitestr=[[userarr objectAtIndex:selectedindex] valueForKey:@"contact_phone"];
                   invitestrname=[[userarr objectAtIndex:selectedindex] valueForKey:@"contact_name"];
                   selfcreatenumberstr=[[userarr objectAtIndex:selectedindex] valueForKey:@"selfcreated_status"];
               }
               
               if([resendinvite1 integerValue] == 1)
               {
                   
                    UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Invitation has already been sent, Do u want to resend?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
                   [alertcrp addButtonWithTitle:@"YES"];
                   alertcrp.tag=123456;
                   [alertcrp show];
                 
                }
               else if([resendinvite1 integerValue] == 0)
               {
              
                   UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Are you sure you want to send invitation to this user?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
                   [alertcrp addButtonWithTitle:@"YES"];
                   alertcrp.tag=123456;
                   [alertcrp show];
                   
                }
               
            }
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
    
}
-(void)viewDidAppear:(BOOL)animated
{
//    if ([importcodestr isEqualToString:@"changedcode"])
//    {
//        [self fetchContactsandAuthorization];
//
//    }
    self.navigationController.navigationBar.hidden=YES;
}
- (IBAction)btn_inner:(id)sender {
    sel_circle=@"Inner";
    _btn_inner.titleLabel.textColor = [UIColor  whiteColor];
     _btn_outer.titleLabel.textColor = [UIColor  blackColor];
    [self createborder:_viewinner];
    _viewouter.backgroundColor =[UIColor clearColor];
}
- (IBAction)btn_outer:(id)sender {
    _btn_inner.titleLabel.textColor = [UIColor  blackColor];
     _btn_outer.titleLabel.textColor = [UIColor  whiteColor];
     sel_circle=@"Outer";
    _viewouter.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
     UIBezierPath *maskPath = [UIBezierPath
         bezierPathWithRoundedRect:_viewouter.bounds
         byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
         cornerRadii:CGSizeMake(20, 20)
     ];

     CAShapeLayer *maskLayer = [CAShapeLayer layer];

     maskLayer.frame = _viewouter.bounds;
     maskLayer.path = maskPath.CGPath;

     _viewouter.layer.mask = maskLayer;
    _viewinner.backgroundColor =[UIColor clearColor];
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return animalIndexTitles;
//}
- (IBAction)cancel_Add_contact:(id)sender {
    _view_add_new_conaact.hidden=YES;
}

-(void)createborder:(UIView *)view11
{
    view11.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
      UIBezierPath *maskPath = [UIBezierPath
          bezierPathWithRoundedRect:view11.bounds
          byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
          cornerRadii:CGSizeMake(20, 20)
      ];
      CAShapeLayer *maskLayer = [CAShapeLayer layer];
      maskLayer.frame = view11.bounds;
      maskLayer.path = maskPath.CGPath;
      view11.layer.mask = maskLayer;
}
- (void)didSelectCountry:(NSDictionary *)country
{
    NSLog(@"Selected Country : %@", country);
    _codeTF.text=[country valueForKey:@"dial_code"];

}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.FirstnameTF || textField==self.PhoneTF)
    {
        [_DoneBtnobj setUserInteractionEnabled:YES];

     }
    
    if(textField==self.codeTF)
    {
        
        [_codeTF resignFirstResponder];
         CountryListViewController *cv = [[CountryListViewController alloc] initWithNibName:@"CountryListViewController" delegate:self];
        [self presentViewController:cv animated:YES completion:NULL];
       // _Addcontactview.hidden=NO;
        
     }
}

-(void) viewWillAppear:(BOOL)animated
{
    [self contactList];
    [self callfetchprofile];
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
       _btn_cancel_add_contact.layer.borderColor= UIColor.whiteColor.CGColor;
       _btn_cancel_add_contact.layer.borderWidth=1.0;
       _btn_cancel_add_contact.layer.cornerRadius=5;
       _btn_cancel_add_contact.clipsToBounds=YES;
    
          _viwqqq.layer.cornerRadius=20;
          _viwqqq.clipsToBounds=YES;
       
    
    
    _can1.layer.borderColor= UIColor.whiteColor.CGColor;
    _can1.layer.borderWidth=1.0;
    _can1.layer.cornerRadius=5;
    _can1.clipsToBounds=YES;
    
    _Cancelbtnobj.layer.borderColor= UIColor.whiteColor.CGColor;
    _Cancelbtnobj.layer.borderWidth=1.0;
    _Cancelbtnobj.layer.cornerRadius=5;
    _Cancelbtnobj.clipsToBounds=YES;
    
    _view_add_new_conaact.hidden=YES;
    // animalIndexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
       
    [self createborder:_view_addto];
        [self createborder:_viewinner];
       [FIRAnalytics setScreenName:@"Friends" screenClass:@"Friends"];
    [super viewDidLoad];
     [self callnetconnection];
    _searchBar.searchTextField.layer.borderColor = [UIColor whiteColor].CGColor;
       _searchBar.searchTextField.layer.borderWidth=0.5;
    _searchBar.searchTextField.layer.cornerRadius=10;
   indexCount = 3000;
     importcodestr=@"changedcode1";

    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    
    _view_new_contatc.layer.cornerRadius=10;
    _view_new_contatc.clipsToBounds=YES;
    
    
     GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];

         graphView.backgroundColor = [UIColor clearColor];
            
            GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
               graphView1.backgroundColor = [UIColor clearColor];
            
            
               [self.view_footer1 addSubview:graphView];
            [self.view_footer2 addSubview:graphView1];
    
    
    check=NO;
    
    contactarray=[[NSMutableArray alloc]init];
    self.navigationController.navigationBar.hidden=YES;
     _MenuBtnObj.hidden=YES;
      isfiltered=false;
     
    self.searchBar.delegate=self;
    flag=1;
    
    
    iconarr=[[NSMutableArray alloc]initWithObjects:@"root_inner_circle.png",@"root_outer_circle.png",@"root_inner_circle.png",@"root_inner_circle.png",@"root_no_circles.png",@"root_inner_circle.png",@"root_outer_circle.png",@"root_inner_circle.png",@"root_inner_circle.png",@"root_no_circles.png",nil];
    
    SWRevealViewController *revealController = [self revealViewController];
     revealController.panGestureRecognizer.enabled = YES;
       revealController.tapGestureRecognizer.enabled=YES;
     [revealController panGestureRecognizer];
     [revealController tapGestureRecognizer];
    [_MenuBtnObj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    arrayTableData = [[NSMutableArray alloc]init];
    contactarray = [[NSMutableArray alloc]init];
    
//    refreshControl = [[UIRefreshControl alloc] init];
//    [refreshControl addTarget:self action:@selector(refresh1:) forControlEvents:UIControlEventValueChanged];
//    [FriendsTableviewobj addSubview:refreshControl];
}

-(void) tappedtext:(UIGestureRecognizer *) sender
{
    [_FirstnameTF resignFirstResponder];
    [_PhoneTF resignFirstResponder];
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
                
                
                
                if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"group"] isEqual: @"1"])
                    
                {
                    
                    cell.Circleimg.image = [UIImage imageNamed:@"inner_circle_green80.png"];
                    
                }
                
                
                else  if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"group"] isEqual: @"2"])
                {
                    
                    cell.Circleimg.image = [UIImage imageNamed:@"outer_circle_green80.png"];
                    
                    
                }
                if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"block_status"] isEqual: @"0"])
                    
                {
                    cell.Circleimg.image = [UIImage imageNamed:@"both_circles_cross80.png"];
                    
                }
                else if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"block_status"] isEqual: @"1"])
                        
                    {
                        if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"group"] isEqual: @"1"])
                         {
                            
                            cell.Circleimg.image = [UIImage imageNamed:@"inner_circle_green80.png"];
                            
                         }
                        
                         else  if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"group"] isEqual: @"2"])
                        {
                             cell.Circleimg.image = [UIImage imageNamed:@"outer_circle_green80.png"];
                            
                        }
                        else
                        {
                            cell.Circleimg.image = [UIImage imageNamed:@"both_circles_gray80.png"];
                            
                        }
                    }
                    else
                    {
                        cell.Circleimg.image = [UIImage imageNamed:@"both_circles_gray80.png"];
                        
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
    
    cell.RequestBtnobj.tag = indexPath.row;
    
    [cell.RequestBtnobj addTarget:self action:@selector(RequestAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.CircleBtnobj.tag = indexPath.row;
     [cell.CircleBtnobj addTarget:self action:@selector(EditAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
    
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FriendsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    selectedindex=indexPath.row;
    selectaddto_index = YES;
     cell.accessoryType = UITableViewCellAccessoryCheckmark;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
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
            
        
         // tell table to refresh now
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
    
    //[paramDict setValue:_ForgotTF.text forKey:@"email"];username
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"contactList" :dict :paramDict];
    
 }
//- (void)refresh1:(UIRefreshControl *)refreshControl
//{
//     [self fetchContactsandAuthorization];
//}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"contactList"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [refreshControl endRefreshing];
            // _Addcontactview.hidden=YES;
             userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
             [FriendsTableviewobj reloadData];
             userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
             innercount=[responseDictionary valueForKey:@"InnerCount"];
            outercount=[responseDictionary valueForKey:@"OuterCount"];
        }
        else
        {
            [self.view hideActivityView];
//            if ([[responseDictionary valueForKey:@"is_phone_contact_import"] integerValue]==0 )
//            {
//               [self fetchContactsandAuthorization];
//            }
      }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"friendRequest"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [self contactList];
            [self callsearchmethod];
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
            [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"Sisuroot" subTitle:[responseDictionary valueForKey:@"status_message"] closeButtonTitle:@"OK" duration:0.0f];
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"blocknUnblockUser"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
             if ([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Block"]) {
              }
            else
            {
            }
            [self contactList];
            [self callsearchmethod];
             SCLAlertView *alert = [[SCLAlertView alloc] init];
             UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
            [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"Sisuroot" subTitle:[responseDictionary valueForKey:@"status_message"] closeButtonTitle:@"OK" duration:0.0f];
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
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"userPhoneImport"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            // [self callforerror];
            [refreshControl endRefreshing];
            
            //            strerror2=@"import_done";
            //            NSLog(@"%@",strerror2);
            [self contactList];
            
        }
        else
        {
            [self.view hideActivityView];

        }
 
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"contactsave"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
           // _Addcontactview.hidden=YES;
                      
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            // Contacts already exists!
            
            [self contactList];
        }
        else
        {
            [self.view hideActivityView];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
 
          
        }
            
 
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"EditContacts"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
             [self.view hideActivityView];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
             [self contactList];
        }
        else
        {
            [self.view hideActivityView];
           // _Editcontactview.hidden=YES;

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
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
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"RequestSendByMail"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];

             [self contactList];
            [self callsearchmethod];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        else
        {
            [self.view hideActivityView];

 
            
            UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:self cancelButtonTitle:@"No" otherButtonTitles:nil];
            [alertcrp addButtonWithTitle:@"Yes"];
            alertcrp.tag=31111;
            [alertcrp show];
        }
        
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"deleteContact"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [self contactList];
            [self callsearchmethod];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alert show];
        }
 
    }
    
}


-(void) processFailed :(NSError *)responseDictionary
{
    //[self contactList];
    [self.view hideActivityView];
    NSLog(@"%@",responseDictionary);
    
    
    //   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
}

- (IBAction)BackBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
//  _Addcontactview.hidden=YES;

}

- (IBAction)SearchBtnAction:(id)sender {
    // _searchBar.hidden=NO;
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
- (IBAction)SettingBtnAction:(id)sender {
    SettingViewController *SVC=[[SettingViewController alloc]init];
    [self.navigationController pushViewController:SVC animated:YES];
}
- (IBAction)InnerBtnAction:(id)sender {
    
 }
- (IBAction)OuterBtnAction:(id)sender {
    
}
- (IBAction)blockbtnAction:(id)sender {
    
}

-(void)callstorecontact
{
    [self.view showActivityViewWithLabel:@"Loading"];
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"userPhoneImport" forKey:@"name"];
    
    NSString *nameStr;
   for (int i = 0; i<contactarray.count; i++)
    {
        if (i == 0 )
        {
          nameStr=[nameStr stringByAppendingString:@";"];
            nameStr  = [NSString stringWithFormat:@"%@,%@", [[contactarray objectAtIndex:i] valueForKey:@"name"],[[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
            
        }
        else
        {
            nameStr=[nameStr stringByAppendingString:@";"];
            nameStr  = [NSString stringWithFormat:@"%@ %@,%@",nameStr, [[contactarray objectAtIndex:i] valueForKey:@"name"],[[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
        }
    }
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [paramDict setObject:nameStr forKey:@"name"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"import" :dict :paramDict];
    
}

- (IBAction)CancelBtnAction:(id)sender {
   // _Addcontactview.hidden=YES;

}
- (IBAction)DoneButtonAction:(id)sender {
    
    [_FirstnameTF resignFirstResponder];
    [_LastnameTF resignFirstResponder];
    [_PhoneTF resignFirstResponder];
    NSString *foo=_LastnameTF.text;
    NSString *trimmed = [foo stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    _LastnameTF.text=trimmed;
     NSString *msg  = @"0";
    
    if([_FirstnameTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
     {
        msg = @"Please enter name";
     }
    else if (_codeTF.text.length < 1)
    {
        msg = @"Please select country code";
    }
    else if (_PhoneTF.text.length == 0 || [_PhoneTF.text isEqualToString:@" "])
    {
        msg = @"Please enter mobile number";
    }
    else if (_PhoneTF.text.length < 10 || _PhoneTF.text.length > 14)
    {
        msg = @"Please enter valid mobile number";
    }
    
    
     if (![msg isEqualToString:@"0"])
    {
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        NSString *str = _codeTF.text;
        str = [str stringByAppendingString:_PhoneTF.text];
        _PhoneTF.text=str;
     [self.view showActivityViewWithLabel:@"Loading"];
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"contactsave" forKey:@"name"];
 
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [paramDict setObject:_FirstnameTF.text forKey:@"name"];
    [paramDict setObject:@"" forKey:@"email"];
    [paramDict setObject:_PhoneTF.text forKey:@"contact"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"contactsave" :dict :paramDict];
        
    }
}
- (void)getContactsWithAddressBook:(ABAddressBookRef )addressBook {
    
    
    arrayTableData = [[NSMutableArray alloc] init];
 
    CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
    // NSLog(@"%@",people);
    CFIndex nPeople = ABAddressBookGetPersonCount(addressBook);
    
 
    for(int i=0; i<nPeople; i++)
    {
        {
            NSMutableDictionary *contacName = [[NSMutableDictionary alloc] init];
            NSString* phone = @"0";
            ABRecordRef person=CFArrayGetValueAtIndex(people, i);
            
            
            NSString *nameString3;
            if (ABRecordCopyValue(person, kABPersonSortByFirstName))
            {
                nameString3  = [NSString stringWithFormat:@"%@",ABRecordCopyValue(person, kABPersonSortByFirstName)];
            }
            
            NSString *nameString2;
            if (ABRecordCopyValue(person, kABPersonSortByLastName))
            {
                nameString2  = [NSString stringWithFormat:@"%@ ",ABRecordCopyValue(person, kABPersonSortByLastName)];
            }
            
 
            NSString *nameString1 = @"0";
            
             if (nameString3  != NULL   && nameString2  != NULL)
            {
                nameString1=[NSString stringWithFormat:@"%@ %@",nameString3,nameString2];
                
            }
            else if (nameString3  != NULL)
            {
                nameString1= nameString3;
            }
            else if (nameString2  != NULL)
            {
                nameString1= nameString2;
            }
            
            nameString1 = [nameString1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            [contacName setObject:nameString1 forKey:@"name"];
            //[contacName setValue:[NSString stringWithFormat:@"%@",ABRecordCopyValue(person, kABPersonSortByFirstName)] forKey:@"name"];
            
            UIImage *img ;
            if (person != nil && ABPersonHasImageData(person))
            {
                if ( &ABPersonCopyImageDataWithFormat != nil ) {
                    
                    img= [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(person, kABPersonImageFormatThumbnail)];
                }
            }
            else
            {
               // img =  [UIImage imageNamed:@"profile1_icon120.png"];
            }
            
//            [contacName setObject:img  forKey:@"image"];
//            [contacName setValue:@"0" forKey:@"fav"];
//            [contacName setValue:@"mobile" forKey:@"type"];
//            [contacName setValue:@"0" forKey:@"activeuser"];
            
            ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
            
            NSArray *arrayL =  (__bridge NSArray *)(ABMultiValueCopyArrayOfAllValues(multi)) ;
            
            for (int l = 0; l < arrayL.count; l++)
            {
                NSString *str   = [NSString stringWithFormat:@"%@",ABMultiValueCopyValueAtIndex(multi, l)];
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"+abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"] invertedSet];
                phone = [[str componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
//                phone = [phone stringByReplacingOccurrencesOfString:@"+91"
//                                                         withString:@""];
//                phone = [phone stringByReplacingOccurrencesOfString:@"+1"
//                                                         withString:@""];
//                int length = phone.length;
//
//                if (phone.length >10)
//                {
//                    phone = [phone substringFromIndex: length-10];
//
//                }
                [contacName setObject:phone forKey:@"mobile"];
                
                [contacName setValue:[NSString stringWithFormat:@"%d",indexCount] forKey:@"id"];
                
                NSMutableDictionary *contacName1 = [[NSMutableDictionary alloc] init];
                contacName1 = contacName;
                if ( ![nameString1 isEqualToString:@"0"] && ![phone isEqualToString:@"0"])
                {
                    if (nameString1.length > 0)
                    {
                        [contactarray addObject:[contacName1 mutableCopy]];
                        indexCount = indexCount +1;
                    }
                }
            }
        }
    }
     [self callstorecontact];
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
        if (alertView.tag == 2009)
        {
            [self.view showActivityViewWithLabel:@"Loading"];
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"friendRequest" forKey:@"name"];
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
             if(isfiltered)
            {
                [dict1 setValue:strsearch1 forKey:@"requestToId"];
            }
            else
            {
                [dict1 setValue:str1 forKey:@"requestToId"];
            }
            if([[[NSUserDefaults standardUserDefaults]valueForKey:@"searchgroupid"] isEqual: @"1"] || [[[NSUserDefaults standardUserDefaults]valueForKey:@"searchgroupid"] isEqual: @"2"])
            {
                 [dict1 setValue:@"1" forKey:@"alreadyfriendstatus"];
            }
            else
            {
                    [dict1 setValue:@"0" forKey:@"alreadyfriendstatus"];
             }
            [dict1 setValue:@"1" forKey:@"circle"];
            [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
            // [dict1 setValue:@"1" forKey:@"friend_request_type"];
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
        }
    }
    else if(buttonIndex == 1)
    {
        if (alertView.tag == 2009)
        {
            SettingViewController *svc=[[SettingViewController alloc]init];
            [self.navigationController pushViewController:svc animated:YES];
            [svc setStr1:@"done"];

            [self.view showActivityViewWithLabel:@"Loading"];
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"friendRequest" forKey:@"name"];
            
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
            
            if(isfiltered)
            {
                [dict1 setValue:strsearch1 forKey:@"requestToId"];
            }
            else
            {
                [dict1 setValue:str1 forKey:@"requestToId"];
            }
            if([[[NSUserDefaults standardUserDefaults]valueForKey:@"searchgroupid"] isEqual: @"1"] || [[[NSUserDefaults standardUserDefaults]valueForKey:@"searchgroupid"] isEqual: @"2"])
            {
                 [dict1 setValue:@"1" forKey:@"alreadyfriendstatus"];
            }
            else
            {
                    [dict1 setValue:@"0" forKey:@"alreadyfriendstatus"];
             }
            [dict1 setValue:@"1" forKey:@"circle"];
            [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
           [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
            
        }
        if (alertView.tag == 30001)
        {
            BOOL stricterFilter = NO;
            NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
            NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
            NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
           NSString *msg  = @"0";
            
           
            if (privateTextView.text.length < 1)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please enter your friend apple id" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            else if([emailTest evaluateWithObject:privateTextView.text] == NO)
            {
                msg = @"Please enter valid email address";
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please enter valid apple id" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            
            else
            {
               // [self callinvitefriendviaemail];
            }
        }
        else if (alertView.tag == 3133)
        {
            // [self fetchContactsandAuthorization];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            
        }
//        else if (alertView.tag == 3134)
//        {
//            [self fetchContactsandAuthorization];
//
//        }
        else if (alertView.tag == 123456)
        {
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"RequestSendByMail" forKey:@"name"];
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
            
            [dict1 setValue:invitestr forKey:@"number"];
            [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"invitesisuroot" :dict :dict1];
        }
        else if (alertView.tag == 31111)
        {
            if ([selfcreatenumberstr integerValue]==1 || [selfcreatenumberstr isEqual:[NSNull null]])
            {
                   
            }
            else
            {
                ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
                // ABAddressBookRef addressBook = ABAddressBookCreate();
                
                __block BOOL accessGranted = NO;
                
                if (&ABAddressBookRequestAccessWithCompletion != NULL)
                {
                    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
                    
                    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
                        accessGranted = granted;
                        dispatch_semaphore_signal(semaphore);
                    });
                    
                    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
                    NSArray *people = (NSArray *)CFBridgingRelease(ABAddressBookCopyPeopleWithName(addressBook, CFBridgingRetain(invitestrname)));
                    // Display "Appleseed" information if found in the address book
                    if ((people != nil) && [people count])
                    {
                        ABRecordRef person = (__bridge ABRecordRef)[people objectAtIndex:0];
                        ABPersonViewController *picker = [[ABPersonViewController alloc] init];
                        picker.personViewDelegate = self; 
                        picker.displayedPerson = person;
                    // Allow users to edit the person’s information
                        picker.allowsEditing = YES;
                        [self.navigationController pushViewController:picker animated:YES];
                        self.navigationController.navigationBar.hidden=NO;
                        
                    }
                    importcodestr=@"changedcode";
                }
            }
        }
    }
}
- (BOOL)personViewController:(ABPersonViewController *)personViewController shouldPerformDefaultActionForPerson:(ABRecordRef)person
                    property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifierForValue
{
    return NO;
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

-(void)callinvitefriendviaemail
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"RequestSendByMail" forKey:@"name"];

    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:privateTextView.text forKey:@"email"];
    [dict1 setValue:conatactname1 forKey:@"name"];
    [dict1 setValue:conatactphone1 forKey:@"number"];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"RequestSendByMail" :dict :dict1];
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

