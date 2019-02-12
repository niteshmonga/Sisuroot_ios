

#import "TestlistViewController.h"
#import "SettingTableViewCell.h"
#import "BriefstartViewController.h"
#import "SWRevealViewController.h"
#import "PPDTest1ViewController.h"
#import "Bs3ViewController.h"
#import "FeedViewController.h"
#import "MyWebserviceManager.h"
#import "BriefstateQ1ViewController.h"
#import "PPDTest1ViewController.h"
#import "PPDTestCViewController.h"
#import "PPDTestDViewController.h"
#import "PPDTestEViewController.h"
#import "PercievedViewController.h"
#import "VoiceTestViewController.h"
#import "sectionAvoicetestViewController.h"
#import "BriefstateViewController.h"
#import "BS1ViewController.h"
#import "DemoOtherViewController.h"

//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
#import "PHQ2ViewController.h"

@interface TestlistViewController ()
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
    NSMutableArray *arr2;
    NSMutableArray *arr1;
     int i;
    int j;
     int count;
    NSString *arr2str;
    NSString *arr1str;
    int n1;
    int n2;
    
}

@end

@implementation TestlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //  [self callfetchprofile];
    self.navigationController.navigationBar.hidden=YES;
    self.contentviewobj.hidden=YES;
    _readbuttonobj.layer.cornerRadius=10;
    _readbuttonobj.clipsToBounds=YES;
    
    arr2=[[NSMutableArray alloc]initWithObjects:@"Quiz1"
          ,@"Quiz2",@"Quiz3",@"Quiz4",@"Quiz5"
          ,nil];
    int count = [arr2 count];
    for (int i = 0; i < count; ++i) {
        int nElements = count - i;
        n2 = (arc4random() % nElements) + i;
        [arr2 exchangeObjectAtIndex:i withObjectAtIndex:n2];
        
    }
    arr1str=[arr2 objectAtIndex:0];
    
    
    
    testarray1=[[NSMutableArray alloc]initWithObjects:
                @{@"value":@"ANXIETY TEST (GAD-7)", @"is_Select":@"0"},
                @{@"value":@"DEPRESSION (PHQ-9)", @"is_Select":@"0"},
                @{@"value":@"DEPRESSION (PHQ-2)", @"is_Select":@"0"},
                @{@"value":@"PERCEIVED STRESS TEST", @"is_Select":@"0"},
                @{@"value":@"SELF ESTEEM", @"is_Select":@"0"},
                @{@"value":@"SOCIAL CONNECTEDNESS", @"is_Select":@"0"},
                @{@"value":@"RESILIENCY", @"is_Select":@"0"},
                @{@"value":@"EDINBURGH PPD", @"is_Select":@"0"},
                @{@"value":@"VOICE TEST", @"is_Select":@"0"},
                @{@"value":@"NUTRITION", @"is_Select":@"0"},nil];
    
    testarray11=[[NSMutableArray alloc]initWithObjects:
                 @{@"value":@"ANXIETY TEST (GAD-7)", @"is_Select1":@"0"},
                 @{@"value":@"DEPRESSION (PHQ-9)", @"is_Select1":@"0"},
                 @{@"value":@"DEPRESSION (PHQ-2)", @"is_Select1":@"0"},
                 @{@"value":@"PERCEIVED STRESS TEST", @"is_Select1":@"0"},
                 @{@"value":@"SELF ESTEEM", @"is_Select1":@"0"},
                 @{@"value":@"SOCIAL CONNECTEDNESS", @"is_Select1":@"0"},
                 @{@"value":@"RESILIENCY", @"is_Select11":@"0"},
                 @{@"value":@"EDINBURGH PPD", @"is_Select1":@"0"},
                 @{@"value":@"VOICE TEST", @"is_Select1":@"0"},
                 @{@"value":@"NUTRITION", @"is_Select1":@"0"},nil];
    
    is_Select=0;

    //  TestArray=[[NSMutableArray alloc]initWithObjects:@"PHQ-9",@"GAD-7",@"SELF ESTEEM",@"SOCIAL CONNECTEDNESS",@"RESILIENCY",@"EDINBROUGH PPD",nil];
    
    //    NSMutableArray *testArrOfDict = @[
    //                                    @{@"replaceObjectAtIndexvalue":@"PHQ-9", @"Brief_State_Status":@"0"},
    //                                    @{@"value":@"GAD-7", @"PPDTestSecA_Group_Status":@"0"},
    //                                    @{@"value":@"SELF ESTEEM", @"PPDTestSecB_Group_Status":@"0"},
    //                                    @{@"value":@"SOCIAL CONNETEDNESS", @"PPDTestSecC_Group_Status":@"0"},
    //                                    @{@"value":@"RESILIENCY", @"PPDTestSecD_Group_Status":@"0"},
    //                                    @{@"value":@"EDINBROUGH PPD", @"Phq_Test_Status":@"0"},
    //                                    ]
    
    NSArray *listarr14=_listarray12;
    
    listarr=[[NSMutableArray alloc]init];
    listarr=[listarr14 mutableCopy];
    
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *newDict1 = [[NSMutableDictionary alloc] init];
    
    NSDictionary *oldDict = [[NSDictionary alloc] init];
    
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:0];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Brief_State_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:0 withObject:newDict];
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"BriefStatus"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:0 withObject:newDict1];
    
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:1];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Phq_Test_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:1 withObject:newDict];
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"PhqStatus"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:1 withObject:newDict1];
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:2];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Phq2_Test_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:2 withObject:newDict];
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"Phq2Status"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:2 withObject:newDict1];
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:3];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Perceived_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:3 withObject:newDict];
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"PerceivedStatus"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:3 withObject:newDict1];
    
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:4];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"PPDTestSecC_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:4 withObject:newDict];
    
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"PPDTestSecC_Status"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:4 withObject:newDict1];
    
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:5];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"PPDTestSecB_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:5 withObject:newDict];
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"PPDTestSecB_Status"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:5 withObject:newDict1];
    
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:6];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"PPDTestSecD_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:6 withObject:newDict];
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"PPDTestSecD_Status"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:6 withObject:newDict1];
    
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:7];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"PPDTestSecA_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:7 withObject:newDict];
    
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"PPDTestSecA_Status"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:7 withObject:newDict1];
    
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:8];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Voice_Test_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:8 withObject:newDict];
    
    
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"Voice_Test_Status"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:8 withObject:newDict1];
    
    
    
    if ([_nextpagestr isEqualToString:@"nextpage"])
    {
        _MenuBtnobj.hidden=YES;
    }
    
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    _Btn5obj.layer.cornerRadius=18;
    _Btn5obj.clipsToBounds=YES;
    self.contentviewobj.layer.cornerRadius=10;
    self.contentviewobj.clipsToBounds=YES;
    
    // Do any additional setup after loading the view from its nib.
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)NotatallBtnAction:(id)sender {
    
    //    PercievedViewController *BSV=[[PercievedViewController alloc]init];
    //    [BSV setBrief6str:@"brief6str"];
    //    [self.navigationController pushViewController:BSV animated:YES];
}

