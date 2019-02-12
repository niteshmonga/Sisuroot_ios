
#import "FriendsViewController.h"
#import "FriendsTableViewCell.h"
#import "SettingViewController.h"
#import <Contacts/Contacts.h>
//#import <Contacts/CNContact.h>
//#import <ContactsUI/CNContactViewController.h>
//#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>
#import "UIImageView+WebCache.h"
#import "ChatfriendViewController.h"
#import "SWRevealViewController.h"
#import "MyWebserviceManager.h"
#import "EditViewController.h"
#import "OtherFriendViewController.h"
#import "SCLAlertView.h"
#import "ProfileViewController.h"
#import "FeedViewController.h"
#import "GalleryViewController.h"
#import "ViewController.h"
#import "Base64.h"
#import "ProfileViewController.h"
#import "Bs3ViewController.h"
#import "BS1ViewController.h"
#import "UIView+RNActivityView.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface FriendsViewController ()
{
    NSMutableArray *userarr;
    NSMutableArray *imgArr;
    NSMutableArray *iconarr;
    NSMutableArray *circlearr;
    BOOL flag;
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
    //NSMutableArray *contactarray1;
    UIRefreshControl *refreshControl;
    BOOL check;
    NSString *innercount;
    NSString *outercount;
    NSString *invitestr;

}
@end

@implementation FriendsViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    
    //[_DoneBtnobj setUserInteractionEnabled:NO];
    _Addcontactview.hidden=YES;
    _footerviewobj.hidden=YES;
    if ([_invitestr isEqualToString:@"invite"])
    {
        _footerviewobj.hidden=NO;
        _Friendsstmtlbl.text=@"Invite Friends";
        _backBtnobj.hidden=YES;
        _MenuBtnObj.hidden=YES;
        _Sosbtnobj.hidden=YES;
        _profileBtnobj1.hidden=YES;
        _profileiconimg.hidden=YES;
 [self contactList];
    }
}
 - (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if ([_invitestr isEqualToString:@"invite"])
    {
        _footerviewobj.hidden=NO;
        _Friendsstmtlbl.text=@"Invite Friends";
        _backBtnobj.hidden=YES;
        _MenuBtnObj.hidden=YES;
        _Sosbtnobj.hidden=YES;
        _profileBtnobj1.hidden=YES;
        _profileiconimg.hidden=YES;
        
    }
 
    _footerviewobj.hidden=YES;

    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
  //  [_DoneBtnobj setUserInteractionEnabled:NO];
    _Addcontactview.hidden=YES;
    
     
    
     //[self contactList];
    //    @try {
    // [self fetchContactsandAuthorization];
    check=NO;
    [self contactList];
    _profileiconimg.layer.cornerRadius=20;
    _profileiconimg.clipsToBounds=YES;
    
    _profileiconimg.layer.borderWidth =2;
    _profileiconimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _profileBtnobj1.layer.cornerRadius=20;
    _profileBtnobj1.clipsToBounds=YES;
    
    _profileBtnobj1.layer.borderWidth =2;
    _profileBtnobj1.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    
    
    _Addcontactview.layer.cornerRadius=8;
    _Addcontactview.clipsToBounds=YES;
    
    _Addcontactview.layer.borderWidth =1;
    _Addcontactview.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    
    _Addnewcontactobj.layer.cornerRadius=4;
    _Addnewcontactobj.clipsToBounds=YES;
  
    
    [self callfetchprofile];
    
    contactarray=[[NSMutableArray alloc]init];
     _RequestSentViewobj.hidden=YES;
    
    self.navigationController.navigationBar.hidden=YES;
     _MenuBtnObj.hidden=YES;
      isfiltered=false;
     
    self.searchBar.delegate=self;
    flag=1;
    
    
    iconarr=[[NSMutableArray alloc]initWithObjects:@"root_inner_circle.png",@"root_outer_circle.png",@"root_inner_circle.png",@"root_inner_circle.png",@"root_no_circles.png",@"root_inner_circle.png",@"root_outer_circle.png",@"root_inner_circle.png",@"root_inner_circle.png",@"root_no_circles.png",nil];
    
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped12:)];
    [self.view addGestureRecognizer:tapper];
     SWRevealViewController *revealController = [self revealViewController];
     [revealController panGestureRecognizer];
     [revealController tapGestureRecognizer];
    [_MenuBtnObj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([_str1 isEqualToString:@"done"])
    {
        _backBtnobj.hidden=YES;
        _MenuBtnObj.hidden=NO;
        
    }
    
    arrayTableData = [[NSMutableArray alloc]init];
    contactarray = [[NSMutableArray alloc]init];
    
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh1:) forControlEvents:UIControlEventValueChanged];
    [FriendsTableviewobj addSubview:refreshControl];
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    [_searchBar resignFirstResponder];
    // _searchBar.hidden=YES;
}

