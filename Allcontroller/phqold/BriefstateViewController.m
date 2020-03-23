
#import "BriefstateViewController.h"
#import "BriefstateCollectionViewCell.h"
#import <Foundation/Foundation.h>
#import "MyWebserviceManager.h"
#import "FeedViewController.h"
#import "PHQ8ViewController.h"
#import "Bs3ViewController.h"
#import "BS1ViewController.h"
#import "UIView+RNActivityView.h"
#import "Bs3ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GraphView.h"
#import "chattypeViewController.h"
#import "smilepage1ViewController.h"
#import "GraphView1.h"
//#import "briefstate1CollectionViewCell.h"
//#import "Briefstate2CollectionViewCell.h"
//#import "Briefstate3CollectionViewCell.h"

@interface BriefstateViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *Arr1;
    NSMutableArray *Arr2;
    NSMutableArray *Arr3;
    NSMutableArray *Arr4;
    NSMutableArray *Arr5;
    NSMutableArray *Arr6;
    NSMutableArray *imgArr1;
    float someFloat;
    
    // NSMutableArray *Arr3;
    NSString *check1;
    NSString *check2;
    NSString *check3;
    NSString *check6;
    NSString *check4;
    NSString *check5;
    NSString *check7;
    
    NSString *count1;
    NSString *count2;
    NSString *count3;
    NSString *count4;
    NSString *count5;
    NSString *count6;
    NSString *count7;
    NSMutableDictionary *arrProgressForEachCell;
    NSString *question;
    NSString *questionA;
    //NSInteger checked;
    char checked;
    CGPoint endPoint;
    CGPoint  scrollingPoint ;
    BOOL flag;
    NSMutableDictionary *localDict;
}

@end

@implementation BriefstateViewController



- (void)viewDidLoad {
    
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
         graphView.backgroundColor = [UIColor clearColor];
         
         GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
            graphView1.backgroundColor = [UIColor clearColor];
         
         
            [self.view_footer1 addSubview:graphView];
         [self.view_footer2 addSubview:graphView1];
    
  if([_teststatus isEqualToString:@"1"])
    {
        _Gobackbtnobj.hidden=YES;
    }
    else
    {
        _Gobackbtnobj.hidden=NO;
    }
    someFloat=0.142857;
    _alertviewobj.layer.cornerRadius=8;
    _alertviewobj.clipsToBounds=YES;
    _alertviewobj.layer.borderWidth =1.0f;
    _doneobj.layer.cornerRadius=8;
    _doneobj.clipsToBounds=YES;
    _doneobj.layer.borderWidth =1.0f;
    
    _alertviewobj.hidden=YES;
    selectedIndexArray = [[NSMutableArray alloc] init];
    for(int i =0 ; i < 8; i++)
    {
        localDict = [[NSMutableDictionary alloc] init];
        [localDict setValue:[NSString stringWithFormat:@"%d",i] forKey:@"selectedindex"];
        [localDict setValue:@"0" forKey:@"value"];
        [localDict setValue:@"0" forKey:@"selectedvalue"];
        
        [selectedIndexArray addObject:localDict];
    }
    
    selectedIndex = 0;
    
    [super viewDidLoad];
    
    flag=NO;
    //    check=@"no";
    //    check1=@"no";
    //
    //    check2=@"no";
    //
    //    check3=@"no";
    
    self.navigationController.navigationBar.hidden=YES;
    
    Arr1=[[NSMutableArray alloc]initWithObjects:@"Question 1/7",@"Question 2/7",@"Question 3/7",@"Question 4/7",@"Question 5/7",@"Question 6/7",@"Question 7/7",@"Thank You",nil];
    
    Arr2=[[NSMutableArray alloc]initWithObjects:@"Feeling nervous,anxious,or on edge",@"Not being able to stop or control worry",@"Worrying too much about different things",@"Trouble relaxing",@"Becoming so restless it is hard to sit still",@"Being easily annoyed or irritable",@"Feeling afraid as if something awful might happen",@" ",nil];
    
    [self.view addSubview:_pagecontrol];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.navigationController.navigationBar.hidden=YES;
    // Arrayimage=[NSArray arrayWithObjects:@"welcome (1).jpg",@"thank_you.jpg",@"get_started.jpg",nil];
    //arraylabel=[NSArray arrayWithObjects:@"Search Schools & Colleges because Edubuddy is a right choice",@"Select your Schools and Colleges",@"Apply by one Click on Edubudy And Find Best Result", nil];
    // [self.introcollection registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    [self.introcollection registerNib:[UINib nibWithNibName:@"BriefstateCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    
    
    
}
- (void)scrollToPreviousOrNextCell:(NSString *)direction {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 7;
        
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
        
        if ([direction isEqualToString:@"Previous"]) {
            
            if (previousIndex < firstIndex)
            {
                
            }
            else {
                
                [self.introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            }
            
        } else if ([direction isEqualToString:@"Next"]) {
            
            if (nextIndex > lastIndex) {
                
            } else {
                [self.introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
                
            }
        }
        
    });
}

