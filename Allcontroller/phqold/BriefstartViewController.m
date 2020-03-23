

#import "BriefstartViewController.h"
#import "BriefstateViewController.h"
#import "LeftViewController.h"
#import "BriefstateQ1ViewController.h"
#import "PercievedViewController.h"
#import "BS1ViewController.h"
#import "PPDTest1ViewController.h"
#import "PPDTestCViewController.h"
#import "PPDTestDViewController.h"
#import "PPDTestEViewController.h"
#import "MyWebserviceManager.h"

@interface BriefstartViewController ()
{
    NSString *teststr;
    NSString *notifystr;
}
@end

@implementation BriefstartViewController

-(void)viewWillAppear:(BOOL)animated
{
    [self callfetchprofile];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    _view2obj.hidden=YES;
    _view3obj.hidden=YES;
    _view1obj.hidden=NO;
    [self callfetchprofile];
    teststr=_teststr112;
    _letsstartbtnobj.layer.cornerRadius=23;
    _letsstartbtnobj.clipsToBounds=YES;
    if ([_idenstr isEqualToString:@"idenstr"])
    {
        _view1obj.hidden=YES;
        _view3obj.hidden=YES;
        _view2obj.hidden=NO;
    }
    if ([_idenstr isEqualToString:@"PERCEIVED"])
    {
        _view1obj.hidden=YES;
        _view2obj.hidden=YES;
        _view3obj.hidden=NO;
    }
    
    if ([_idenstr isEqualToString:@"test1str"])
    {
        _view1obj.hidden=YES;
        _view3obj.hidden=YES;
        _view2obj.hidden=NO;
        _testlblobj.text=@"SELF ESTEEM";
    }
    
    if ([_idenstr isEqualToString:@"test2str"])
    {
        _view1obj.hidden=YES;
        _view3obj.hidden=YES;
        _view2obj.hidden=NO;
        _testlblobj.text=@"SOCIAL CONNECTEDNESS";
    }
    
    if ([_idenstr isEqualToString:@"test3str"])
    {
        _view1obj.hidden=YES;
        _view3obj.hidden=YES;
        _view2obj.hidden=NO;
        _testlblobj.text=@"RESILIENCY";
    }
    if ([_idenstr isEqualToString:@"test4str"])
    {
        _view1obj.hidden=YES;
        _view3obj.hidden=YES;
        _view2obj.hidden=NO;
        _testlblobj.text=@"EDINBURGH PPD";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        notifystr=@"2";
        NSLog(@"You have clicked Cancel");
        [self calltestnotify];
    }
    else if(buttonIndex == 1)
    {
        notifystr=@"1";
        [self calltestnotify];
    }
}

- (IBAction)LetsstartbtnAction:(id)sender {
    
    if ([teststr isEqual:@"0"])
    {
        UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Do you want to share your test results with your Inner Circle?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alertcrp addButtonWithTitle:@"Ok"];
        [alertcrp show];
    }
    else if([teststr integerValue]==1)
    {
        [self calltestscore];
    }
    else if([teststr integerValue]==2)
    {
        [self calltestscore];
    }
    else
    {
        [self calltestscore];
    }
}

-(void)calltestscore
{
    if ([_idenstr isEqualToString:@"idenstr"])
    {
        BriefstateQ1ViewController *bsvc=[[BriefstateQ1ViewController alloc]init];
        [self.navigationController pushViewController:bsvc animated:YES];
    }
    else if ([_idenstr isEqualToString:@"PERCEIVED"])
    {
        PercievedViewController *bsvc=[[PercievedViewController alloc]init];
        [self.navigationController pushViewController:bsvc animated:YES];
    }
    else if ([_idenstr isEqualToString:@"test1str"])
    {
        PPDTestDViewController *LVC3=[[PPDTestDViewController alloc]init];
        [self.navigationController pushViewController:LVC3 animated:YES];
    }
    else if ([_idenstr isEqualToString:@"test2str"])
    {
        PPDTestCViewController *LVC3=[[PPDTestCViewController alloc]init];
        [self.navigationController pushViewController:LVC3 animated:YES];
    }
    else if ([_idenstr isEqualToString:@"test3str"])
    {
        PPDTestEViewController *LVC3=[[PPDTestEViewController alloc]init];
        [self.navigationController pushViewController:LVC3 animated:YES];
    }
    else if ([_idenstr isEqualToString:@"test4str"])
    {
        PPDTest1ViewController *LVC3=[[PPDTest1ViewController alloc]init];
        [self.navigationController pushViewController:LVC3 animated:YES];
    }
    else
    {
        BriefstateViewController *bsvc=[[BriefstateViewController alloc]init];
        [bsvc setIdentifystr:@"done1"];
        [self.navigationController pushViewController:bsvc animated:YES];
    }
}

- (IBAction)BackbtnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)calltestnotify
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"TestALertNotify" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:notifystr forKey:@"status"];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"TestALertNotify" :dict :dict1];
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
            teststr=[[responseDictionary valueForKey:@"data"] valueForKey:@"Test_Scoring_Status"];
            
            // [self calltestnotify];
            // imgarr=[[NSMutableArray alloc]initWithObjects:@"brief-state.png",@"brief-state.png",@"brief-state.png",@"brief-state.png",@"brief-state.png",@"brief-state.png",nil];
            
        }
        
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TestALertNotify"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            if ([_idenstr isEqualToString:@"idenstr"])
            {
                
                BriefstateQ1ViewController *bsvc=[[BriefstateQ1ViewController alloc]init];
                // [bsvc setIdentifystr:@"done1"];
                [self.navigationController pushViewController:bsvc animated:YES];
            }
            else if ([_idenstr isEqualToString:@"PERCEIVED"])
            {
                PercievedViewController *bsvc=[[PercievedViewController alloc]init];
                // [bsvc setIdentifystr:@"done1"];
                [self.navigationController pushViewController:bsvc animated:YES];
            }
            
            else if ([_idenstr isEqualToString:@"test1str"])
            {
                PPDTestDViewController *LVC3=[[PPDTestDViewController alloc]init];
                
                //  [LVC3 setIdenstr:@"PERCEIVED"];
                [self.navigationController pushViewController:LVC3 animated:YES];
                
            }
            
            else if ([_idenstr isEqualToString:@"test2str"])
            {
                PPDTestCViewController *LVC3=[[PPDTestCViewController alloc]init];
                
                //  [LVC3 setIdenstr:@"PERCEIVED"];
                [self.navigationController pushViewController:LVC3 animated:YES];
                
            }
            
            
            else if ([_idenstr isEqualToString:@"test3str"])
            {
                PPDTestEViewController *LVC3=[[PPDTestEViewController alloc]init];
                
                //  [LVC3 setIdenstr:@"PERCEIVED"];
                [self.navigationController pushViewController:LVC3 animated:YES];
                
            }
            
            else if ([_idenstr isEqualToString:@"test4str"])
            {
                PPDTest1ViewController *LVC3=[[PPDTest1ViewController alloc]init];
                
                //  [LVC3 setIdenstr:@"PERCEIVED"];
                [self.navigationController pushViewController:LVC3 animated:YES];
                
            }
            
            
            else
            {
                
                BriefstateViewController *bsvc=[[BriefstateViewController alloc]init];
                [bsvc setIdentifystr:@"done1"];
                [self.navigationController pushViewController:bsvc animated:YES];
            }
            
            
        }
        
    }
}

@end
