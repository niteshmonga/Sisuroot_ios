//
//  PHQ8ViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "PHQ8ViewController.h"
#import "PHQ9ViewController.h"
#import "FeedViewController.h"
#import "DemoOtherViewController.h"
#import "Bs2ViewController.h"
#import "SWRevealViewController.h"
#import "MyWebserviceManager.h"
#import "SettingTableViewCell.h"

@interface PHQ8ViewController ()
{
    NSMutableArray *TestArray;
    NSMutableArray *imgarr;
    NSMutableArray *listarr;
    BOOL check;
    BOOL check1;
    BOOL check2;
    BOOL check3;
    BOOL check4;
    bool is_Select;
    bool is_Select1;
    
    NSString *value;
    NSMutableArray *testarray1;
    NSMutableArray *testarray11;
    NSString *teststr11;
}
@end

@implementation PHQ8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callfetchprofile];
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationController.navigationBar.hidden=YES;
     testarray1=[[NSMutableArray alloc]initWithObjects:
                @{@"value":@"Demographic Form", @"is_Select":@"0"},
                @{@"value":@"Demographic Form Therapy", @"is_Select":@"0"},
                @{@"value":@"Demographic Form Teens", @"is_Select":@"0"},
                @{@"value":@"Demographic Form PPD", @"is_Select":@"0"},nil];
    testarray11=[[NSMutableArray alloc]initWithObjects:
                 @{@"value":@"Demographic Form", @"is_Select1":@"0"},
                 @{@"value":@"Demographic Form Therapy", @"is_Select1":@"0"},
                 @{@"value":@"Demographic Form Teens", @"is_Select1":@"0"},
                 @{@"value":@"Demographic Form PPD", @"is_Select1":@"0"},nil];
    
    is_Select=0;
      NSArray *listarr14=_listarray12;
    
    listarr=[[NSMutableArray alloc]init];
    listarr=[listarr14 mutableCopy];
    
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *newDict1 = [[NSMutableDictionary alloc] init];
    
    NSDictionary *oldDict = [[NSDictionary alloc] init];
    
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:0];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Demographic_Form_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:0 withObject:newDict];
    
//    newDict1 = [[NSMutableDictionary alloc] init];
//    [newDict1 addEntriesFromDictionary:oldDict];
//    [newDict1 setObject:[listarr valueForKey:@"BriefStatus"] forKey:@"is_Select1"];
//    [testarray11 replaceObjectAtIndex:0 withObject:newDict1];
    
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:1];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Demograpic_form2_group_status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:1 withObject:newDict];
    
//    newDict1 = [[NSMutableDictionary alloc] init];
//    [newDict1 addEntriesFromDictionary:oldDict];
//    [newDict1 setObject:[listarr valueForKey:@"PhqStatus"] forKey:@"is_Select1"];
//    [testarray11 replaceObjectAtIndex:1 withObject:newDict1];
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:2];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Demograpic_form3_group_status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:2 withObject:newDict];
    
//    newDict1 = [[NSMutableDictionary alloc] init];
//    [newDict1 addEntriesFromDictionary:oldDict];
//    [newDict1 setObject:[listarr valueForKey:@"Phq2Status"] forKey:@"is_Select1"];
//    [testarray11 replaceObjectAtIndex:2 withObject:newDict1];
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:3];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Demograpic_form4_group_status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:3 withObject:newDict];
    
//    newDict1 = [[NSMutableDictionary alloc] init];
//    [newDict1 addEntriesFromDictionary:oldDict];
//    [newDict1 setObject:[listarr valueForKey:@"PerceivedStatus"] forKey:@"is_Select1"];
//    [testarray11 replaceObjectAtIndex:3 withObject:newDict1];
//
    
    
    
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)NotatallBtnAction:(id)sender {
    
    Bs2ViewController *BSV=[[Bs2ViewController alloc]init];
     [self.navigationController pushViewController:BSV animated:YES];
}

- (IBAction)Btn2Action:(id)sender {
    
    DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
    [BSV setTypeString:@"demo1"];
    [self.navigationController pushViewController:BSV animated:YES];
}

- (IBAction)Btn3Action:(id)sender {
   
    DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
    [BSV setTypeString:@"demo2"];
    [self.navigationController pushViewController:BSV animated:YES];
}

- (IBAction)Btn4Action:(id)sender
{
    DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
    [BSV setTypeString:@"demo3"];
    [self.navigationController pushViewController:BSV animated:YES];
}