-(void) autoScrollImageSlider
{
    
    
}
-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
   // self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    

}
-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
}

//- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0)
//{
//
//    _pagecontrol.currentPage = indexPath.row;
////    if(indexPath.row == 0)
////    {
////        [_StartedBtn setTitle:@"WELCOME" forState:UIControlStateNormal];
////    }
////    else if(indexPath.row == 1)
////    {
////        [_StartedBtn setTitle:@"THANK YOU" forState:UIControlStateNormal];
////    }
////    else
////    {
////        [_StartedBtn setTitle:@"GET STARTED" forState:UIControlStateNormal];
////    }
//
//}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(8_0)
{
    selectedIndex = indexPath.row;
    _pagecontrol.currentPage = indexPath.row;
 
 
    NSDictionary *dict = [selectedIndexArray objectAtIndex:indexPath.row];
    if([[dict valueForKey:@"selectedvalue"] integerValue] == 1)
    {
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 2)
    {
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 3)
    {
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 4)
    {
        
    }
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return Arr1.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"FirstCollectionViewCell";
    BriefstateCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.SubmitBtnobj.hidden=YES;
    cell.thankulbl.hidden=YES;
    // cell.backgroundimg.image = [UIImage imageNamed:[Arrayimage objectAtIndex:indexPath.row]];
//    cell.Questionlbl.text = [Arr1 objectAtIndex:indexPath.row];
//    question=cell.Questionlbl.text;
    question = [Arr1 objectAtIndex:indexPath.row];
    cell.BSAlbl.text = [Arr2 objectAtIndex:indexPath.row];
    questionA=cell.BSAlbl.text;
    cell.Homebtnobj.tag = indexPath.row;
    if([_teststatus isEqualToString:@"1"])
    {
        cell.Homebtnobj.hidden=YES;
    }
    else
    {
        cell.Homebtnobj.hidden=NO;
    }
    [cell.Homebtnobj addTarget:self action:@selector(HomeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.SubmitBtnobj.tag = indexPath.row;
    [cell.SubmitBtnobj addTarget:self action:@selector(SubmitAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.skipBtnobj.tag = indexPath.row;
    [cell.skipBtnobj addTarget:self action:@selector(SkipAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.backbtnobj.tag = indexPath.row;
    [cell.backbtnobj addTarget:self action:@selector(BackBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.Btn1obj.tag = indexPath.row;
    [cell.Btn1obj addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
    cell.Btn2obj.tag = indexPath.row;
    
    [cell.Btn2obj addTarget:self action:@selector(btn2Action:) forControlEvents:UIControlEventTouchUpInside];
    cell.Btn3obj.tag = indexPath.row;
    
    [cell.Btn3obj addTarget:self action:@selector(btn3Action:) forControlEvents:UIControlEventTouchUpInside];
    cell.Btn4obj.tag = indexPath.row;
    
    [cell.Btn4obj addTarget:self action:@selector(btn4Action:) forControlEvents:UIControlEventTouchUpInside];
    
    
//    if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
//
//        switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
//
//            case 1136:
//                printf("iPhone 5 or 5S or 5C");
//               // cell.skipBtnobj.frame = CGRectMake(230, 12, 36, 36);
//                break;
//            case 1334:
//                printf("iPhone 6/6S/7/8");
//               // cell.skipBtnobj.frame = CGRectMake(285, 12, 36, 36);
//                break;
//            case 2208:
//                printf("iPhone 6+/6S+/7+/8+");
//                //cell.skipBtnobj.frame = CGRectMake(325, 12, 36, 36);
//
//                break;
//            case 2436:
//                printf("iPhone X, XS");
//                cell.skipBtnobj.frame = CGRectMake(300, 500, 53, 29);
//                cell.backbtnobj.frame = CGRectMake(2, 420, 70, 29);
//                _pagecontrol.frame = CGRectMake(72, 550, 232, 37);
//
//                break;
//            case 2688:
//                printf("iPhone XS Max");
//                cell.skipBtnobj.frame = CGRectMake(300, 500, 53, 29);
//                cell.backbtnobj.frame = CGRectMake(2, 500, 70, 29);
//                _pagecontrol.frame = CGRectMake(72, 550, 232, 37);
//
//                 break;
//
//            case 1792:
//                printf("iPhone XR");
//                cell.skipBtnobj.frame = CGRectMake(300, 500, 53, 29);
//                cell.backbtnobj.frame = CGRectMake(2, 500, 70, 29);
//            _pagecontrol.frame = CGRectMake(72, 550, 232, 37);
//
//                break;
//            default:
//                printf("unknown");
//        }
//    }
    
    
    int lastindex=[Arr1 count]-1;
    if (indexPath.row == lastindex)
    {
        //cell.Questionlbl.hidden=YES;
        cell.BSAlbl.hidden=YES;
        cell.Btn1obj.hidden=YES;
        cell.Btn2obj.hidden=YES;
        cell.Btn3obj.hidden=YES;
        cell.Btn4obj.hidden=YES;
        cell.btn1lbl.hidden=YES;
        cell.btn2lbl.hidden=YES;
        cell.headerlbl.hidden=YES;
        cell.skipbacklbl.hidden=YES;
        cell.btn3lbl.hidden=YES;
        cell.btn4lbl.hidden=YES;
        cell.SubmitBtnobj.hidden=NO;
        cell.thankulbl.hidden=NO;
        _pagecontrol.hidden=YES;
        cell.skipBtnobj.hidden=YES;
         cell.backbtnobj.hidden=YES;
       // cell.backbtnobj.hidden=NO;
        
    }
    
    else
    {
        _pagecontrol.hidden=NO;

        if (indexPath.row == 0)
        {
            cell.backbtnobj.hidden=YES;
          //  cell.Questionlbl.hidden=NO;
            cell.BSAlbl.hidden=NO;
            cell.Btn1obj.hidden=NO;
            cell.Btn2obj.hidden=NO;
            cell.Btn3obj.hidden=NO;
            cell.Btn4obj.hidden=NO;
            cell.btn1lbl.hidden=NO;
            cell.btn2lbl.hidden=NO;
            cell.headerlbl.hidden=NO;
            cell.skipbacklbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
           // _pagecontrol.hidden=NO;
            cell.skipBtnobj.hidden=NO;
            
        }
        else if (indexPath.row == 6)
        {
            cell.skipBtnobj.hidden=YES;
            cell.skipbacklbl.hidden=YES;
            cell.backbtnobj.hidden=NO;
            //cell.Questionlbl.hidden=NO;
            cell.BSAlbl.hidden=NO;
            cell.Btn1obj.hidden=NO;
            cell.Btn2obj.hidden=NO;
            cell.Btn3obj.hidden=NO;
            cell.Btn4obj.hidden=NO;
            cell.btn1lbl.hidden=NO;
            cell.btn2lbl.hidden=NO;
            cell.headerlbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
            _pagecontrol.hidden=NO;
            
        }
        else
        {
           // cell.Questionlbl.hidden=NO;
            cell.BSAlbl.hidden=NO;
            cell.Btn1obj.hidden=NO;
            cell.Btn2obj.hidden=NO;
            cell.Btn3obj.hidden=NO;
            cell.Btn4obj.hidden=NO;
            cell.btn1lbl.hidden=NO;
            cell.btn2lbl.hidden=NO;
            cell.headerlbl.hidden=NO;
            cell.skipbacklbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
           // _pagecontrol.hidden=NO;
            cell.skipBtnobj.hidden=NO;
            cell.backbtnobj.hidden=NO;
            
        }
    }
    selectedIndex = indexPath.row;
       NSDictionary *dict = [selectedIndexArray objectAtIndex:indexPath.row];
       if([[dict valueForKey:@"selectedvalue"] integerValue] == 1)
       {
           [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"checkbox_40px.png"] forState:UIControlStateNormal];
           [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           
       }
       else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 2)
       {
           [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"checkbox_40px.png"] forState:UIControlStateNormal];
           [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
       }
       else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 3)
       {
           [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"checkbox_40px.png"] forState:UIControlStateNormal];
           [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
       }
       else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 4)
       {
           [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"checkbox_40px.png"] forState:UIControlStateNormal];
       }
       
       else
       {
           [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
           [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"check01_40px.png"] forState:UIControlStateNormal];
       }
    
    return cell;
}

- (void)collectionView:(UICollectionView* )collectionView didSelectItemAtIndexPath:(NSIndexPath* )indexPath;
{
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (UIEdgeInsets)collectionView: (UICollectionView *)collectionVieww layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);  // top, left, bottom, right
}

- (CGSize)collectionView:(UICollectionView* )collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath* )indexPath
{
    return CGSizeMake(self.introcollection.bounds.size.width, self.introcollection.bounds.size.height-45);
}

-(void)SkipAction : (UIButton *) btn
{
    _pagecontrol.currentPage = btn.tag;
    someFloat = someFloat + 0.142857;
    [_progressview setProgress:someFloat animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 7;
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        if (nextIndex > lastIndex) {
            
        } else {
            [self.introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        
    });
    
}

-(void) HomeAction : (UIButton *) btn
{
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr2:@"feed"];
    [self.navigationController pushViewController:FVC animated:YES];
}

-(void) BackBtnAction : (UIButton *) btn
{
    someFloat = someFloat - 0.142857;
       [_progressview setProgress:someFloat animated:YES];
      

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
       NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        
       NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
        
        if (previousIndex < firstIndex)
        {
            
        }
        else {
            [self.introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            [self.introcollection reloadData];
            self.pagecontrol.currentPage = btn.tag;
       }
    });
}


-(void)SubmitAction : (UIButton *) btn
{
    [self.view showActivityViewWithLabel:@"Loading"];

    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"scale" forKey:@"name"];

    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:count1 forKey:@"calm"];
    [paramDict setValue:count2 forKey:@"tense"];
    [paramDict setValue:count3 forKey:@"upset"];
    [paramDict setValue:count4 forKey:@"reiaxed"];
    [paramDict setValue:count5 forKey:@"worried"];
    [paramDict setValue:count6 forKey:@"content"];
    [paramDict setValue:count7 forKey:@"afraidas"];
     [paramDict setValue:@"1" forKey:@"ScaleType"];
     [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"UserId"];
     [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"scale" :dict :paramDict];
}
- (IBAction)btnhome:(id)sender {
     FeedViewController *VC1=[[FeedViewController alloc]init];
        [self.navigationController pushViewController:VC1 animated:YES];
    }
