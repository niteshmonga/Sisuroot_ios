#import "PHQ8ViewController.h"
#import "FeedViewController.h"
#import "DemoOtherViewController.h"
#import "Bs2ViewController.h"
#import "SWRevealViewController.h"
#import "MyWebserviceManager.h"
#import "PHQ8Cell.h"
#import "BS1ViewController.h"

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
    NSMutableArray *testicon;
    NSMutableArray *testarray11;
    NSString *teststr11;
}
@end

@implementation PHQ8ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self callfetchprofile];
    
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationController.navigationBar.hidden=YES;
     testarray1=[[NSMutableArray alloc]initWithObjects:
                @{@"value":@"Demographic Form.", @"is_Select":@"0"},
                @{@"value":@"Demographic Form Therapy", @"is_Select":@"0"},
                @{@"value":@"Demographic Form", @"is_Select":@"0"},
                @{@"value":@"Demographic Form PPD", @"is_Select":@"0"},
                @{@"value":@"Dietary info form", @"is_Select":@"0"},nil];
    testarray11=[[NSMutableArray alloc]initWithObjects:
                 @{@"value":@"Demographic Form", @"is_Select1":@"0"},
                 @{@"value":@"Demographic Form Therapy", @"is_Select1":@"0"},
                 @{@"value":@"Demographic Form Teens", @"is_Select1":@"0"},
                 @{@"value":@"Demographic Form PPD", @"is_Select1":@"0"},nil];
    testicon=[[NSMutableArray alloc]initWithObjects:
   @"form@2x.png",@"form@2x.png",@"form@2x.png",@"form@2x.png",@"no-egg@2x.png",nil];
    
       is_Select=0;
      NSArray *listarr14=_listarray12;
    
    listarr=[[NSMutableArray alloc]init];
    listarr=[listarr14 mutableCopy];
    
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc] init];
   NSDictionary *oldDict = [[NSDictionary alloc] init];
    
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:0];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Demographic_Form_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:0 withObject:newDict];
   newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:1];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Demograpic_form2_group_status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:1 withObject:newDict];
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:2];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Demograpic_form3_group_status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:2 withObject:newDict];
    
 
    
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:3];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Demograpic_form4_group_status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:3 withObject:newDict];
    newDict = [[NSMutableDictionary alloc] init];
    oldDict = (NSDictionary *)[testarray1 objectAtIndex:4];
    [newDict addEntriesFromDictionary:oldDict];
    [newDict setObject:[listarr valueForKey:@"Dietary_Info_Group_Status"] forKey:@"is_Select"];
    [testarray1 replaceObjectAtIndex:4 withObject:newDict];
 }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    }



//-(void)callfetchprofile
//{
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"getProfileInfo" forKey:@"name"];
//
//    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
//     [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
//
//}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
        }
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
    NSLog(@"error");
}

 - (IBAction)HomeBtnAction:(id)sender {
   BS1ViewController *Tvc=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:Tvc animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return testarray1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"ListtableView";
    
    PHQ8Cell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PHQ8Cell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
        
    }
   if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"]) {
         cell.backlblobj.text=[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"];
         cell.backlblobj.layer.shadowColor = [UIColor blackColor].CGColor;
         cell.backlblobj.layer.shadowOffset = CGSizeMake(0, 3.0f);
         cell.backlblobj.layer.shadowOpacity = 1.0f;
         cell.backlblobj.layer.shadowRadius = 0.0f;
         cell.backlblobj.layer.masksToBounds = YES;
         cell.backlblobj.layer.cornerRadius = 15;
         cell.iconm.image = [UIImage imageNamed:[testicon objectAtIndex:indexPath.row]];
         cell.iconimg.hidden=NO;
    }
    else
    {
         cell.backlblobj.text=@"";
        cell.iconimg.hidden=YES;
        cell.iconm.hidden=YES;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float heightForRow = 115;
    if([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"is_Select"] isEqual:@"0"])
    {
        return heightForRow;
    }
    else {
        return 0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"Demographic Form."])
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
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"Demographic Form"])
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
    else if ([[[testarray1 objectAtIndex:indexPath.row] valueForKey:@"value"] isEqualToString:@"Dietary info form"])
    {
        DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
        [BSV setTypeString:@"demo4"];
        [self.navigationController pushViewController:BSV animated:YES];
    }
}
@end
