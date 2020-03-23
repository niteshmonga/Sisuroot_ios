#import "FeedViewController.h"
#import "ListTableViewCell.h"
#import "EmotionCollectionViewCell.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
#import "MyWebserviceManager.h"
#import "Base64.h"
#import "ViewController.h"
#import "SWRevealViewController.h"
#import "UIView+RNActivityView.h"
#import "ChatViewController.h"
#import "ChatfriendViewController.h"
#import "ResponseViewController.h"
#import "BS1ViewController.h"
#import <sys/utsname.h>
#import "Reachability.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "SCLAlertView.h"
#import "smilepage1ViewController.h"
#import "GraphView.h"
#import "chattypeViewController.h"
#import "GraphView1.h"
#import "feedCollectionViewCell.h"
#import "LoginViewController.h"
#import "feedprivateTableViewCell.h"
#import "FeedTagViewController.h"
#import "Sisuroot-Swift.h"

@interface FeedViewController ()
{
    BOOL check;
    NSMutableArray *innerdata;
     NSMutableArray *outerdata;
     NSMutableArray *bothdata;
    NSMutableArray *publicdata;
    NSMutableDictionary *alldata;
}

@end
#define maxIdleTime 60.0

@implementation FeedViewController
#pragma mark -
#pragma mark Handling idle timeout

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}
-(void)callfetchprofile
{
     [self.view showActivityViewWithLabel:@"Loading"];
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
    
}

-(void)detectSwipe:(UISwipeGestureRecognizer *)recognizer {
    _topview.hidden= YES;
}




-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
  {
      return 1;
  }

-(void)ShowTimeMessage
{
    // For calculating the current date
    NSDate *date = [NSDate date];

    // Make Date Formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh a EEEE"];

    // hh for hour mm for minutes and a will show you AM or PM
    NSString *str = [dateFormatter stringFromDate:date];
    // NSLog(@"%@", str);

    // Sperate str by space i.e. you will get time and AM/PM at index 0 and 1 respectively
    NSArray *array = [str componentsSeparatedByString:@" "];

    // Now you can check it by 12. If < 12 means Its morning > 12 means its evening or night

    NSString *message;
    NSString *timeInHour;
    NSString *am_pm;

    NSString *DayOfWeek;
    if (array.count>2)
    {
        // am pm case
        timeInHour = array[0];
        am_pm = array[1];
        DayOfWeek  = array[2];
    }
    else if (array.count>1)
    {
        // 24 hours case
        timeInHour = array[0];
        DayOfWeek = array[1];
    }

    if (am_pm)
    {

        if ([timeInHour integerValue]>=4 && [timeInHour integerValue]<=9 && [am_pm isEqualToString:@"AM"])
        {
            message = [NSString stringWithFormat:@"Morning"];
                    }
        else if (([timeInHour integerValue]>=10 && [timeInHour integerValue]!=12 && [am_pm isEqualToString:@"AM"]) || (([timeInHour integerValue]<4 || [timeInHour integerValue]==12) && [am_pm isEqualToString:@"PM"]))
        {
            message = [NSString stringWithFormat:@"Afternoon"];
                    }
        else if ([timeInHour integerValue]>=4 && [timeInHour integerValue]<=9 && [am_pm isEqualToString:@"PM"])
        {
            message = [NSString stringWithFormat:@"Evening"];

        }
        else if (([timeInHour integerValue]>=10 && [timeInHour integerValue]!=12 && [am_pm isEqualToString:@"PM"]) || (([timeInHour integerValue]<4 || [timeInHour integerValue]==12) && [am_pm isEqualToString:@"AM"]))
        {
            message = [NSString stringWithFormat:@"Night"];
        }

    }
    else
    {
        if ([timeInHour integerValue]>=4 && [timeInHour integerValue]<10)
        {
            message = [NSString stringWithFormat:@"Morning"];
        }
        else if ([timeInHour integerValue]>=10 && [timeInHour integerValue]<16)
        {
            message = [NSString stringWithFormat:@"Afternoon"];
        }
        else if ([timeInHour integerValue]>=16 && [timeInHour integerValue]<22)
        {
            message = [NSString stringWithFormat:@"Evening"];
        }
        else
        {
           message = [NSString stringWithFormat:@"Night"];
        }
    }
    if (DayOfWeek)
    {
        _timeLbl.text=[NSString stringWithFormat:@"Good %@",message];
    }
}