-(void) tapped12:(UIGestureRecognizer *) sender
{
    [_FirstnameTF resignFirstResponder];
    [_LastnameTF resignFirstResponder];
    [_PhoneTF resignFirstResponder];

     // _searchBar.hidden=YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.FirstnameTF || textField==self.LastnameTF || textField==self.PhoneTF)
    {
        [_DoneBtnobj setUserInteractionEnabled:YES];

     }
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *iden=@"ListtableView";
    FriendsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:iden];
//    if (cell==nil)
//    {
        NSArray * array =[[NSBundle mainBundle]loadNibNamed:@"FriendsTableViewCell" owner:self options:nil];
        cell=[array objectAtIndex:0];
        
   // }
    //[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    if (isfiltered)
    {
        
         NSString *contactname1=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
        
        if (![contactname1 isEqual:(id)[NSNull null]])
         {
             
              cell.Usernamelbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_name"];

            // cell.circlenamelbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];

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
                        
                        [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]] placeholderImage:nil];
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
                        
                        // [cell.RequestBtnobj setImage:[UIImage imageNamed:@"circle_full_inner.png"] forState:UIControlStateNormal];
                        // cell.RequestBtnobj.backgroundColor = [UIColor colorWithRed:44/255.0 green:118/255.0 blue:8/255.0 alpha:0.5];
                        
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
                cell.circlenamelbl.hidden=NO;

                cell.Usernamelbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_name"];

                cell.circlenamelbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
                cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                cell.Circleimg.image = [UIImage imageNamed:@"add-contact.png"];
                
            }
        }
        //        NSString *contactname=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_name"];
        
        
    }
    else
    {
        //        NSString *contactname=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_name"];
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
                        
                        [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]] placeholderImage:nil];
                    }
                    else if([[[userarr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
                    {
                        [cell.Userimg setImageWithURL:[[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]placeholderImage:nil];
                        cell.Userimg.contentMode=UIViewContentModeScaleToFill;
                        
                    }
                }
                
                if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"group"] isEqual: @"1"])
                 {
                    
                    cell.Circleimg.image = [UIImage imageNamed:@"inner_circle_green80.png"];
                    
                }
                
                
                else  if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"group"] isEqual: @"2"])
                {
                    
                    cell.Circleimg.image = [UIImage imageNamed:@"outer_circle_green80.png"];
 
                }
                if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"block_status"] isEqual: @"0"])
                    
                {
                    cell.Circleimg.image = [UIImage imageNamed:@"both_circles_cross80.png"];
                    
                }
                else if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"block_status"] isEqual: @"1"] || [[[userarr objectAtIndex:indexPath.row] valueForKey:@"block_status"] isEqual:[NSNull null]])
                    
                {
                    if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"group"] isEqual: @"1"])
                        
                    {
                        
                        cell.Circleimg.image = [UIImage imageNamed:@"inner_circle_green80.png"];
                        
                    }
                    // [cell.RequestBtnobj setImage:[UIImage imageNamed:@"circle_full_inner.png"] forState:UIControlStateNormal];
                    // cell.RequestBtnobj.backgroundColor = [UIColor colorWithRed:44/255.0 green:118/255.0 blue:8/255.0 alpha:0.5];
                    
                    else  if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"group"] isEqual: @"2"])
                    {
                        //[cell.RequestBtnobj setImage:[UIImage imageNamed:@" "] forState:UIControlStateNormal];
                        // cell.RequestBtnobj.backgroundColor = [UIColor whiteColor];
                        //  [cell.RequestBtnobj setImage:[UIImage imageNamed:@"both_circle.png"] forState:UIControlStateNormal];
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
            else if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 0)
            {
                cell.circlenamelbl.hidden=NO;

                cell.Usernamelbl.text=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_name"];
                cell.circlenamelbl.text=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];

                cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                cell.Circleimg.image = [UIImage imageNamed:@"add-contact.png"];
                
            }
        }
        
    }
    
    cell.RequestBtnobj.tag = indexPath.row;
    
    [cell.RequestBtnobj addTarget:self action:@selector(RequestAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 89;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1 || [[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
//     {
//        OtherFriendViewController *HVC=[[OtherFriendViewController alloc]init];
//        if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
//        {
//            [HVC setDetail:[[userarr objectAtIndex:indexPath.row]valueForKey:@"request_id"]];
//        }
//        else if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"stastatustus"] integerValue] == 1)
//        {
//            [HVC setDetail:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"request_id"]];
//
//        }
//        [HVC setStr1:_strcount];
//        [self.navigationController pushViewController:HVC animated:YES];
//    }
//    else
//    {
//        NSLog(@"Not a App User");
//    }
    
}
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        //remove the deleted object from your data source.
//        //If your data source is an NSMutableArray, do this
//        if (isfiltered)
//        {
//            [userarr removeObjectAtIndex:indexPath.row];
//
//        }
//        else
//        {
//            [FilteredDevices removeObjectAtIndex:indexPath.row];
//
//        }
//        [FriendsTableviewobj reloadData];
//        // tell table to refresh now
//    }
//}

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


-(void)RequestAction  : (UIButton *) btn
{
    
    NSString *checkstatus;
    NSString *resendinvite1;

    if (isfiltered)
    {
        checkstatus=[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"status"];
        NSString *contactname1=[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"contact_name"];
        conatactphone1=[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"contact_phone"];
        resendinvite1=[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"invite_status"];

        if ([contactname1 isEqual:(id)[NSNull null]] || [contactname1 isEqualToString:@""])
        {
            conatactname1=@"";
        }
        else
        {
            conatactname1=[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"contact_name"];
            
        }
    }
    else
    {
        NSString *contactname1=[[userarr objectAtIndex:btn.tag] valueForKey:@"contact_name"];
        conatactphone1=[[userarr objectAtIndex:btn.tag] valueForKey:@"contact_phone"];
        checkstatus=[[userarr objectAtIndex:btn.tag] valueForKey:@"status"];
       // resendinvite=[[userarr objectAtIndex:btn.tag] valueForKey:@"invite_status"];
        resendinvite1=[[userarr objectAtIndex:btn.tag] valueForKey:@"invite_status"];

        if ([contactname1 isEqual:(id)[NSNull null]] || [contactname1 isEqualToString:@""])
        {
            conatactname1=@"";
        }
        else
        {
            conatactname1=[[userarr objectAtIndex:btn.tag] valueForKey:@"contact_name"];
            
         }
        
    }
    
     check=NO;
   
    str1= [[userarr objectAtIndex:btn.tag]valueForKey:@"request_id"];
    str2=[[userarr objectAtIndex:btn.tag] valueForKey:@"block_status"];
    str21=[[userarr objectAtIndex:btn.tag] valueForKey:@"status"];
    strsearch1= [[FilteredDevices objectAtIndex:btn.tag]valueForKey:@"request_id"];
    strsearch2=[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"block_status"];
    strsearch3=[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"status"];
    
    if([checkstatus integerValue] == 1)
    {
        
         if (flag==1)
        {
            flag=0;
            
            //  UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer",@"Blocked", nil];
            
            //            [actionSheet setTag:6];
            //            actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
            //            [actionSheet showInView:self.view];
            if (isfiltered)
            {
                if ([[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"block_status"] integerValue]==1)
                {
                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer",@"Block", nil];
                    [actionSheet setTag:6];
                    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
                    [actionSheet showInView:self.view];
                    
                    // [_blockBtnobj setTitle:@"Blocked" forState:UIControlStateNormal];
                    
                }
                
                else if ([[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"block_status"] integerValue]==0)
                {
                    //_blockBtnobj = [UIImage imageNamed:@"both_circles_cross80.png"];
                    // [_blockBtnobj setTitle:@"Unblocked" forState:UIControlStateNormal];
                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer",@"Unblock", nil];
                    [actionSheet setTag:6];
                    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
                    [actionSheet showInView:self.view];
                    
                }
            }
            else
            {
                if ([[[userarr objectAtIndex:btn.tag] valueForKey:@"block_status"] integerValue]==1 )
                {
                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer",@"Block", nil];
                    [actionSheet setTag:6];
                    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
                    [actionSheet showInView:self.view];
                    
                    // [_blockBtnobj setTitle:@"Blocked" forState:UIControlStateNormal];
                    
                }
                
                else if ([[[userarr objectAtIndex:btn.tag] valueForKey:@"block_status"] integerValue]==0)
                {
                    //_blockBtnobj = [UIImage imageNamed:@"both_circles_cross80.png"];
                    // [_blockBtnobj setTitle:@"Unblocked" forState:UIControlStateNormal];
                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer",@"Unblock", nil];
                    [actionSheet setTag:6];
                    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
                    [actionSheet showInView:self.view];
                    
                }
            }
         }
        else{
            flag=1;
            _RequestSentViewobj.hidden=YES;
            
//                                    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer",@"Blocked", nil];
//
//                                    [actionSheet setTag:6];
//                                    actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
//                                    [actionSheet showInView:self.view];
            
        }
        
    }
    else if([checkstatus integerValue] == 0 )
     {
        
       // NSString *contactname1;
 
         if (isfiltered)
        {
            invitestr=[[FilteredDevices objectAtIndex:btn.tag] valueForKey:@"contact_phone"];

        }
        else
        {
            invitestr=[[userarr objectAtIndex:btn.tag] valueForKey:@"contact_phone"];
           // resendinvite1=[[userarr objectAtIndex:btn.tag] valueForKey:@"invite_status"];
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


-(void)contactList
{
    //    strerror3=@"callcontactlistcatch";
    //    NSLog(@"%@",strerror3);
    
    //[self callforerror];
    
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
- (void)refresh1:(UIRefreshControl *)refreshControl
{
     [self fetchContactsandAuthorization];
    
 }

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"contactList"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [refreshControl endRefreshing];
            
            _Addcontactview.hidden=YES;
           // userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
           
             userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
             [FriendsTableviewobj reloadData];
           userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
             // fetchContactsandAuthorization
            // FilteredDevices=[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            innercount=[responseDictionary valueForKey:@"InnerCount"];
            outercount=[responseDictionary valueForKey:@"OuterCount"];
 
        }
        else
        {
            [self.view hideActivityView];
            if ([[responseDictionary valueForKey:@"is_phone_contact_import"] integerValue]==0 )
            {
//                UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"message!" message:@"Please enable contact privacy setting" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
//                [alertcrp addButtonWithTitle:@"Ok "];
//                alertcrp.tag=3133;
 //                [alertcrp show];
                
                 [self fetchContactsandAuthorization];
            }
            
        }
        
        
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"friendRequest"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            _RequestSentViewobj.hidden=YES;
            
            [self contactList];
            [self callsearchmethod];
            
            // [FriendsTableviewobj reloadData];
            //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            
            
            SCLAlertView *alert = [[SCLAlertView alloc] init];
            
            UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
            [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"Root" subTitle:[responseDictionary valueForKey:@"status_message"] closeButtonTitle:@"OK" duration:0.0f];
            
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"blocknUnblockUser"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            _RequestSentViewobj.hidden=YES;
 
             // imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            if ([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Block"]) {
                
                [_blockBtnobj setTitle:@"Unblocked" forState:UIControlStateNormal];
                
            }
            else
            {
                [_blockBtnobj setTitle:@"Blocked" forState:UIControlStateNormal];
                
            }
            
            //[FriendsTableviewobj reloadData];
            
            [self contactList];
            [self callsearchmethod];
            
            // [FriendsTableviewobj reloadData];
             //            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            //
            
             SCLAlertView *alert = [[SCLAlertView alloc] init];
             UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
            [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"Root" subTitle:[responseDictionary valueForKey:@"status_message"] closeButtonTitle:@"OK" duration:0.0f];
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"searchFriends"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
             FilteredDevices=[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            [FriendsTableviewobj reloadData];
            
             //     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            
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
            
            //            ProfileViewController *uvc=[[ProfileViewController alloc]init];
            //            [uvc setFriendstr1:@"contact"];
            //            [self.navigationController pushViewController:uvc animated:YES];
            
        }
        else
        {
            //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //        [alert show];
            
            [self.view hideActivityView];

        }
 
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"contactsave"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            _Addcontactview.hidden=YES;
            [self.view hideActivityView];

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            // Contacts already exists!
            
            [self contactList];
        }
        else
        {
            [self.view hideActivityView];
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
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
}

- (IBAction)BackBtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    _Addcontactview.hidden=YES;

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
    NSString *mobileStr;
    
    for (int i = 0; i<contactarray.count; i++)
    {
        if (i == 0 )
        {
 //            nameStr = [[contactarray objectAtIndex:i] valueForKey:@"name"];
//            mobileStr = [[contactarray objectAtIndex:i] valueForKey:@"mobile"];
 
            nameStr=[nameStr stringByAppendingString:@";"];
            nameStr  = [NSString stringWithFormat:@"%@,%@", [[contactarray objectAtIndex:i] valueForKey:@"name"],[[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
            
        }
        else
        {
//            nameStr  = [NSString stringWithFormat:@"%@,%@",nameStr, [[contactarray objectAtIndex:i] valueForKey:@"name"]];
//            mobileStr  = [NSString stringWithFormat:@"%@,%@",mobileStr, [[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
            
            nameStr=[nameStr stringByAppendingString:@";"];

              nameStr  = [NSString stringWithFormat:@"%@ %@,%@",nameStr, [[contactarray objectAtIndex:i] valueForKey:@"name"],[[contactarray objectAtIndex:i] valueForKey:@"mobile"]];
        }
    }
     //}
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [paramDict setObject:nameStr forKey:@"name"];
    //[paramDict setObject:mobileStr forKey:@"contact"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"import" :dict :paramDict];
    
}

-(void)fetchContactsandAuthorization
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
    }
    else
    {
        accessGranted = YES;
        [self getContactsWithAddressBook:addressBook];
    }
    
    if (accessGranted)
    {
        [self getContactsWithAddressBook:addressBook];
    }
    else if (accessGranted==NO)
    {
        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"message!" message:@"Please enable contact privacy setting" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertcrp addButtonWithTitle:@"Ok"];
        alertcrp.tag=3133;
         [alertcrp show];
        
 
//        UIAlertView *testAlert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
//                                                            message:@"Enter your friends apple id for invite in SISUROOT"
//                                                           delegate:self
//                                                  cancelButtonTitle:@"Cancel"
//                                                  otherButtonTitles:@"Done", nil];
//
//
//        privateTextView = [UITextView new];
//
//         testAlert.tag=30001;
//        [testAlert show];
 
        
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
            
            NSString *contact1;
            NSMutableDictionary *contacName = [[NSMutableDictionary alloc] init];
            
            ABRecordRef person=CFArrayGetValueAtIndex(people, i);
            
            ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
            for (CFIndex j=0; j < ABMultiValueGetCount(multi); j++)
            {
                  NSString* phone = [NSString stringWithFormat:@"%@",ABMultiValueCopyValueAtIndex(multi, j)];
                contact1=phone;
               // [contacName setObject:phone forKey:@"mobile"];
                
                NSString *foo=phone;
                NSString *trimmed = [foo stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                phone=trimmed;

                
                NSString *cleanedString = [[phone componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789+"] invertedSet]] componentsJoinedByString:@""];
                phone=cleanedString;
                
//                 if ([phone length] ==10)
//                {
//                    NSString *i=phone;
//
//
//                    NSString *j =[NSString stringWithFormat:@"%d%@",+1,i];
//                    i=j;
//                    NSString *url1 = @"http://apilayer.net/api/validate?access_key=62b08fa0b60837b56c0e239cac487ab0&number=";
//                    NSString *mainUrl=[url1 stringByAppendingString:i];
//
//                    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//                    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//                     NSURL *url = [NSURL URLWithString:mainUrl];
//                    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//                    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//                    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//                     {
//                         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//                         NSLog(@"%@",dictionary);
//                         if ([[dictionary valueForKey:@"valid"] integerValue]==1 && ![[dictionary valueForKey:@"location"] isEqualToString:@""])
//                         {
//                             NSString *phone1=@"+1";
//                             NSString *phone2=phone;
//                             phone2=[phone1 stringByAppendingString:phone2];
//                              [contacName setObject:phone2 forKey:@"mobile"];
//                         }
//
//                     }];
//                }
//                if ([phone length] ==10)
//                {
//                    NSString *i=phone;
//
//                    NSString *j =[NSString stringWithFormat:@"%d%@",+91,i];
//                    i=j;
//                    NSString *url1 = @"http://apilayer.net/api/validate?access_key=62b08fa0b60837b56c0e239cac487ab0&number=";
//                    NSString *mainUrl=[url1 stringByAppendingString:i];
//
//                    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//                    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//
//                    NSURL *url = [NSURL URLWithString:mainUrl];
//                    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//                    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//                    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//                     {
//                         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//                         NSLog(@"%@",dictionary);
//                         if ([[dictionary valueForKey:@"valid"] integerValue]==1 && ![[dictionary valueForKey:@"location"] isEqualToString:@""])
//                         {
//                             NSString *phone1=@"+91";
//                             NSString *phone2=phone;
//                             phone2=[phone1 stringByAppendingString:phone2];
//
//                             [contacName setObject:phone2 forKey:@"mobile"];
//                         }
//
//                     }];
//                }
//                else
//                {
//
//                    [contacName setObject:phone forKey:@"mobile"];
//
//                }
//                if ([phone length] ==9)
//                {
//
//                    NSString *i=phone;
//
//
//                    NSString *j =[NSString stringWithFormat:@"%d%@",+61,i];
//                    i=j;
//                    NSString *url1 = @"http://apilayer.net/api/validate?access_key=62b08fa0b60837b56c0e239cac487ab0&number=";
//                    NSString *mainUrl=[url1 stringByAppendingString:i];
//
//                    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//                    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//                    NSURL *url = [NSURL URLWithString:mainUrl];
//                    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//                    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//                    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//                     {
//                         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//                         NSLog(@"%@",dictionary);
//                         if ([[dictionary valueForKey:@"valid"] integerValue]==1 && ![[dictionary valueForKey:@"location"] isEqualToString:@""])
//                         {
//                             NSString *phone1=@"+61";
//                             NSString *phone2=phone;
//                             phone2=[phone1 stringByAppendingString:phone2];
//                             [contacName setObject:phone2 forKey:@"mobile"];
//                         }
//                         else
//                         {
//                              [contacName setObject:phone forKey:@"mobile"];
//
//                         }
//                     }];
//
//
//                }
//                else if ([phone length] ==8)
//                {
//
//                    NSString *i=phone;
//                    NSString *k=@"+64";
//
//                    NSString *j =[NSString stringWithFormat:@"%d%@",+64,i];
//                    i=j;
//                    NSString *url1 = @"http://apilayer.net/api/validate?access_key=62b08fa0b60837b56c0e239cac487ab0&number=";
//                    NSString *mainUrl=[url1 stringByAppendingString:i];
//
//                    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//                    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//                    NSURL *url = [NSURL URLWithString:mainUrl];
//                    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//                    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//
//                    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//                     {
//                         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//                         NSLog(@"%@",dictionary);
//                         if ([[dictionary valueForKey:@"valid"] integerValue]==1 && ![[dictionary valueForKey:@"location"] isEqualToString:@""])
//                         {
//                             NSString *phone1=@"+64";
//                             NSString *phone2=phone;
//                             phone2=[phone1 stringByAppendingString:phone2];
//
//                             [contacName setObject:phone2 forKey:@"mobile"];
//                         }
//                         else
//                         {
//
//                             [contacName setObject:phone forKey:@"mobile"];
//
//                         }
//                     }];
//
//                 }
//                else
//                {
                     [contacName setObject:phone forKey:@"mobile"];
 //               }
                
              }
             
             NSString *nameString1 = [NSString stringWithFormat:@"%@ ",ABRecordCopyValue(person, kABPersonSortByFirstName)];
            NSString *nameString2 = [NSString stringWithFormat:@" %@",ABRecordCopyValue(person, kABPersonSortByLastName)];
             NSString *nameString3=[nameString1 stringByAppendingString: nameString2];
 
            // nameString3=[nameString3 stringByAppendingString:nameString2];
            
            [contacName setObject:nameString3 forKey:@"name"];
            if (![nameString isEqualToString:@"(null)"])
            {
                [arrayTableData addObject:contacName];
                 NSSortDescriptor *sortDescriptor;
                sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                             ascending:YES];
                contactarray = [arrayTableData sortedArrayUsingDescriptors:@[sortDescriptor]];
                
                name=[contactarray valueForKey:@"name"];
          // name = [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
          //[[name stringByReplacingOccurrencesOfString:@"(" withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
                
                 contacts=[contactarray valueForKey:@"mobile"];
               // contacts = [contacts stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                //[[contacts stringByReplacingOccurrencesOfString:@"(" withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""];
                
            }
            else if([nameString isEqualToString:@"(null)"] || [nameString isEqualToString:@""])
            {
                name=@"";
                contacts=@"";
            }
            
             //            name=[contactarray valueForKey:@"name"];
            //
            //            contacts=[contactarray valueForKey:@"mobile"];
            
            //  [_contactList addObject:contacName];
            
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
        
    }
    else if(buttonIndex == 1)
    {
        if (alertView.tag == 30001)
        {
            BOOL stricterFilter = NO;
            NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
            NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
            NSString *laxString1 =@"^[7-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]";
            
            NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
            NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
            //NSPredicate *emailTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", laxString1];
            
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
        else if (alertView.tag == 3134)
        {
            [self fetchContactsandAuthorization];

        }
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
     }
}
-(void)actionSheet:(UIActionSheet *)profileactionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (check==YES)
    {
        check=YES;
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
                    
                    //imagePicker.allowsEditing = NO;
                    imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                    [self presentModalViewController:imagePicker animated:YES];
                }
                
                break;
            default:
                break;
        }
        check=NO;
    }
    else
    {
        check=NO;
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        
        switch (buttonIndex)
        {
            case 0:
            {
               
                if ([innercount integerValue] >=25)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You Exceeded the Limit to add friend in Inner Circle" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alert show];
                    
                 }
                else
                {
                    
                [self.view showActivityViewWithLabel:@"Loading"];
                MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                [dict setValue:@"friendRequest" forKey:@"name"];
                
                NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
                // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
                    if(isfiltered)
                    {
                        [dict1 setValue:strsearch1 forKey:@"requestToId"];

                    }
                    else
                    {
                        [dict1 setValue:str1 forKey:@"requestToId"];

                    }
                    
//                if ([str21 integerValue] == 1)
//                {
//                    [dict1 setValue:str1 forKey:@"requestToId"];
//                }
//                else if ([strsearch3 integerValue] == 1)
//                {
//                    [dict1 setValue:strsearch1 forKey:@"requestToId"];
//                }
               
                    
                [dict1 setValue:@"1" forKey:@"circle"];
                [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                
                //[dict1 setValue:@"0" forKey:@"status"];
                // [dict1 setValue:@"1" forKey:@"request_status"];
                [webServiceManager setDelegateMethode:self];
                [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
                
                 }
                //            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                //            {
                //               // imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
                //                [self presentModalViewController:imagePicker animated:YES];
            }
                break;
            case 1:
                
            {
                if ([outercount integerValue] >=25)
                {
                    
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You Exceeded the Limit to add friend in Outer Circle" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alert show];
 
                }
                else
                {
                
                [self.view showActivityViewWithLabel:@"Loading"];
                
                MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                [dict setValue:@"friendRequest" forKey:@"name"];
                
                NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
                // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
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
//                if ([str21 integerValue] == 1)
//                {
//                    [dict1 setValue:str1 forKey:@"requestToId"];
//                }
//                else if ([strsearch3 integerValue] == 1)
//                {
//                    [dict1 setValue:strsearch1 forKey:@"requestToId"];
//
//                }
                //  [dict1 setValue:_friendstr forKey:@"requestToId"];
                
                // [dict1 setValue:@"0" forKey:@"request_status"];
                
                [webServiceManager setDelegateMethode:self];
                [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
            }
                
            }
                //            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
                //            {
                //
                //                // Set source to the Photo Library
                //               // imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                //                [self presentModalViewController:imagePicker animated:YES];
                //            }
                break;
            case 2:
            {
                if(isfiltered)
                {
                    if ([strsearch2 integerValue] == 1)
                    {
                        [self.view showActivityViewWithLabel:@"Loading"];
                        
                        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                        [dict setValue:@"blocknUnblockUser" forKey:@"name"];
                        
                        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                        
                        [dict1 setValue:strsearch1 forKey:@"requestToId"];
                        [dict1 setValue:@"0" forKey:@"action"];
                        [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                        
                        [webServiceManager setDelegateMethode:self];
                        [webServiceManager callMyWebServiceManager:@"blocknUnblockUser":dict :dict1];
                        
                    }
                    else
                    {
                        [self.view showActivityViewWithLabel:@"Loading"];
                        
                        
                        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                        [dict setValue:@"blocknUnblockUser" forKey:@"name"];
                        
                        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                        
                        
                            [dict1 setValue:strsearch1 forKey:@"requestToId"];
                            
                        
                        [dict1 setValue:@"1" forKey:@"action"];
                        [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                        
                        
                         [webServiceManager setDelegateMethode:self];
                        [webServiceManager callMyWebServiceManager:@"blocknUnblockUser":dict :dict1];
                    }
                }
                else
                {
                    if ([str2 integerValue] == 1)
                    {
                        [self.view showActivityViewWithLabel:@"Loading"];
                        
                        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                        [dict setValue:@"blocknUnblockUser" forKey:@"name"];
                        
                        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                        
                        
                            [dict1 setValue:str1 forKey:@"requestToId"];
                            
                        
                        
                        [dict1 setValue:@"0" forKey:@"action"];
                        [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                        
                        [webServiceManager setDelegateMethode:self];
                        [webServiceManager callMyWebServiceManager:@"blocknUnblockUser":dict :dict1];
                        
                    }
                    else
                    {
                        [self.view showActivityViewWithLabel:@"Loading"];
                        
                        
                        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                        [dict setValue:@"blocknUnblockUser" forKey:@"name"];
                        
                        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                        
                       
                            [dict1 setValue:str1 forKey:@"requestToId"];
                            
                        
                        [dict1 setValue:@"1" forKey:@"action"];
                        [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                        
                        //        [dict1 setValue:@"0" forKey:@"status"];
                        // [dict1 setValue:@"1" forKey:@"request_status"];
                        
                        [webServiceManager setDelegateMethode:self];
                        [webServiceManager callMyWebServiceManager:@"blocknUnblockUser":dict :dict1];
                    }
                }
                
            }
                break;
            case 3:
            {
                NSLog(@"click on cancel");
            }
                
                break;
            default:
                break;
        }
        
        
        
    }
    
 }

- (IBAction)ProfileBtnAction:(id)sender {
    
    //    ProfileViewController *FVC=[[ProfileViewController alloc]init];
    //   // [FVC setStr1:@"feed"];
    //
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on feedlist button"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)FeedBtnAction:(id)sender {
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr1:@"feed"];
    
   
    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)FriendsBtnAction:(id)sender {
    ChatfriendViewController *VC1=[[ChatfriendViewController alloc]init];
    
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


//-(void)actionSheet1:(UIActionSheet *)myActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//
//    }


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
- (IBAction)profileiconBtnAction:(id)sender {
    ProfileViewController *evc=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:evc animated:YES];
}

- (IBAction)SosBtnAction:(id)sender {
    BS1ViewController *evc=[[BS1ViewController alloc]init];
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

- (IBAction)Addcontact:(id)sender
{
    _Addcontactview.hidden=NO;
    _FirstnameTF.text=@"";
    _LastnameTF.text=@"";
    _PhoneTF.text=@"";
    
     [_FirstnameTF resignFirstResponder];
     [_LastnameTF resignFirstResponder];
    [_PhoneTF resignFirstResponder];
}

- (IBAction)CancelBtnAction:(id)sender {
    _Addcontactview.hidden=YES;

}
- (IBAction)DoneBtnAction:(id)sender {
    
    [_FirstnameTF resignFirstResponder];
    [_LastnameTF resignFirstResponder];
    [_PhoneTF resignFirstResponder];
    NSString *foo=_LastnameTF.text;
    NSString *trimmed = [foo stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    _LastnameTF.text=trimmed;
    
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    //NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,14}$";
    //NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    NSString *regExPattern = @"^[01]?[- .]?(\([2-9]d{2})|[2-9]d{2})[- .]?d{3}[- .]?d{4}$";
    NSPredicate *phoneTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regExPattern];
      //[23456789][0-9]{6}([0-9]{3})
     NSString *phoneRegex = @"[23456789][0-9]{6}([0-9]{3})";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
 
     NSString *msg  = @"0";
    
    if([_FirstnameTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter name";
     }
    else if (_LastnameTF.text.length < 1)
    {
        msg = @"Please enter your email address";
        
     }
    else if([emailTest evaluateWithObject:_LastnameTF.text] == NO)
    {
        msg = @"Please enter valid email address";
     }
    else if (_PhoneTF.text.length == 0 || [_PhoneTF.text isEqualToString:@" "])
    {
        msg = @"Please enter phone number";
    }
    else if (_PhoneTF.text.length < 10 || _PhoneTF.text.length > 13)
    {
        msg = @"Please enter valid mobile number";
    }
    else if (_PhoneTF.text.length == 10)
    {
        if(![test evaluateWithObject:_PhoneTF.text])
        {
            msg =@"Please enter valid mobile number";
        }
        
    }
    
    
//    else if([phoneTest1 evaluateWithObject:_PhoneTF.text])
//    {
//        msg =@"US mobile number";
//    }
    
    if (![msg isEqualToString:@"0"])
    {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
     [self.view showActivityViewWithLabel:@"Loading"];
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"contactsave" forKey:@"name"];
 
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [paramDict setObject:_FirstnameTF.text forKey:@"name"];
    [paramDict setObject:_LastnameTF.text forKey:@"email"];
    [paramDict setObject:_PhoneTF.text forKey:@"contact"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"contactsave" :dict :paramDict];
        
    }
}
- (IBAction)SkipBtnAction:(id)sender
{
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr1:@"feed"];
    [self.navigationController pushViewController:FVC animated:YES];
}

@end

