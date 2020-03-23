

#import "TestlistViewController.h"
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
#import "sectionAvoicetestViewController.h"
#import "BriefstateViewController.h"
#import "BS1ViewController.h"
#import "DemoOtherViewController.h"
#import "TestListTableViewCell.h"
#import "GraphView.h"
#import "GraphView1.h"
#import "chattypeViewController.h"
#import "smilepage1ViewController.h"
#import "Sisuroot-Swift.h"
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
    NSMutableArray *img_array;
    NSMutableArray *arr1;
     int i;
    int j;
     int count;
    NSString *arr2str;
    NSString *arr1str;
    int n1;
    int n2;
    NSString *voicestrA;
    NSString *voicestrB;
    NSString *voicestrC;
    NSString *voicestatusstr;
}
@end

@implementation TestlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
       graphView.backgroundColor = [UIColor clearColor];
       
       GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
          graphView1.backgroundColor = [UIColor clearColor];
       
       
          [self.view_footer1 addSubview:graphView];
       [self.view_footer2 addSubview:graphView1];
       
    
     [FIRAnalytics setScreenName:@"Test" screenClass:@"Test"];
    voicestrA= [[NSUserDefaults standardUserDefaults]valueForKey:@"Voice_Test_StatusA"];
    voicestrB= [[NSUserDefaults standardUserDefaults]valueForKey:@"Voice_Test_StatusB"];
    voicestrC= [[NSUserDefaults standardUserDefaults]valueForKey:@"Voice_Test_StatusC"];
    if ([voicestrA integerValue]==1 && [voicestrB integerValue]==1 && [voicestrC integerValue]==1)
    {
        voicestatusstr=@"1";
    }
    else
    {
        voicestatusstr=@"0";
    }
    //  [self callfetchprofile];
    self.navigationController.navigationBar.hidden=YES;
    self.contentviewobj.hidden=YES;
    _readbuttonobj.layer.cornerRadius=10;
    _readbuttonobj.clipsToBounds=YES;
    
    arr2=[[NSMutableArray alloc]initWithObjects:@"Quiz1"
          ,@"Quiz2",@"Quiz3",@"Quiz4",@"Quiz5"
          ,nil];
    img_array=[[NSMutableArray alloc]initWithObjects:@"Group 240.png"
             ,@"Group 242.png",@"Group 242.png",@"Group 240.png",@"Group 242.png",@"Group 239.png",@"Group 242.png",@"Group 239.png",@"Group 18621.png",@"Group 18619.png",nil];
    
    int count = [arr2 count];
    for (int i = 0; i < count; ++i) {
        int nElements = count - i;
        n2 = (arc4random() % nElements) + i;
        [arr2 exchangeObjectAtIndex:i withObjectAtIndex:n2];
    }
    arr1str=[arr2 objectAtIndex:0];
    testarray1=[[NSMutableArray alloc]initWithObjects:
                @{@"value":@"ANXIETY", @"is_Select":@"0"},
                @{@"value":@"DEPRESSION ", @"is_Select":@"0"},
                @{@"value":@"DEPRESSION (PHQ-2)", @"is_Select":@"0"},
                @{@"value":@"PERCEIVED STRESS TEST", @"is_Select":@"0"},
                @{@"value":@"SELF ESTEEM", @"is_Select":@"0"},
                @{@"value":@"SOCIAL CONNECTEDNESS", @"is_Select":@"0"},
                @{@"value":@"RESILIENCY", @"is_Select":@"0"},
                @{@"value":@"EDINBURGH PPD", @"is_Select":@"0"},
                @{@"value":@"VOICE TEST", @"is_Select":@"0"},
                @{@"value":@"NUTRITION", @"is_Select":@"0"},nil];
    
    testarray11=[[NSMutableArray alloc]initWithObjects:
                 @{@"value":@"ANXIETY", @"is_Select1":@"0"},
                 @{@"value":@"DEPRESSION", @"is_Select1":@"0"},
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
    [newDict1 setObject:voicestatusstr forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:8 withObject:newDict1];
    
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:9];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"nutrition_Test_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:9 withObject:newDict];
 
    newDict1 = [[NSMutableDictionary alloc] init];
    [newDict1 addEntriesFromDictionary:oldDict];
    [newDict1 setObject:[listarr valueForKey:@"nutrition_status"] forKey:@"is_Select1"];
    [testarray11 replaceObjectAtIndex:9 withObject:newDict1];
    
    
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
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    
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
   // [FIRAnalytics setScreenName:@"Briefstate test" screenClass:@"Briefstate test"];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"click on Briefstate test button "];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    [LVC1 setIdenstr:@"idenstr1"];
    [self.navigationController pushViewController:LVC1 animated:YES];
}