- (void)viewDidLoad {
     _topview.hidden= NO;
    [self ShowTimeMessage];
    _scrollview.delegate=self;
    _scrollview.contentSize=CGSizeMake(0, self.collect_both.frame.origin.y+self.collect_both.frame.size.height+30);
       
    
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] isEqual:@""])
        {
            LoginViewController *frontViewController=[[LoginViewController alloc]init];
            [self.navigationController pushViewController:frontViewController animated:YES];
        }
        else
        {
           [self callfetchprofile];
           [self callTaglist];
        }
    _collect_pub.delegate=self;
     _collect_inner.delegate=self;
     _collect_both.delegate=self;
     _collect_outer.delegate=self;
     _collect_outer.dataSource=self;
    _collect_both.dataSource=self;
    _collect_inner.dataSource=self;
    _collect_pub.dataSource=self;
    UISwipeGestureRecognizer  *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(detectSwipe:)];
    [swipeGesture setNumberOfTouchesRequired:1];
    [swipeGesture setDirection: UISwipeGestureRecognizerDirectionUp];
    [_topview addGestureRecognizer:swipeGesture];
    [_collect_pub registerNib:[UINib nibWithNibName:@"feedCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    [_collect_outer registerNib:[UINib nibWithNibName:@"feedCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    [_collect_both registerNib:[UINib nibWithNibName:@"feedCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    [_collect_inner registerNib:[UINib nibWithNibName:@"feedCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    
    _timeLbl.layer.shadowColor = [UIColor whiteColor].CGColor;
            _timeLbl.layer.shadowOffset = CGSizeMake(0, 1.0f);
            _timeLbl.layer.shadowOpacity = 1.0f;
            _timeLbl.layer.shadowRadius = 0.0f;
           
    
    
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
    graphView.backgroundColor = [UIColor clearColor];
    GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
    graphView1.backgroundColor = [UIColor clearColor];
    [self.view_footer1 addSubview:graphView];
    [self.view_footer2 addSubview:graphView1];
    check=NO;
    [FIRAnalytics setScreenName:@"HomeView" screenClass:@"HomeView"];
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    _Nointernetviewobj.hidden=YES;
    [self callnetconnection];
     _indicatorviewobj.hidden=YES;
    _indicatorviewobj.layer.cornerRadius=10;
    _indicatorviewobj.clipsToBounds=YES;
    _swipeup.layer.cornerRadius=5;
    _swipeup.clipsToBounds=YES;
    _FrndResnotificationlblobj.layer.cornerRadius=10;
    _FrndResnotificationlblobj.clipsToBounds=YES;
    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    _usernamestr=[[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
     [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    [ _MenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
   // [self.view hideActivityView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
     UICollectionReusableView *sectionHeaderView = nil;

        sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, _collect_inner.frame.size.width, 50)];
        sectionHeaderView.backgroundColor = UIColor.clearColor;
        UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(30,7,36,36)];
        [sectionHeaderView addSubview:dot];
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:
                                CGRectMake(70,10,100,30)];
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.textColor = UIColor.whiteColor;
        headerLabel.textAlignment = NSTextAlignmentLeft;
         headerLabel.font= [UIFont systemFontOfSize:16.0f];
        [sectionHeaderView addSubview:headerLabel];
        UILabel *headerLabel1 = [[UILabel alloc] initWithFrame:
                                  CGRectMake(180,24,_collect_inner.frame.size.width-230,1)];
        headerLabel1.backgroundColor = [UIColor whiteColor];
        [sectionHeaderView addSubview:headerLabel1];

    if(collectionView == _collect_inner)
      {
            headerLabel.text = @"Inner Circle";
            dot.image=[UIImage imageNamed:@"Group 372.png"];
      }
      else if(collectionView == _collect_outer)
      {
          headerLabel.text = @"Outer Circle";
          dot.image=[UIImage imageNamed:@"Group 374.png"];
      }
      else if(collectionView == _collect_both)
      {
         headerLabel.text = @"Both Circle";
          dot.image=[UIImage imageNamed:@"Group 373.png"];
      }
        return sectionHeaderView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(collectionView == _collect_pub)
    {
        return publicdata.count;
    }
    else if(collectionView == _collect_inner)
    {
        return innerdata.count;
    }
    else if(collectionView == _collect_outer)
    {
        return outerdata.count;
    }
    else if(collectionView == _collect_both)
    {
        return bothdata.count;
    }
    else
    {
        return 3;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(146, 195);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"FirstCollectionViewCell";
             feedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if(collectionView ==_collect_pub)
    {
        
         cell.taglabel.text= [[publicdata objectAtIndex:indexPath.row] valueForKey:@"username"];
         [cell.tagimage setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[publicdata objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
    }
    else if(collectionView == _collect_inner)
       {
             
            cell.taglabel.text= [[innerdata objectAtIndex:indexPath.row] valueForKey:@"username"];
            [cell.tagimage setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[innerdata objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
       }
       else if(collectionView == _collect_outer)
       {
             
            cell.taglabel.text= [[outerdata objectAtIndex:indexPath.row] valueForKey:@"username"];
            [cell.tagimage setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[outerdata objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
       }
       else if(collectionView == _collect_both)
       {
              
            cell.taglabel.text= [[bothdata objectAtIndex:indexPath.row] valueForKey:@"username"];
            [cell.tagimage setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[bothdata objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
       }
    
    cell.tagimage.contentMode=UIViewContentModeScaleToFill;
    cell.tagimage.layer.cornerRadius= 20;
          return cell;
      
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        FeedTagViewController *VC1=[[FeedTagViewController alloc]init];
       [self.navigationController pushViewController:VC1 animated:YES];
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
// Layout: Set Edges
- (UIEdgeInsets)collectionView: (UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
}

-(void)callTaglist
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"feedListing" forKey:@"name"];

    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
     //[dict1 setValue:@"403" forKey:@"id"];
  [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"feed-listing" :dict :dict1];

}
-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"feedListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"All tags listing"])
            {
               alldata = [[NSMutableDictionary alloc]init];
               [alldata setDictionary:[responseDictionary valueForKey:@"data"]];
               publicdata =[[NSMutableArray alloc]initWithArray:[[responseDictionary valueForKey:@"data"] valueForKey:@"public_data"]];
               innerdata = [[alldata valueForKey:@"private_data"] objectForKey:@"inner_data"];
                 outerdata = [[alldata valueForKey:@"private_data"] objectForKey:@"outer_data"];
                 bothdata = [[alldata valueForKey:@"private_data"] objectForKey:@"both_data"];
            }
            else
            {
            }
              [self.collect_pub reloadData];
            [self.collect_outer reloadData];
            [self.collect_inner reloadData];
             [self.collect_both reloadData];
            // [self.view addSubview:self.collection_private];
//            dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
//              dispatch_async(queue1, ^{
//
//                    dispatch_async(dispatch_get_main_queue(), ^{
//
//                  });
//              });
//              dispatch_queue_t queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
//              dispatch_async(queue2, ^{
//
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                  });
//              });
//            dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
//              dispatch_async(queue3, ^{
//
//                    dispatch_async(dispatch_get_main_queue(), ^{
//
//                  });
//              });
//              dispatch_queue_t queue4 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
//              dispatch_async(queue4, ^{
//
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                  });
//              });
           }
    }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"publicurl"] forKey:@"publicurl"];
             [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"short_share_url"] forKey:@"shorturl"];
            NSString *abc = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
            _lbl_show_username.text=[NSString stringWithFormat:@"%@%@",[[abc substringToIndex:1] uppercaseString],[abc substringFromIndex:1]];
              [self.view hideActivityView];
        }
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
     NSLog(@"error");
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    check=YES;
    CGFloat scale = 1.00f;
    /*You can remove the below comment if you dont want to scale the image in retina device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width/2,newSize.height/2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (IBAction)btn_share:(id)sender
{
//   NSString *str = [NSString stringWithFormat:@"https://sisu.page.link/share?userid=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]];
//
//    NSURL *linkParameter = [[NSURL alloc] initWithString:str];
//    NSURLComponents *components = [[NSURLComponents alloc]init];
//    components.scheme =  @"https";
//    components.host = @"https://sisu.page.link";
//    components.path = @"/share";
//     NSURLQueryItem *screenNameItem = [NSURLQueryItem queryItemWithName:@"userid" value:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]];
//    components.queryItems = @[screenNameItem];
//    linkParameter = components.URL;
//
//     NSLog(@"The long URL is: %@", linkParameter.absoluteString);
//
// //   NSURL *link = [[NSURL alloc] initWithString:linkParameter];
//    NSString *dynamicLinksDomainURIPrefix = @"https://sisu.page.link";
//    FIRDynamicLinkComponents *linkBuilder = [[FIRDynamicLinkComponents alloc]
//                                             initWithLink:linkParameter
//                                                   domainURIPrefix:dynamicLinksDomainURIPrefix];
//    linkBuilder.iOSParameters = [[FIRDynamicLinkIOSParameters alloc]
//                                 initWithBundleID:@"ios.Sisuroot"];
//    linkBuilder.iOSParameters.appStoreID  = @"1459535994";
//    linkBuilder.androidParameters = [[FIRDynamicLinkAndroidParameters alloc]
//                                     initWithPackageName:@"com.app.sisuroot"];
//    linkBuilder.socialMetaTagParameters = [[FIRDynamicLinkSocialMetaTagParameters alloc] init];
//    linkBuilder.socialMetaTagParameters.title = @"Example of a Dynamic Link";
//       linkBuilder.socialMetaTagParameters.descriptionText = @"This link works whether the app is installed or not!";
//    NSLog(@"The long URL is: %@", linkBuilder.url);
//
//
//   [linkBuilder shortenWithCompletion:^(NSURL * _Nullable shortURL,
//                                         NSArray<NSString *> * _Nullable warnings,
//                                         NSError * _Nullable error) {
//      if (error || shortURL == nil) { return; }
//      NSLog(@"The short URL is: %@", shortURL);
//        NSString *textToShare = shortURL;
//        [FIROptions defaultOptions].deepLinkURLScheme = shortURL;
//        NSURL *myWebsite = shortURL;
//        NSArray *objectsToShare = @[textToShare, myWebsite];
//        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
//        NSArray *excludeActivities = @[UIActivityTypeAirDrop,
//                                          UIActivityTypePrint,
//                                          UIActivityTypeAssignToContact,
//                                          UIActivityTypeSaveToCameraRoll,
//                                          UIActivityTypeAddToReadingList,
//                                          UIActivityTypePostToFlickr,
//                                          UIActivityTypePostToVimeo];
//        activityVC.excludedActivityTypes = excludeActivities;
//        [self presentViewController:activityVC animated:YES completion:nil];
//    }];
//     NSLog(@"The short URL is: %@", linkBuilder.url);
     //NSString *textToShare = shortURL;
            NSURL *myWebsite = [[NSUserDefaults standardUserDefaults] valueForKey:@"shorturl"];
            NSArray *objectsToShare = @[myWebsite, myWebsite];
     UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                              UIActivityTypePrint,
                                              UIActivityTypeAssignToContact,
                                              UIActivityTypeSaveToCameraRoll,
                                              UIActivityTypeAddToReadingList,
                                              UIActivityTypePostToFlickr,
                                              UIActivityTypePostToVimeo];
    activityVC.excludedActivityTypes = excludeActivities;
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (IBAction)SosBtnAction:(id)sender {
    BS1ViewController *BSVC=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:BSVC animated:YES];
}

- (IBAction)btnchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
  
- (IBAction)btnyou:(id)sender {
    
     ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
      [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnfaq:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
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
    {    }
    else if (status == ReachableViaWWAN)
    {    }
}
@end
