//
//  SelectContactViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 26/11/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "SelectContactViewController.h"
#import "SelectContactTableViewCell.h"
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "FeedViewController.h"
#import "EditViewController.h"
#import "UIView+RNActivityView.h"

@interface SelectContactViewController ()
{
     NSMutableArray *userarr;
    BOOL isfiltered;
    NSString *searchtextstr;
    NSMutableArray *FilteredDevices;
}
@end

@implementation SelectContactViewController
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    return YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self callcontactlist];
    self.navigationController.navigationBar.hidden=YES;
    isfiltered=false;
    self.searchBar.delegate=self;
     _Addcontactview.hidden=YES;
    _Addnewcontactobj.layer.cornerRadius=4;
    _Addnewcontactobj.clipsToBounds=YES;
    
    //_Addnewcontactobj.layer.borderWidth =1;
    
    
    
    _Addcontactview.layer.cornerRadius=8;
    _Addcontactview.clipsToBounds=YES;
    
    _Addcontactview.layer.borderWidth =1;
    _Addcontactview.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _SkipBtnobj.layer.cornerRadius=6;
    _SkipBtnobj.clipsToBounds=YES;
   // _SkipBtnobj.layer.borderColor=[UIColor whiteColor].CGColor;
    //_SkipBtnobj.layer.borderWidth = 1;
    if ([_str1 isEqualToString:@"done"])
    {
        
        
    }
    
    _InviteBtnobj.layer.cornerRadius=6;
    _InviteBtnobj.clipsToBounds=YES;
    // _InviteBtnobj.layer.borderWidth = 1;
    // Do any additional setup after loading the view from its nib.
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped1:)];
    [self.view addGestureRecognizer:tapper];
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    [_searchBar resignFirstResponder];
    // _searchBar.hidden=YES;
}
-(void) tapped1:(UIGestureRecognizer *) sender
{
    [_FirstnameTF resignFirstResponder];
    [_LastnameTF resignFirstResponder];
    [_PhoneTF resignFirstResponder];

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
    [_tableviewobj reloadData];
    return YES;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length==0)
    {
        isfiltered=false;
        //[self callcontactlist];

        [_tableviewobj reloadData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)InviteBtnAction:(id)sender {
    
    
    NSString *allContactIdString;
 
    if (isfiltered)
    {
        for (int i = 0; i < FilteredDevices.count; i++)
        {
            if ([[[FilteredDevices objectAtIndex:i] valueForKey:@"status"] integerValue] == 1)
            {
                if (i == 0)
                {
                    allContactIdString = [[FilteredDevices objectAtIndex:i] valueForKey:@"contact_phone"];
                }
                else
                {
                    if (allContactIdString.length < 1)
                    {
                        allContactIdString = [[FilteredDevices objectAtIndex:i] valueForKey:@"contact_phone"];
                    }
                    else
                    {
                        allContactIdString = [NSString stringWithFormat:@"%@,%@",allContactIdString,[[FilteredDevices objectAtIndex:i] valueForKey:@"contact_phone"]];
                    }
                }
            }
        }
    }
    else
    {
        for (int i = 0; i < userarr.count; i++)
        {
            if ([[[userarr objectAtIndex:i] valueForKey:@"status"] integerValue] == 1)
            {
                if (i == 0)
                {
                    allContactIdString = [[userarr objectAtIndex:i] valueForKey:@"contact_phone"];
                }
                else
                {
                    if (allContactIdString.length < 1)
                    {
                        allContactIdString = [[userarr objectAtIndex:i] valueForKey:@"contact_phone"];
                    }
                    else
                    {
                        allContactIdString = [NSString stringWithFormat:@"%@,%@",allContactIdString,[[userarr objectAtIndex:i] valueForKey:@"contact_phone"]];
                    }
                }
            }
        }
    }
    
     if ([allContactIdString isEqualToString:@""] || allContactIdString.length < 1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please select user" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
       [self.view showActivityViewWithLabel:@"Loading"];
        
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"SendRequestInnerCircle" forKey:@"name"];
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
       
         [dict1 setValue:allContactIdString forKey:@"number"];
        
        [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"invitesisuroot" :dict :dict1];
        
    }
    
    //        UIImageView *imagestr;
    //        imagestr.image = [UIImage imageNamed:@"icons8-ok_filled.png"];
    
   
    
}
- (IBAction)SkipBtnAction:(id)sender {
    
//    if ([_str1 isEqualToString:@"done"])
//    {
    
        FeedViewController  *pvc=[[FeedViewController alloc]init];
        // [pvc setStr1:@"done"];
        [self.navigationController pushViewController:pvc animated:YES];
        
//    }
//    else
//    {
//        EditViewController  *pvc=[[EditViewController alloc]init];
//        // [pvc setStr1:@"done"];
//        [self.navigationController pushViewController:pvc animated:YES];
 //   }
    
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
    SelectContactTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:iden];
    if (cell==nil)
    {
        NSArray * array =[[NSBundle mainBundle]loadNibNamed:@"SelectContactTableViewCell" owner:self options:nil];
        cell=[array objectAtIndex:0];
        
    }
    
    //[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    if (isfiltered)
    {
        NSString *contactname1=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
        
        if (![contactname1 isEqual:(id)[NSNull null]])
        {
            if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
            {
                
                cell.Circleimg.image = [UIImage imageNamed:@"circle1.png"];
                
            }
            else
            {
                cell.Circleimg.image = [UIImage imageNamed:@"circle2.png"];
                
            }
            cell.Usernamelbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_name"];
            cell.contactlbl.text=[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
            cell.Userimg.image = [UIImage imageNamed:@"user.png"];

//            NSString *imgStr1 = [[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
//
//            if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
//            {
//                cell.Userimg.image = [UIImage imageNamed:@"user.png"];
//
//            }
//            else
//            {
//                if([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
//
//                {
//
//                    [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]] placeholderImage:nil];
//                }
//                else if([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
//                {
//                    [cell.Userimg setImageWithURL:[[FilteredDevices objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]placeholderImage:nil];
//                    cell.Userimg.contentMode=UIViewContentModeScaleToFill;
//
//                }
//            }
            
            
        }
        
     }
    else
    {
        
        NSString *contactname1=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
        
        if (![contactname1 isEqual:(id)[NSNull null]])
        {
            if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
             {
                
                 cell.Circleimg.image = [UIImage imageNamed:@"circle1.png"];
                
            }
            else
            {
                 cell.Circleimg.image = [UIImage imageNamed:@"circle2.png"];
                
            }
            cell.Usernamelbl.text=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_name"];
            cell.contactlbl.text=[[userarr objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
            cell.Userimg.image = [UIImage imageNamed:@"user.png"];

//                NSString *imgStr1 = [[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
//
//                if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
//                {
//                    cell.Userimg.image = [UIImage imageNamed:@"user.png"];
 //                }
//                else
//                {
//                    if([[[userarr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
//
//                    {
//
//                        [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]] placeholderImage:nil];
//                    }
//                    else if([[[userarr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 0)
//                    {
//                        [cell.Userimg setImageWithURL:[[userarr objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]placeholderImage:nil];
//                        cell.Userimg.contentMode=UIViewContentModeScaleToFill;
//
//                    }
//                }
//
            
        }
     }
    
    cell.RequestBtnobj.tag = indexPath.row;
    
    [cell.RequestBtnobj addTarget:self action:@selector(RequestAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1 || [[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
//
//    {
//        OtherFriendViewController *HVC=[[OtherFriendViewController alloc]init];
//        if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
//        {
//            [HVC setDetail:[[userarr objectAtIndex:indexPath.row]valueForKey:@"request_id"]];
//        }
//        else if ([[[FilteredDevices objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
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


-(void)RequestAction  : (UIButton *) btn
{
    NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
    if (isfiltered)
    {
        localDict = [FilteredDevices objectAtIndex:btn.tag];
        
        if ([[localDict valueForKey:@"status"] integerValue] == 0)
        {
            [localDict setValue:@"1" forKey:@"status"];
            
        }
        else
        {
            
            [localDict setValue:@"0" forKey:@"status"];
        }
    }
    else
    {
        localDict = [userarr objectAtIndex:btn.tag];
        
        if ([[localDict valueForKey:@"status"] integerValue] == 0)
        {
            [localDict setValue:@"1" forKey:@"status"];
            
        }
        else
        {
            
            [localDict setValue:@"0" forKey:@"status"];
        }
    }
   
    [_tableviewobj reloadData];
    
}

-(void)callcontactlist
{
    [self.view showActivityViewWithLabel:@"Loading"];
    
MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
[dict setValue:@"contactList" forKey:@"name"];

NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];

[dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];

[webServiceManager setDelegateMethode:self];
[webServiceManager callMyWebServiceManager:@"GetInnerFriend" :dict :dict1];
    
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"contactList"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
           // [self callchathistory];
            // userarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            [self.view hideActivityView];

            NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            userarr = [[NSMutableArray alloc] init];
            
            for (int i = 0; i <localArray.count; i++)
            {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                dict = [[localArray objectAtIndex:i] mutableCopy];
                [dict setValue:@"0" forKey:@"status"];
                [userarr addObject:dict];
            }
            
             [_tableviewobj reloadData];
        }
        else
        {
            [self.view hideActivityView];

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"No Data Found" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"SendRequestInnerCircle"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
//            if ([_str1 isEqualToString:@"done"])
//            {
                 FeedViewController  *pvc=[[FeedViewController alloc]init];
                // [pvc setStr1:@"done"];
                [self.navigationController pushViewController:pvc animated:YES];
                
//            }
//            else
//            {
//                EditViewController  *pvc=[[EditViewController alloc]init];
//                // [pvc setStr1:@"done"];
//                [self.navigationController pushViewController:pvc animated:YES];
//            }
 
        }
        else{
            [self.view hideActivityView];

            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
        
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"searchFriends"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
           // FilteredDevices=[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            FilteredDevices = [[NSMutableArray alloc] init];
            
            for (int i = 0; i <localArray.count; i++)
            {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                dict = [[localArray objectAtIndex:i] mutableCopy];
                [dict setValue:@"0" forKey:@"status"];
                [FilteredDevices addObject:dict];
            }
            
            [_tableviewobj reloadData];
 
            
            //     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            //            [alert show];
            
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"contactsave"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
 
            [self callcontactlist];
            _Addcontactview.hidden=YES;
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            // Contacts already exists!
            
            
        }
        else
        {
            [self.view hideActivityView];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }
        
        
    }
 
}



- (IBAction)Addcontact:(id)sender
{
    _Addcontactview.hidden=NO;
    _FirstnameTF.text=@"";
    _LastnameTF.text=@"";
    _PhoneTF.text=@"";
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
    NSString *phoneRegex = @"^[\+(00)][0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
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
    else if([phoneTest evaluateWithObject:_PhoneTF.text])
    {
        msg =@"Please enter valid mobile number";
        
    }
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
        
        [paramDict setObject:_FirstnameTF.text forKey:@"name"];
        [paramDict setObject:_LastnameTF.text forKey:@"email"];
        [paramDict setObject:_PhoneTF.text forKey:@"contact"];
        [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
        
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"contactsave" :dict :paramDict];
        
    }
}
@end