- (IBAction)Btn3Action:(id)sender {
    BriefstartViewController *LVC2=[[BriefstartViewController alloc]init];
    //[FIRAnalytics setScreenName:@"PHQ-9 test" screenClass:@"PHQ-9 test"];
    
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
   // [FIRAnalytics setScreenName:@"perceived test" screenClass:@"perceived test"];
    
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

-(void) processFailed :(NSError *)responseDictionary
{
    NSLog(@"error");
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
    TestListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewCell"];
        if (cell == nil)
        {
            NSArray *arry = [[NSBundle mainBundle] loadNibNamed:@"TestListTableViewCell" owner:self options:nil];
            cell = [arry objectAtIndex:0];
        }
     cell.img_back.image = [UIImage imageNamed:img_array[indexPath.row]];
   //  cell.img_back.frame = CGRectMake(0, 0, self.view.frame.size.width, 130);
     if (indexPath.row==2) {
            if([[listarr valueForKey:@"phq2_status_remind"]isEqualToString:@"1"])
            {
                if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
                     cell.lbl_header.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
                 }
                else
                {
                  cell.lbl_header.text=@"";
                    cell.img_next.hidden=YES;
                }
            }
        }
    else
        {
            if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
                cell.lbl_header.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
            }
            else
            {
                cell.lbl_header.text=@"";
                cell.img_next.hidden=YES;
            }
       }
       return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float heightForRow = 150;
    if(indexPath.row==2)
    {
        if([[listarr valueForKey:@"phq2_status_remind"]isEqualToString:@"1"])
        {
            if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
                    return heightForRow;
                }
                else
                {
                    return 0;
                }
        }
        else
        {
             return 0;

        }
    }
    else
    {
        if([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"])
        {
            return heightForRow;
        }
        else {
            return 0;
    }
    }
}

- (IBAction)btnhome:(id)sender {
     FeedViewController *VC1=[[FeedViewController alloc]init];
        [self.navigationController pushViewController:VC1 animated:YES];
    }
- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)btnchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
       [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)btnfaq:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"ANXIETY"])
    {
       
        BriefstateViewController *bsvc=[[BriefstateViewController alloc]init];
        [bsvc setIdentifystr:@"done1"];
        [self.navigationController pushViewController:bsvc animated:YES];
    }
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"DEPRESSION "])
    {
        BriefstateQ1ViewController *bsvc=[[BriefstateQ1ViewController alloc]init];
        [self.navigationController pushViewController:bsvc animated:YES];

    }
    //else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"DEPRESSION "])
    //{
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"DEPRESSION (PHQ-2)"])
        {
        PHQ2ViewController *bsvc=[[PHQ2ViewController alloc]init];
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
           PPDTestDViewController *LVC3=[[PPDTestDViewController alloc]init];
           [self.navigationController pushViewController:LVC3 animated:YES];
           
       }
       else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"SOCIAL CONNECTEDNESS"])
       {
            PPDTestCViewController *LVC3=[[PPDTestCViewController alloc]init];
           [self.navigationController pushViewController:LVC3 animated:YES];
           
           
       }
       else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"RESILIENCY"])
       {
          PPDTestEViewController *LVC3=[[PPDTestEViewController alloc]init];
         [self.navigationController pushViewController:LVC3 animated:YES];
       }
       else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"EDINBURGH PPD"])
       {
            PPDTest1ViewController *LVC3=[[PPDTest1ViewController alloc]init];
           [self.navigationController pushViewController:LVC3 animated:YES];
           
       }
       else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"VOICE TEST"])
       {
           sectionAvoicetestViewController *LVC3=[[sectionAvoicetestViewController alloc]init];
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
