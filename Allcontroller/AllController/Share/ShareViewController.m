#import "ShareViewController.h"
#import "ShareTableViewCell.h"
#import "feedViewController.h"
#import "ProfileViewController.h"
#import "UIImageView+WebCache.h"
#import "MyWebserviceManager.h"
#import "Base64.h"
#import "UIView+RNActivityView.h"
#import "BS1ViewController.h"
#import "FriendsViewController.h"

@interface ShareViewController ()
{
    
    NSMutableArray *innerarr;
    NSMutableArray *outer;
    BOOL flag1;
    BOOL check1;
    NSString *Friendid;
    NSMutableArray *checkarr;
    NSString *checkedstr;
    NSString *strflag;
    NSMutableArray *arrayCheckUnchek;
    NSMutableArray *cellDataArray;
    NSString *strshare;
    NSMutableArray *friendarrid;
    NSMutableArray *arrid;
    NSArray *arrayWithoutDuplicates;
    NSString *tadstatusstr;

}

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [FIRAnalytics setScreenName:@"Share to inner friends" screenClass:@"Share to inner friends"];
    self.navigationController.navigationBar.hidden=YES;
    // Do any additional setup after loading the view from its nib.
    _Postbtnobj.layer.cornerRadius=15;
    _Postbtnobj.clipsToBounds=YES;
    
    arrayCheckUnchek = [[NSMutableArray alloc]init];
    //Assign your cell data array
    // cellDataArray = [[NSMutableArray alloc]initWithObjects:@"cell-1",@"cell-2",@"cell-3",@"cell-4",@"cell-5", nil];
    
    // setting all unchecks initially
    
    
    if ([_str1 isEqualToString:@"one"])
    {
        // _str1=@"1";
        _Selectfriendlbl.text=@"Share To Inner Friends";
        [self callinnerlist];
        
    }
    if ([_str4 isEqualToString:@"Two"])
    {
        //_str1=@"2";
        _Selectfriendlbl.text=@"Share To Outer Friends";
        
        [self callouterlist];
        
        // [self callinnerlist];
        
        
    }
    friendarrid=[[NSMutableArray alloc]init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)callinnerlist
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"groupFriends" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
    // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:@"1" forKey:@"group_id"];
    [dict1 setValue:_str2 forKey:@"tag_id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"groupFriends":dict :dict1];
}
-(void)callouterlist
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"groupFriends" forKey:@"name"];
     NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
    // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:@"2" forKey:@"group_id"];
    [dict1 setValue:_str2 forKey:@"tag_id"];
     // [dict1 setValue:str1 forKey:@"requestToId"];
     //  [dict1 setValue:_friendstr forKey:@"requestToId"];
     // [dict1 setValue:@"0" forKey:@"request_status"];
 
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"groupFriends":dict :dict1];
}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    // ActivityIndicator.hidden=YES;
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"groupFriends"])
    {
        NSLog(@"test...%@",responseDictionary);
        
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            innerarr = [[NSMutableArray alloc] init];
            
             for (int i = 0; i <localArray.count; i++)
            {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                dict = [[localArray objectAtIndex:i] mutableCopy];
                [dict setValue:@"0" forKey:@"status"];
                [innerarr addObject:dict];
            }
            
            [_ShareTableviewobj reloadData];
        }
        
        //  ProfileViewController *Hgn= [[ProfileViewController alloc]init];
        //  [self.navigationController pushViewController:Hgn animated:YES];
        //  innerarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
        //            innerarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
        //             // strflag=[[responseDictionary valueForKey:@"status_data"] valueForKey:@"flag"];
        //            [_ShareTableviewobj reloadData];
        //            UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:nil message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //            [alert show];
        //
        
        //            HomeViewController * hVC =[[HomeViewController  alloc]init];
        //            [self.navigationController pushViewController:hVC animated:YES];
        
     else
    {
                    UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    alert.tag=4009;
                    [alert show];
        
    }
    }
    
    //    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"checkBoxSelection"])
    //    {
    //        NSLog(@"test...%@",responseDictionary);
    //
    //        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
    //        {
    //
    //           //outer =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"status_message"]];
    //
    //            if ([_str1 isEqualToString:@"one"])
    //            {
    //                // _str1=@"1";
    //                [self callinnerlist];
    //            }
    //            if ([_str4 isEqualToString:@"Two"])
    //            {
    //                //_str1=@"2";
    //                [self callouterlist];
    //
    //
    //            }
    //        }
    //    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"shareTag"])
    {
        NSLog(@"test...%@",responseDictionary);
        
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
//            ProfileViewController *PVC=[[ProfileViewController alloc]init];
//            [self.navigationController pushViewController:PVC animated:YES];
//            if ([_str1 isEqualToString:@"one"])
//            {
//                  [self callinnerlist];
//
//            }
        UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                                [alert show];
            if ([_str4 isEqualToString:@"Two"])
            {
                 [self callouterlist];
                
            }
            else
            {
                 [self callinnerlist];
                
            }
        }
    }
    //    else
    //    {
    //                    UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"nil" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    //                    [alert show];
    //    }
}