- (IBAction)Btn2Action:(id)sender {
    BriefstartViewController *LVC1=[[BriefstartViewController alloc]init];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on Briefstate test button "];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    [LVC1 setIdenstr:@"idenstr1"];
    [self.navigationController pushViewController:LVC1 animated:YES];
}

- (IBAction)Btn3Action:(id)sender {
    BriefstartViewController *LVC2=[[BriefstartViewController alloc]init];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on PHQ-9 test button "];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    [LVC2 setIdenstr:@"idenstr"];
    [self.navigationController pushViewController:LVC2 animated:YES];
}

- (IBAction)Btn4Action:(id)sender {
    BriefstartViewController *LVC3=[[BriefstartViewController alloc]init];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on perceived test button "];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    [LVC3 setIdenstr:@"PERCEIVED"];
    [self.navigationController pushViewController:LVC3 animated:YES];
}

- (IBAction)SkipBtnAction:(id)sender {
    //    PercievedViewController *BSV=[[PercievedViewController alloc]init];
    //    [BSV setBrief6str:@"brief6str"];
    //    [self.navigationController pushViewController:BSV animated:YES];
}

- (IBAction)Btn5Action:(id)sender {
    
    Bs3ViewController *LVC3=[[Bs3ViewController alloc]init];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on PPDTEST button "];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    //[LVC3 setIdenstr:@"PPDTEST"];
    [self.navigationController pushViewController:LVC3 animated:YES];
}
- (IBAction)HomeBtnAction:(id)sender {
    
    BS1ViewController *LVC3=[[BS1ViewController alloc]init];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on perceived test button"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    [self.navigationController pushViewController:LVC3 animated:YES];
}

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
            //[app.contactList removeObjectAtIndex:k];
            teststr11=[[responseDictionary valueForKey:@"data"] valueForKey:@"Test_Scoring_Status"];
            
            // imgarr=[[NSMutableArray alloc]initWithObjects:@"brief-state.png",@"brief-state.png",@"brief-state.png",@"brief-state.png",@"brief-state.png",@"brief-state.png",nil];
            
        }
        
    }
    
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
       
        cell.backlblobj.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
        cell.iconimg.hidden=NO;
        if ([[[testarray11 objectAtIndex:indexPath.row] valueForKey:@"is_Select1"] isEqual:@"1"]) {
            
            cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0];
            
        }
        else
        {
            
            
            cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:61.0/255.0 green:181.0/255.0 blue:230.0/255.0 alpha:1.0];
        }
    }
    else
    {
        
        cell.backlblobj.text=@"";
        
    }
    
    
    
    //      if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
    //
    //        check=true;
    //
    //          cell.listlblobj.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
    //
    //        // brief-state.png
    //         if ([[[testarray11 objectAtIndex:indexPath.row] valueForKey:@"is_Select1"] isEqual:@"1"])
    //        {
    //
    //
    //          cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0];
    //        }
    //        else
    //        {
    //            //   _iconimg2.image = [UIImage imageNamed:@"Perceived1.png"];
    //
    //             cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:61.0/255.0 green:181.0/255.0 blue:230.0/255.0 alpha:1.0];
    //        }
    //    }
    //    else
    //    {
    //
    //
    //        cell.listlblobj.text=@"";
    //
    //
    //    }
    //
    //
    //      if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
    //
    //         cell.listlblobj.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
    //        cell.iconimg.hidden=NO;
    //        if ([[[testarray11 objectAtIndex:indexPath.row] valueForKey:@"is_Select1"] isEqual:@"1"]) {
    //
    //            cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0];
    //        }
    //        else
    //        {
    //
    //        cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:61.0/255.0 green:181.0/255.0 blue:230.0/255.0 alpha:1.0];
    //
    //        }
    //    }
    //    else
    //    {
    //
    //        cell.listlblobj.text=@"";
    //
    //     }
    //
    //
    //
    //    if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
    //
    //        cell.listlblobj.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
    //        cell.iconimg.hidden=NO;
    //
    //        if ([[[testarray11 objectAtIndex:indexPath.row] valueForKey:@"is_Select1"] isEqual:@"1"]) {
    //
    //
    //         cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0];
    //        }
    //        else
    //        {
    //
    //             cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:61.0/255.0 green:181.0/255.0 blue:230.0/255.0 alpha:1.0];
    //        }
    //    }
    //    else
    //    {
    //
    //        cell.listlblobj.text=@"";
    //
    //     }
    //
    //
    //    if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
    //
    //
    //        cell.listlblobj.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
    //        cell.iconimg.hidden=NO;
    //
    //        if ([[[testarray11 objectAtIndex:indexPath.row] valueForKey:@"is_Select1"] isEqual:@"1"]) {
    //
    //           cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0];
    //        }
    //        else
    //        {
    //
    //            cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:61.0/255.0 green:181.0/255.0 blue:230.0/255.0 alpha:1.0];
    //
    //        }
    //    }
    //    else
    //    {
    //
    //        cell.listlblobj.text=@"";
    //
    //     }
    //
    //
    //
    //    if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
    //
    //
    //        cell.listlblobj.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
    //        cell.iconimg.hidden=NO;
    //        if ([[[testarray11 objectAtIndex:indexPath.row] valueForKey:@"is_Select1"] isEqual:@"1"])
    //        {
    //
    //
    // cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:12.0/255.0 green:223.0/255.0 blue:135.0/255.0 alpha:1.0];
    //        }
    //        else
    //        {
    //
    //             cell.backlblobj.backgroundColor=[[UIColor alloc] initWithRed:61.0/255.0 green:181.0/255.0 blue:230.0/255.0 alpha:1.0];
    //        }
    //    }
    //    else
    //    {
    //
    //
    //        cell.listlblobj.text=@"";
    //
    //      }
    
    
    
    
    // [cell.CircleBtnobj setTitle:[iconarr objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    // cell.iconimg.image = [UIImage imageNamed:[imgarr objectAtIndex:indexPath.row]];
    
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
    if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"ANXIETY TEST (GAD-7)"])
    {
        //        BriefstartViewController *LVC3=[[BriefstartViewController alloc]init];
        //        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
        //        [tracker set:kGAIScreenName value:@"click on perceived test button "];
        //        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
        //        [LVC3 setIdenstr:@"idenstr1"];
        //        [LVC3 setTeststr112:teststr11];
        //        [self.navigationController pushViewController:LVC3 animated:YES];
        
        
        BriefstateViewController *bsvc=[[BriefstateViewController alloc]init];
        [bsvc setIdentifystr:@"done1"];
        [self.navigationController pushViewController:bsvc animated:YES];
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"DEPRESSION (PHQ-9)"])
    {
        BriefstateQ1ViewController *bsvc=[[BriefstateQ1ViewController alloc]init];
        // [bsvc setIdentifystr:@"done1"];
        [self.navigationController pushViewController:bsvc animated:YES];
        
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"DEPRESSION (PHQ-2)"])
    {
        PHQ2ViewController *bsvc=[[PHQ2ViewController alloc]init];
        // [bsvc setIdentifystr:@"done1"];
        [self.navigationController pushViewController:bsvc animated:YES];
        
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"PERCEIVED STRESS TEST"])
    {
        PercievedViewController *bsvc=[[PercievedViewController alloc]init];
        // [bsvc setIdentifystr:@"done1"];
        [self.navigationController pushViewController:bsvc animated:YES];
        
    }
    
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"SELF ESTEEM"])
    {
        
        //       PPDTestDViewController *LVC3=[[PPDTestDViewController alloc]init];
        //       id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
        //       [tracker set:kGAIScreenName value:@"click on perceived test button "];
        //       [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
        //       //  [LVC3 setIdenstr:@"PERCEIVED"];
        //       [self.navigationController pushViewController:LVC3 animated:YES];
        
        PPDTestDViewController *LVC3=[[PPDTestDViewController alloc]init];
        //  [LVC3 setIdenstr:@"PERCEIVED"];
        [self.navigationController pushViewController:LVC3 animated:YES];
        
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"SOCIAL CONNECTEDNESS"])
    {
        //        PPDTestCViewController *LVC3=[[PPDTestCViewController alloc]init];
        //        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
        //        [tracker set:kGAIScreenName value:@"click on perceived test button "];
        //        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
        //        //  [LVC3 setIdenstr:@"PERCEIVED"];
        //        [self.navigationController pushViewController:LVC3 animated:YES];
        
        PPDTestCViewController *LVC3=[[PPDTestCViewController alloc]init];
        
        //  [LVC3 setIdenstr:@"PERCEIVED"];
        [self.navigationController pushViewController:LVC3 animated:YES];
        
        
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"RESILIENCY"])
    {
        
        //        PPDTestEViewController *LVC3=[[PPDTestEViewController alloc]init];
        //        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
        //        [tracker set:kGAIScreenName value:@"click on perceived test button"];
        //        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
        //        //  [LVC3 setIdenstr:@"PERCEIVED"];
        //        [self.navigationController pushViewController:LVC3 animated:YES];
        
        PPDTestEViewController *LVC3=[[PPDTestEViewController alloc]init];
        
        //  [LVC3 setIdenstr:@"PERCEIVED"];
        [self.navigationController pushViewController:LVC3 animated:YES];
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"EDINBURGH PPD"])
    {
        //        PPDTest1ViewController *LVC3=[[PPDTest1ViewController alloc]init];
        //        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
        //        [tracker set:kGAIScreenName value:@"click on perceived test button"];
        //        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
        //        //  [LVC3 setIdenstr:@"PERCEIVED"];
        //        [self.navigationController pushViewController:LVC3 animated:YES];
        
        PPDTest1ViewController *LVC3=[[PPDTest1ViewController alloc]init];
        //  [LVC3 setIdenstr:@"PERCEIVED"];
        [self.navigationController pushViewController:LVC3 animated:YES];
        
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"VOICE TEST"])
    {
        
        sectionAvoicetestViewController *LVC3=[[sectionAvoicetestViewController alloc]init];
        //        id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
        //        [tracker set:kGAIScreenName value:@"click on voice test button "];
        //        [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
        //  [LVC3 setIdenstr:@"PERCEIVED"];
        // [LVC3 setTeststr112:teststr11];
        [self.navigationController pushViewController:LVC3 animated:YES];
        
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"NUTRITION"])
    {
        
        DemoOtherViewController *LVC3=[[DemoOtherViewController alloc]init];
        [LVC3 setTypeString:arr1str];
        [self.navigationController pushViewController:LVC3 animated:YES];
        
    }
}


- (IBAction)closeBtnAction:(id)sender
{
    self.contentviewobj.hidden=YES;
}


- (IBAction)moreBtnAction:(id)sender
{
    self.contentviewobj.hidden=NO;
    
}





@end