- (IBAction)SkipBtnAction:(id)sender {
    
//    NSString *phNo = @"911";
//    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
//
//    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
//        [[UIApplication sharedApplication] openURL:phoneUrl];
//    } else
//    {
//       UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//        [calert show];
 //   [self.navigationController popViewControllerAnimated:YES];
    }
//}


-(void)callfetchprofile
{
    // hud.hidden=NO;
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
     [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
    
}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            
//            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Demographic_Form_Group_Status"] isEqual:@"0"]) {
//
//                [_Btn1obj setUserInteractionEnabled:YES];
//
//            }
//            else
//            {
//                [_Btn1obj setUserInteractionEnabled:NO];
//                [_Btn1obj setBackgroundColor: [UIColor grayColor]];
//
//            }
//            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Demograpic_form2_group_status"] isEqual:@"0"]) {
//
//                [_Btn2obj setUserInteractionEnabled:YES];
//
//            }
//            else
//            {
//                [_Btn2obj setUserInteractionEnabled:NO];
//                [_Btn2obj setBackgroundColor: [UIColor grayColor]];
//
//            }
//
//            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Demograpic_form3_group_status"] isEqual:@"0"]) {
//
//                [_Btn3obj setUserInteractionEnabled:YES];
//
//            }
//            else
//            {
//                [_Btn3obj setUserInteractionEnabled:NO];
//                [_Btn3obj setBackgroundColor: [UIColor grayColor]];
//
//            }
//
//            if ([[[responseDictionary valueForKey:@"data"] valueForKey:@"Demograpic_form4_group_status"] isEqual:@"0"]) {
//
//                [_Btn4obj setUserInteractionEnabled:YES];
//
//            }
//            else
//            {
//                [_Btn4obj setUserInteractionEnabled:NO];
//                [_Btn4obj setBackgroundColor: [UIColor grayColor]];
//
//            }
//
 
        }
        
    }
}


    
//    if ([_nextpagestr isEqualToString:@"nextpage"])
//    {
//        _MenuBtnobj.hidden=YES;
//    }
//
//
//    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
//    _Btn5obj.layer.cornerRadius=18;
//    _Btn5obj.clipsToBounds=YES;
    // Do any additional setup after loading the view from its nib.
    
 - (IBAction)HomeBtnAction:(id)sender {
    
    FeedViewController *LVC3=[[FeedViewController alloc]init];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on perceived test button"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    [self.navigationController pushViewController:LVC3 animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return testarray1.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"ListtableView";
    
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SettingTableViewCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
        
    }
    cell.backlblobj.font=[UIFont systemFontOfSize:16.0];
    cell.backlblobj.textColor=[UIColor whiteColor];
     cell.switchobj.hidden=YES;
    
    if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
        
        
       // cell.listlblobj.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
        cell.backlblobj.text=@"Demographic Form";
        cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:61.0/255.0 green:181.0/255.0 blue:230.0/255.0 alpha:1.0];
        cell.iconimg.hidden=NO;
//        if ([[[testarray11 objectAtIndex:indexPath.row] valueForKey:@"is_Select1"] isEqual:@"1"]) {
//
//            cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0];
//
//        }
//        else
//        {
//
//
//            cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:61.0/255.0 green:181.0/255.0 blue:230.0/255.0 alpha:1.0];
//        }
    }
    else
    {
        
        cell.backlblobj.text=@"";
        
    }
    
    
    
    return cell;
}

//        cell.imgsObj.image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float heightForRow = 60;
    
    //SettingTableViewCell *cell =(SettingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    
    if([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"])
    {
        return heightForRow;
    }
    else {
        return 0;
    }
    
    
    //[testarray1 indexPath.row]["is_Select"]
    
    //    if(check==true)
    //    {
    //
    //        return heightForRow;
    //
    //    }
    //     else
    //    {
    //        return 0;
    //    }
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"Demographic Form"])
    {
        Bs2ViewController *BSV=[[Bs2ViewController alloc]init];
        [self.navigationController pushViewController:BSV animated:YES];
    }
    
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"Demographic Form Therapy"])
    {
        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
        [BSV setTypeString:@"demo1"];
        [self.navigationController pushViewController:BSV animated:YES];
        
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"Demographic Form Teens"])
    {
        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
        [BSV setTypeString:@"demo2"];
        [self.navigationController pushViewController:BSV animated:YES];
        
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"Demographic Form PPD"])
    {
        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
        [BSV setTypeString:@"demo3"];
        [self.navigationController pushViewController:BSV animated:YES];
        
    }
    
    
    
}

@end
