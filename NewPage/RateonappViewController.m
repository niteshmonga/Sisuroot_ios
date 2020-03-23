
#import "ListTableViewCell.h"
#import "RateonappViewController.h"
#import "SettingViewController.h"
#import "SWRevealViewController.h"
#import "EditViewController.h"
#import "Base64.h"
#import "UIView+RNActivityView.h"
#import "MyWebserviceManager.h"
#import "BS1ViewController.h"
#import "SelectAccountViewController.h"
#import "UIImageView+WebCache.h"
#import "FriendsViewController.h"
#import "FeedViewController.h"
#import "chattypeViewController.h"
#import "smilepage1ViewController.h"
#import "GraphView.h"
#import "GraphView1.h"
#import "Sisuroot-Swift.h"
#import "rateonappTableViewCell.h"
#import "ChangePasswordViewController.h"
@interface RateonappViewController ()
@end
@implementation RateonappViewController



-(void)viewDidAppear:(BOOL)animated
{
    [SKStoreReviewController requestReview];
}
- (IBAction)writereview:(id)sender {
    NSURL *producturl = [NSURL URLWithString:@"https://itunes.apple.com/app/1459535994?action=write-review"];
    [[UIApplication sharedApplication]openURL:producturl];
}

- (void)viewDidLoad {
    _view_more.hidden=YES;
    [self.view showActivityViewWithLabel:@"Loading"];
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
    revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    [_btnmenuobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [self callTaglist1];
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tbfooter.frame.size.height, _tbfooter.frame.size.height)];
    graphView.backgroundColor = [UIColor clearColor];
    GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tbfooter.frame.size.height, _tbfooter.frame.size.height)];
    graphView1.backgroundColor = [UIColor clearColor];
    [self.viewfooter1 addSubview:graphView];
    [self.viewfoter2 addSubview:graphView1];
    _viewmoredata.layer.cornerRadius=10;
    _viewmoredata.clipsToBounds=YES;
    _btn_cancel_more.layer.cornerRadius=5;
    _btn_cancel_more.clipsToBounds=YES;
    _btn_cancel_more.layer.borderWidth=1;
    _btn_cancel_more.layer.borderColor=[UIColor whiteColor].CGColor ;
    [FIRAnalytics setScreenName:@"RateonApp" screenClass:@"RateonApp"];
    _btnmenuobj.hidden=YES;
      self.navigationController.navigationBar.hidden=YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)callTaglist1
{
   NSHTTPURLResponse *response = nil;
   NSString *jsonUrlString = [NSString stringWithFormat:@"https://itunes.apple.com/us/rss/customerreviews/id=1459535994/sortBy=mostRecent/json?l=fr"];
   //NSString *jsonUrlString = [NSString stringWithFormat:@"https://itunes.apple.com/us/rss/customerreviews/id=571800810/sortBy=mostRecent/json?l=fr"];
   NSURL *url = [NSURL URLWithString:[jsonUrlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
   //-- Get request and response though URL
   NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
   NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
   //-- JSON Parsing
   NSMutableArray *result = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
   arrdata=[[NSMutableArray alloc]initWithArray:[[result valueForKey:@"feed"] valueForKey:@"entry"]];
   NSLog(@"Result = %@",result);
      [self.view hideActivityView];
}

-(void)MoreAction : (UIButton *) btn {
    _lblmoredata.text = [[[arrdata objectAtIndex:btn.tag]valueForKey:@"content"]valueForKey:@"label"];
    _lblmoredata.numberOfLines = 0;
    CGSize maximumLabelSize = CGSizeMake(280, 9999);
    CGSize expectedLabelSize = [_lblmoredata sizeThatFits:maximumLabelSize];
    CGRect newFrame = _lblmoredata.frame;
    newFrame.size.height = expectedLabelSize.height+10;
    _lblmoredata.frame = newFrame;
     _scrollview.delegate=self;
    _scrollview.contentSize=CGSizeMake(0, self.lblmoredata.frame.size.height);
    _view_more.hidden=NO;
}
- (IBAction)morecancel:(id)sender {
    _view_more.hidden=YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"RATEONAPP";
    
    rateonappTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"rateonappTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    cell.USERNAME.text=[[[[arrdata objectAtIndex:indexPath.row]valueForKey:@"author"] valueForKey:@"name"] valueForKey:@"label"];
    cell.TIME.text=[[[arrdata objectAtIndex:indexPath.row]valueForKey:@"title"]valueForKey:@"label"];
    cell.COMMENTS.text=[[[arrdata objectAtIndex:indexPath.row]valueForKey:@"content"]valueForKey:@"label"];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
     cell.btnmore.tag = indexPath.row;
       [cell.btnmore addTarget:self action:@selector(MoreAction:) forControlEvents:UIControlEventTouchUpInside];

    
    NSString *rating=[[[arrdata objectAtIndex:indexPath.row]valueForKey:@"im:rating"]valueForKey:@"label"];
    if([rating isEqualToString:@"5"])
    {
        cell.BTN1.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN2.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN3.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN4.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN5.imageView.image=[UIImage imageNamed:@"goldenstar"];
        
        
    }
    else   if([rating isEqualToString:@"4"])
      {
          cell.BTN1.imageView.image=[UIImage imageNamed:@"goldenstar"];
          cell.BTN2.imageView.image=[UIImage imageNamed:@"goldenstar"];
          cell.BTN3.imageView.image=[UIImage imageNamed:@"goldenstar"];
          cell.BTN4.imageView.image=[UIImage imageNamed:@"goldenstar"];
          cell.BTN5.imageView.image=[UIImage imageNamed:@"gaystar"];
      }
    
    else   if([rating isEqualToString:@"3"])
    {
        cell.BTN1.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN2.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN3.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN4.imageView.image=[UIImage imageNamed:@"gaystar"];
        cell.BTN5.imageView.image=[UIImage imageNamed:@"gaystar"];
    }
    
    else   if([rating isEqualToString:@"2"])
    {
        cell.BTN1.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN2.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN3.imageView.image=[UIImage imageNamed:@"gaystar"];
        cell.BTN4.imageView.image=[UIImage imageNamed:@"gaystar"];
        cell.BTN5.imageView.image=[UIImage imageNamed:@"gaystar"];
    }
    else   if([rating isEqualToString:@"1"])
    {
        cell.BTN1.imageView.image=[UIImage imageNamed:@"goldenstar"];
        cell.BTN2.imageView.image=[UIImage imageNamed:@"gaystar"];
        cell.BTN3.imageView.image=[UIImage imageNamed:@"gaystar"];
        cell.BTN4.imageView.image=[UIImage imageNamed:@"gaystar"];
        cell.BTN5.imageView.image=[UIImage imageNamed:@"gaystar"];
    }
    else
    {
        cell.BTN1.imageView.image=[UIImage imageNamed:@"gaystar"];
        cell.BTN2.imageView.image=[UIImage imageNamed:@"gaystar"];
        cell.BTN3.imageView.image=[UIImage imageNamed:@"gaystar"];
       cell.BTN4.imageView.image=[UIImage imageNamed:@"gaystar"];
       cell.BTN5.imageView.image=[UIImage imageNamed:@"gaystar"];
    }
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 195;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrdata.count;
}

-(void) processFailed :(NSError *)responseDictionary
{
   NSLog(@"error");
}


- (IBAction)btnhome:(id)sender {
    FeedViewController *VC1=[[FeedViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)btnchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
      [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btqa:(id)sender {
    smilepage1ViewController *FVC=[[smilepage1ViewController alloc]init];
           [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)btn_sos:(id)sender {
  BS1ViewController *BSVC=[[BS1ViewController alloc]init];
       [self.navigationController pushViewController:BSVC animated:YES];

}
- (IBAction)btn_back:(id)sender {
     FeedViewController *gvc=[[FeedViewController alloc]init];
             [self.navigationController pushViewController:gvc animated:YES];
}


@end