- (IBAction)btnyou:(id)sender {
}
- (IBAction)btnchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
       [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)btnfaq:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    NSLog(@"error");
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"scale"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
           //  _msgtextView.text=[responseDictionary valueForKey:@"status_message"];
            
            
 
            if ([[responseDictionary valueForKey:@"additional_Ques"] integerValue]==1)
            {
                Bs3ViewController *FVC=[[Bs3ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"1"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];
            }
            else
            {
                BS1ViewController *FVC=[[BS1ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"1"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];
                
            }
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
//                message:[responseDictionary valueForKey:@"status_message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//             alert.tag = 1009;
//             [alert show];
            
            
                                  
//                        if ([[responseDictionary  valueForKey:@"Count"] integerValue] <5)
//                        {
//
//                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
//                                                                            message:@"Your score indicates you have been experiencing mild/moderate/severe symptoms of anxiety/depression/xyz in the last weeks.  Congratulations! You've answered this quick anxiety/depression quiz in a manner that suggests that while you may occasionally be experiencing some anxiety symptoms from time to time, you're not likely to be suffering from any type of anxiety disorder at this time. Most people experience fleeting anxiety feelings from time to time in their lives -- this is normal and expected."
//                                                                           delegate:self
//                                                                  cancelButtonTitle:@"OK"
//
//                                                                  otherButtonTitles:nil];
//                            alert.tag = 1009;
//                            [alert show];
//                        }
//                        else if ([[responseDictionary  valueForKey:@"Count"] integerValue] >=5 && [[responseDictionary  valueForKey:@"Count"] integerValue] <10)
//                        {
////                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
////                                                                            message:@"You may have mild anxiety"
////                                                                           delegate:self
////                                                                  cancelButtonTitle:@"OK"
////
////                                                                  otherButtonTitles:nil];
////                            alert.tag = 1009;
////                            [alert show];
//                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
//                                                                            message:@"Your score indicates you have been experiencing mild/moderate/severe symptoms of anxiety/depression/xyz in the last weeks.  Congratulations! You've answered this quick anxiety/depression quiz in a manner that suggests that while you may occasionally be experiencing some anxiety symptoms from time to time, you're not likely to be suffering from any type of anxiety disorder at this time. Most people experience fleeting anxiety feelings from time to time in their lives -- this is normal and expected."
//                                                                           delegate:self
//                                                                  cancelButtonTitle:@"OK"
//
//                                                                  otherButtonTitles:nil];
//                            alert.tag = 1009;
//                            [alert show];
//                        }
//
//            //            else if ([[responseDictionary  valueForKey:@"Count"] integerValue] ==10)
//            //
//            //            {
//            //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wonderful"
//            //                                                                message:@"your score on the depression scale is less than 10 meaning that it is unlikely you are depressed. This means you may have stress and days you are worn out but overall, there appears to be no depression detection."
//            //                                                               delegate:self
//            //                                                      cancelButtonTitle:@"OK"
//            //
//            //                                                      otherButtonTitles:nil];
//            //                alert.tag = 1009;
//            //                [alert show];
//            //
//            //            }
//            //
//                        else  if ([[responseDictionary  valueForKey:@"Count"] integerValue] >10 && [[responseDictionary  valueForKey:@"Count"] integerValue] <=15)
//                        {
//
////                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
////                                                                            message:@"You may have moderate anxiety"
////                                                                           delegate:self
////                                                                  cancelButtonTitle:@"OK"
////
////                                                                  otherButtonTitles:nil];
////                            alert.tag = 1009;
////                            [alert show];
//                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
//                                                                            message:@"Your score indicates you have been experiencing mild/moderate/severe symptoms of anxiety/depression/xyz in the last weeks.  Congratulations! You've answered this quick anxiety/depression quiz in a manner that suggests that while you may occasionally be experiencing some anxiety symptoms from time to time, you're not likely to be suffering from any type of anxiety disorder at this time. Most people experience fleeting anxiety feelings from time to time in their lives -- this is normal and expected."
//                                                                           delegate:self
//                                                                  cancelButtonTitle:@"OK"
//
//                                                                  otherButtonTitles:nil];
//                            alert.tag = 1009;
//                            [alert show];
//                        }
//                        else  if ([[responseDictionary  valueForKey:@"Count"] integerValue] >=15)
//                        {
//
//
//
//                            //                Bs3ViewController *FVC=[[Bs3ViewController alloc]init];
//                            //               // [FVC setStr2:@"feed"];
//                            //                [self.navigationController pushViewController:FVC animated:YES];
//
//
//
//                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
//                                                                            message:@"You may have severe anxiety"
//                                                                           delegate:self
//                                                                  cancelButtonTitle:@"OK"
//
//                                                                  otherButtonTitles:nil];
//                            alert.tag = 1009;
//                            [alert show];
//
//
//                        }
//
            
//            FeedViewController *FVC=[[FeedViewController alloc]init];
//            [FVC setStr2:@"feed"];
//            [self.navigationController pushViewController:FVC animated:YES];
            
            // PHQ8ViewController
            
            
            
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1009)
    {
        FeedViewController *FVC=[[FeedViewController alloc]init];
        [FVC setStr2:@"feed"];
        [self.navigationController pushViewController:FVC animated:YES];
        
    }
}