-(void) processFailed :(NSError *)responseDictionary
{
    //ActivityIndicator.hidden=YES;
    
    NSLog(@"error");
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    if (isfiltered)
    //    {
    //        return inner.count;
    //    }
    //    else
    //    {
    //        return  outer.count;
    //
    //    }
    return innerarr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *iden=@"ListtableView";
    ShareTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:iden];
    if (cell==nil)
    {
        NSArray * array =[[NSBundle mainBundle]loadNibNamed:@"ShareTableViewCell" owner:self options:nil];
        cell=[array objectAtIndex:0];
        
    }
 
     cell.Usernamelbl.text=[[innerarr objectAtIndex:indexPath.row] valueForKey:@"username"];
    //  cell.circlenamelbl.text=[[inner objectAtIndex:indexPath.row] valueForKey:@"contact_phone"];
    NSString *imgStr1 = [[innerarr objectAtIndex:indexPath.row]valueForKey:@"profile_img"];
    
    if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
    {
        cell.Userimg.image = [UIImage imageNamed:@"user.png"];
    }
    else
    {
        
        if([[[innerarr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
            
        {
            if ([imgStr1 isEqual:(id)[NSNull null]] ||[imgStr1 isEqualToString:@""])
             {
                cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            else
            {
                [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[innerarr objectAtIndex:indexPath.row]valueForKey:@"profile_img"]] placeholderImage:nil];
                cell.Userimg.contentMode=UIViewContentModeScaleToFill;
            }
        }
        else
        {
            [cell.Userimg setImageWithURL:[[innerarr objectAtIndex:indexPath.row]valueForKey:@"profile_img"]placeholderImage:nil];
            cell.Userimg.contentMode=UIViewContentModeScaleToFill;
        }
    }
    
    //Friendid= [[innerarr objectAtIndex:indexPath.row] valueForKey:@"id"];
    
     UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(280.0, 25.0, 35.0, 35.0)];
    
    
    if ([[[innerarr objectAtIndex:indexPath.row] valueForKey:@"tad_status"] integerValue] == 1)
    {
        cell.Circleimg.image = [UIImage imageNamed:@"circle1.png"];
 
    }
    else
    {
        cell.Circleimg.image = [UIImage imageNamed:@"circle2.png"];
        
    }
    
    //    if ([[[innerarr objectAtIndex:indexPath.row] valueForKey:@"tad_status"] integerValue]==1)
    //    {
    //        flag=0;
    //        [button setImage:[UIImage imageNamed:@"icons8-ok_filled.png"] forState:UIControlStateNormal];
    //
    //    }
    //    else
    //    {
    //        flag=1;
    //        if(check==1)
    //        {
    //            [button setImage:[UIImage imageNamed:@"icons8-full_moon.png"] forState:UIControlStateNormal];
    //
    //        }
    //        else if(check==0)
    //        {
    //            // Friendid= [[innerarr objectAtIndex:indexPath.row] valueForKey:@"id"];
    //
    //            [button setImage:[UIImage imageNamed:@"icons8-ok_filled.png"] forState:UIControlStateNormal];
    //            strshare=[[innerarr objectAtIndex:indexPath.row] valueForKey:@"tad_status"];
    //
    //            //        for(int i=0; i<[innerarr count]; i++)
    //            //        {
    //            // checkedstr=[innerarr objectAtIndex:indexPath.row];
    //            //_str1=[[innerarr objectAtIndex:indexPath.row] valueForKey:@"id"];
    //            //         }
    //
    //        }
    //   }
    
    cell.RequestBtnobj.tag = indexPath.row;
    [cell.RequestBtnobj addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    //    [cell.contentView addSubview:button];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    if ([[[userarr objectAtIndex:indexPath.row] valueForKey:@"status"] integerValue] == 1)
    //
    //    {
    //        OtherFriendViewController *HVC=[[OtherFriendViewController alloc]init];
    //        [HVC setDetail:[[userarr objectAtIndex:indexPath.row]valueForKey:@"request_id"]];
    //        [HVC setStr1:_strcount];
    //        [self.navigationController pushViewController:HVC animated:YES];
    //    }
    //    else
    //    {
    //        NSLog(@"Not a App User");
    //    }
    
}
//-(void)CheckAction : (UIButton *) btn
//{

//
//    if(check==1)
//    {
//        check=0;
//        // [cell.CheckBtnobj setSelected:NO];
//        //flag=1;
//    }
//    else{
//        check=0;
//
//    }
//}

// NSString *allContactIdString;

-(void)buttonClicked  : (UIButton *) btn
{
   
    Friendid = [[innerarr objectAtIndex:btn.tag] valueForKey:@"id"];
    tadstatusstr=[[innerarr objectAtIndex:btn.tag] valueForKey:@"tad_status"];
    
    if ([[[innerarr objectAtIndex:btn.tag] valueForKey:@"tad_status"] integerValue] == 1)
    {
                    UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Are you sure, you want to Unshare this post" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
                    [alertcrp addButtonWithTitle:@"YES"];
                    [alertcrp show];
     }
    else
    {
        
        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Are you sure, you want to Share this post" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
        [alertcrp addButtonWithTitle:@"YES"];
        [alertcrp show];
        
//         check1=0;
//         NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
//         localDict = [innerarr objectAtIndex:btn.tag];
//
//        if ([[localDict valueForKey:@"status"] integerValue] == 0)
//        {
//            [localDict setValue:@"1" forKey:@"status"];
//            flag1=1;
//
        
            
    }
//        else
//        {
//
//            [localDict setValue:@"0" forKey:@"status"];
//            flag1=0;
//           // check1=0;
//        }
 //       [_ShareTableviewobj reloadData];
        
    // }
    
}


//    for (int i = 0; i < innerarr.count; i++)
//    {
//        if ([[[innerarr objectAtIndex:i] valueForKey:@"status"] integerValue] == 1)
//        {
//            if (i == 0)
//            {
//                Friendid = [[innerarr objectAtIndex:i] valueForKey:@"id"];
//            }
//            else
//            {
//                Friendid = [NSString stringWithFormat:@"%@,%@",Friendid,[[innerarr objectAtIndex:i] valueForKey:@"id"]];
//
//            }
//        }
//    }
//
//     if ([[[innerarr objectAtIndex:sender.tag] valueForKey:@"tad_status"] integerValue]==1)
//    {
//        [sender setImage:[UIImage imageNamed:@"icons8-ok_filled.png"] forState:UIControlStateNormal];
//
//    }
//    else
//    {
//
//    }

//    CGPoint touchPoint = [sender convertPoint:CGPointZero toView:_ShareTableviewobj];
//    NSIndexPath *indexPath = [_ShareTableviewobj indexPathForRowAtPoint:touchPoint];
//
//    UIButton *button = (UIButton *)sender;
//
//    if ([[[innerarr objectAtIndex:indexPath.row] valueForKey:@"tad_status"] integerValue]==1)
//    {
//         [button setImage:[UIImage imageNamed:@"icons8-ok_filled.png"] forState:UIControlStateNormal];
//
//    }
//    else
//    {
//
//        flag=0;
//        NSMutableArray *friendarrar=[[NSMutableArray alloc]init];
//        friendarrar = [innerarr  valueForKey:@"id"];
//
//        if([button.currentImage isEqual:[UIImage imageNamed:@"icons8-full_moon.png"]])
//        {
//            check=1;
//            [sender  setImage:[UIImage imageNamed: @"icons8-ok_filled.png"] forState:UIControlStateNormal];
//            check=0;
//            if(indexPath != Nil)
//            {
//                // NSString *finalIntId = [friendarrar objectAtIndex:indexPath.row];
//                Friendid=[friendarrar objectAtIndex:indexPath.row];
//                // store check box ids in mutableArrayOfIds
//                NSLog(@"Tagged checked button id = %@", Friendid);
//                [friendarrid addObject:Friendid];
//                NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:friendarrid];
//                arrayWithoutDuplicates = [orderedSet array];
//
//            }
//            //NSString *finalIntId = [mutableArrayOfIds objectAtIndex:tappedButton.tag];
//            //NSString *finalIntId = [mutableArrayOfIds objectAtIndex:indexPath.row];
//
//        }
//        else
//        {
//            [sender setImage:[UIImage imageNamed:@"icons8-full_moon.png"]forState:UIControlStateNormal];
//            NSLog(@"UnChecked");
//            check=1;
//            [_ShareTableviewobj reloadData];
//
//            //[arrayOfIds removeObjectAtIndex:tappedButton.tag];
//
//        }
//


- (IBAction)backBtnobj:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)Callpostshare
{
    if ([tadstatusstr integerValue] ==1)
    {
        
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"shareTag" forKey:@"name"];
        
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
        //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
        // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
        [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
        [dict1 setValue:Friendid forKey:@"share_to"];
        [dict1 setValue:_str2 forKey:@"tag_id"];
        [dict1 setValue:@"1" forKey:@"share_status"];
        //  [dict1 setValue:_friendstr forKey:@"requestToId"];
        // [dict1 setValue:@"0" forKey:@"request_status"];
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"ShareTagPost":dict :dict1];
    }
    else
    {
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"shareTag" forKey:@"name"];
        
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
        //[dict1 setValue:[[userarr objectAtIndex:btn.tag] valueForKey:@"id"] forKey:@"product_id"];
        // [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"reuest_id"]] forKey:@"requestToId"];
        [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
        [dict1 setValue:Friendid forKey:@"share_to"];
        [dict1 setValue:_str2 forKey:@"tag_id"];
        [dict1 setValue:@"0" forKey:@"share_status"];
        // [dict1 setValue:@"0" forKey:@"request_status"];
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"ShareTagPost":dict :dict1];
    }
   
}
- (IBAction)PostBtn:(id)sender {
    
    
    BS1ViewController *pvc=[[BS1ViewController alloc]init];
    //[pvc setStr2:@"feed"];
    [self.navigationController pushViewController:pvc animated:YES];
    
}
//    NSString *newstr;
//     for (int i = 0; i < innerarr.count; i++)
//    {
//        if ([[[innerarr objectAtIndex:i] valueForKey:@"status"] integerValue] == 1)
//        {
//            if (i == 0)
//            {
//                newstr = [[innerarr objectAtIndex:i] valueForKey:@"id"];
//            }
//            else
//            {
//
//                newstr = [NSString stringWithFormat:@"%@,%@",newstr,[[innerarr objectAtIndex:i] valueForKey:@"id"]];
//
//            }
//        }
//    }
    
    //Friendid=newstr;
//    if(check1==0)
//    {
//
//        if(flag1==0 && newstr.length < 1 )
//        {
//
//
//            UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Please select friends" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alert show];
//
//
//        }
//        else
//        {
//
//            flag1=1;
//            UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Are you sure, you want to Share this post" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
//            [alertcrp addButtonWithTitle:@"Ok"];
//            [alertcrp show];
//
//        }
//
//    }
//    else
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Post Already shared" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//        [alert show];
//
//    }
//
    
   
 


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
        if(alertView.tag == 4009)
        {
              FriendsViewController *Hgn= [[FriendsViewController alloc]init];
             [Hgn setStr1:@"done"];
              [self.navigationController pushViewController:Hgn animated:YES];
        }
        else
        {
            
        }
    }
    else if(buttonIndex == 1)
    {
        [self Callpostshare];
        
        
    }
}
@end