-(void)callstorelocation
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"location" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"GetLatLng" :dict :dict1];
}
-(void)btn1Action : (UIButton *) btn
{
    _pagecontrol.currentPage = btn.tag;
    someFloat = someFloat + 0.142857;
    [_progressview setProgress:someFloat animated:YES];
      
      
  /*  if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"0";
    }
//    else if ([[Arr1 objectAtIndex:1] isEqualToString:question])
//    {
//        count2=@"0";
//
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"3";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"0";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:question])
    {
        count5=@"3";
        
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:question])
    {
        count6=@"3";
 
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:question])
    {
        count7=@"3";
        
        [btn setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        
    }
    else
    {
         count2=@"0";
    }*/
    
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count1=@"0";
    }
       else if ([[Arr1 objectAtIndex:1] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
      {
           count2=@"0";
    
       }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count3=@"0";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count4=@"0";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count5=@"0";
        
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count6=@"0";
        
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count7=@"0";
        
        [btn setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        //count2=@"0";
    }
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 7;
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        if (nextIndex > lastIndex) {
           
        } else {
            [self.introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    });
    
    NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
    localDict = [selectedIndexArray objectAtIndex:btn.tag];
    [localDict setValue:@"1" forKey:@"selectedvalue"];
    [localDict setValue:[NSString stringWithFormat:@"%d",btn.tag] forKey:@"selectedindex"];
    
    [selectedIndexArray replaceObjectAtIndex:btn.tag withObject:localDict];
    
    
}
-(void)btn2Action : (UIButton *) btn
{
    _pagecontrol.currentPage = btn.tag;
    someFloat = someFloat + 0.142857;
      [_progressview setProgress:someFloat animated:YES];
        
   /* if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"1";
        
    }
//    else if ([[Arr1 objectAtIndex:1] isEqualToString:question])
//    {
//        count2=@"1";
//
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"2";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"1";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:question])
    {
        count5=@"2";
        
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:question])
    {
        count6=@"2";
        
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:question])
    {
        count7=@"2";
        [btn setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        count2=@"1";
        
    }*/
   
   
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count1=@"1";
        
    }
       else if ([[Arr1 objectAtIndex:1] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
        {
            count2=@"1";
    
        }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count3=@"1";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count4=@"1";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count5=@"1";
        
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count6=@"1";
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count7=@"1";
        [btn setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
    }
    else
    {
        //count2=@"1";
        
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 7;
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
       if (nextIndex > lastIndex) {
        } else {
            [self.introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    });
    
    NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
    localDict = [selectedIndexArray objectAtIndex:btn.tag];
    
    [localDict setValue:@"2" forKey:@"selectedvalue"];
    [localDict setValue:[NSString stringWithFormat:@"%d",btn.tag] forKey:@"selectedindex"];
    
    [localDict setValue:btn.titleLabel.text forKey:@"value"];
    [selectedIndexArray replaceObjectAtIndex:btn.tag withObject:localDict];
    
    
    
}
-(void)btn3Action : (UIButton *) btn
{
    _pagecontrol.currentPage = btn.tag;
    someFloat = someFloat + 0.142857;
    [_progressview setProgress:someFloat animated:YES];
    if ([[Arr1 objectAtIndex:0] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count1=@"2";
        
    }
        else if ([[Arr1 objectAtIndex:1] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
        {
            count2=@"2";
    
        }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count3=@"2";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count4=@"2";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count5=@"2";
        
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count6=@"2";
        
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count7=@"2";
        [btn setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        
    }
    
    else
    {
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 7;
        
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            
        } else {
            [self.introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    });
    NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
    localDict = [selectedIndexArray objectAtIndex:btn.tag];
    
    [localDict setValue:@"3" forKey:@"selectedvalue"];
    [localDict setValue:[NSString stringWithFormat:@"%d",btn.tag] forKey:@"selectedindex"];
    
    [localDict setValue:btn.titleLabel.text forKey:@"value"];
    [selectedIndexArray replaceObjectAtIndex:btn.tag withObject:localDict];
    
    
}
-(void)btn4Action : (UIButton *) btn
{
    _pagecontrol.currentPage = btn.tag;
    someFloat = someFloat + 0.142857;
    [_progressview setProgress:someFloat animated:YES];
    if ([[Arr1 objectAtIndex:0] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count1=@"3";
        
    }
       else if ([[Arr1 objectAtIndex:1] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
      count2=@"3";
    
    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count3=@"3";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count4=@"3";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count5=@"3";
        
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count6=@"3";
        
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count7=@"3";
        [btn setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        
    }
    else
    {
      //  count2=@"3";
        
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 7;
        
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        
        if (nextIndex > lastIndex) {
         
        } else {
            [self.introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    });
    NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
    localDict = [selectedIndexArray objectAtIndex:btn.tag];
    
    [localDict setValue:@"4" forKey:@"selectedvalue"];
    [localDict setValue:[NSString stringWithFormat:@"%d",btn.tag] forKey:@"selectedindex"];
    
    [localDict setValue:btn.titleLabel.text forKey:@"value"];
    [selectedIndexArray replaceObjectAtIndex:btn.tag withObject:localDict];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

- (IBAction)BackbtnAction1:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)GbackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (IBAction)DoneBtnAction:(id)sender {
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr2:@"feed"];
    [self.navigationController pushViewController:FVC animated:YES];
}

@end

