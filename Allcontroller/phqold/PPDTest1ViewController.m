 #import "PPDTest1ViewController.h"
#import "BriefstateViewController.h"
#import "BriefstateCollectionViewCell.h"
#import <Foundation/Foundation.h>
#import "PHQ9CollectionViewCell.h"
#import "MyWebserviceManager.h"
#import "FeedViewController.h"
#import "PHQ8ViewController.h"
#import "Bs3ViewController.h"
#import "PPDTest1CollectionViewCell.h"
#import "BS1ViewController.h"
#import "UIView+RNActivityView.h"

@interface PPDTest1ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *Arr1;
    NSMutableArray *Arr2;
    NSMutableArray *Arr3;
    NSMutableArray *Arr4;
    NSMutableArray *Arr5;
    NSMutableArray *Arr6;
    NSMutableArray *imgArr1;
    NSString *check1;
    NSString *check2;
    NSString *check3;
    NSString *check6;
    NSString *count8;
    NSString *count9;
    NSString *count10;
    
    NSString *count1;
    NSString *count2;
    NSString *count3;
    NSString *count4;
    NSString *count5;
    NSString *count6;
    NSString *count7;
    
    NSString *question;
    NSString *questionA;
    char checked;
    CGPoint endPoint;
    CGPoint scrollingPoint ;
    BOOL flag;
    NSMutableDictionary *localDict;
}

@end

@implementation PPDTest1ViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    
    selectedIndexArray = [[NSMutableArray alloc] init];
    for(int i =0 ; i < 11; i++)
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
    Arr1=[[NSMutableArray alloc]initWithObjects:@"Question 1/10",@"Question 2/10",@"Question 3/10",@"Question 4/10",@"Question 5/10",@"Question 6/10",@"Question 7/10",@"Question 8/10",@"Question 9/10",@"Question 10/10",@"Thank You",nil];
    
    Arr2=[[NSMutableArray alloc]initWithObjects:@"I have been able to laugh and see the funny side of things",@"Things have been getting on top of me",@"I have looked forward with enjoyment to things",@"I have been so unhappy that",@"I have blamed myself unnecessarily when things went wrong",@"I have felt sad or miserable",@"I have been anxious or worried for no good reason",@"I have been so unhappy that I have been crying",@"I have felt scared or panicky for no very good reason",@"The thought of harming myself has occurred to me",@" ",nil];
    
    Arr3=[[NSMutableArray alloc]initWithObjects:@"As much as I always could",@"Yes, most of the time; I haven’t been able to cope at all",@"As much as I ever did",@"Yes, most of the time",@"Yes, most of the time",@"Yes, most of the time",@"No, not at all",@"Yes, most of the time",@"Yes, quite a lot",@"Yes, quite often",@"Thank You",nil];
    Arr4=[[NSMutableArray alloc]initWithObjects:@"Not quite so much now",@"Yes, sometimes; I haven’t been coping as well as usual",@"Rather less than I used to; I have had difficulty sleeping",@"Yes, sometimes",@"Yes, some of the time",@"Yes, quite often",@"Hardly ever",@"Yes, Quite often",@"Yes, sometimes",@"Sometimes",@"Thank You",nil];
    Arr5=[[NSMutableArray alloc]initWithObjects:@"Definitely not so much now",@"No, most of the time I have coped quite well",@"Definitely less than I used to",@"Not very often",@"Not very often",@"Not very often",@"Yes, sometimes",@"Only occasionally",@"No, not much",@"Hardly ever",@"Thank You",nil];
    Arr6=[[NSMutableArray alloc]initWithObjects:@"Not at all",@"No, I have been coping as well as ever",@"Hardly at all",@"No, not at all",@"No, never",@"No, not at all",@"Yes, very often",@"No, never",@"No, not at all",@"Never",@"Thank You",nil];
    
    [self.view addSubview:_pagecontrol];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.navigationController.navigationBar.hidden=YES;
    // Arrayimage=[NSArray arrayWithObjects:@"welcome (1).jpg",@"thank_you.jpg",@"get_started.jpg",nil];
    //arraylabel=[NSArray arrayWithObjects:@"Search Schools & Colleges because Edubuddy is a right choice",@"Select your Schools and Colleges",@"Apply by one Click on Edubudy And Find Best Result", nil];
    // [_introcollection registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    [_introcollection registerNib:[UINib nibWithNibName:@"PPDTest1CollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    
    
    // [_introcollection registerNib:[UINib nibWithNibName:@"PHQ9CollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
}
- (void)scrollToPreviousOrNextCell:(NSString *)direction {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
        
        if ([direction isEqualToString:@"Previous"]) {
            
            if (previousIndex < firstIndex) {
                
            } else {
                
                [_introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            }
            
        } else if ([direction isEqualToString:@"Next"]) {
            
            if (nextIndex > lastIndex) {
                
            } else {
                [_introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            }
        }
        
    });
}

-(void) autoScrollImageSlider
{
    
    
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

- (BOOL)collectionView:(UICollectionView *)collectionView
shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return Arr1.count;
}


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

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseIdentifier = @"FirstCollectionViewCell";
    
    PPDTest1CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.SubmitBtnobj.hidden=YES;
    cell.thankulbl.hidden=YES;
    // cell.backgroundimg.image = [UIImage imageNamed:[Arrayimage objectAtIndex:indexPath.row]];
    cell.Questionlbl.text = [Arr1 objectAtIndex:indexPath.row];
    question=cell.Questionlbl.text;
    cell.BSAlbl.text = [Arr2 objectAtIndex:indexPath.row];
    questionA=cell.BSAlbl.text;
    
    cell.Homebtnobj.tag = indexPath.row;
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
    
    [cell.Btn1obj setTitle:[Arr3 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [cell.Btn2obj setTitle:[Arr4 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [cell.Btn3obj setTitle:[Arr5 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [cell.Btn4obj setTitle:[Arr6 objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    
    int lastindex=[Arr1 count]-1;
    
    if (indexPath.row == lastindex)
    {
        cell.Questionlbl.hidden=YES;
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
        cell.backbtnobj.hidden=NO;
        
    }
    else
    {
        if (indexPath.row == 0)
        {
            cell.backbtnobj.hidden=YES;
            cell.Questionlbl.hidden=NO;
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
            _pagecontrol.hidden=NO;
            cell.skipBtnobj.hidden=NO;
            
        }
        else if (indexPath.row == 9)
        {
            cell.skipBtnobj.hidden=YES;
            cell.skipbacklbl.hidden=YES;
            cell.backbtnobj.hidden=NO;
            cell.Questionlbl.hidden=NO;
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
            cell.Questionlbl.hidden=NO;
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
            _pagecontrol.hidden=NO;
            cell.skipBtnobj.hidden=NO;
            cell.backbtnobj.hidden=NO;
            
        }
    }
    
    selectedIndex = indexPath.row;
    
    NSDictionary *dict = [selectedIndexArray objectAtIndex:indexPath.row];
    if([[dict valueForKey:@"selectedvalue"] integerValue] == 1)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 2)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 3)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 4)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
    }
    else
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
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
    return CGSizeMake(_introcollection.bounds.size.width, _introcollection.bounds.size.height-45);
}

-(void)SkipAction : (UIButton *) btn
{
    
     _pagecontrol.currentPage = btn.tag;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            // [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        } else {
            [_introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
        
        if (previousIndex < firstIndex) {
            
        }
        else {
            
            [_introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            _pagecontrol.currentPage = btn.tag;

         //   [_introcollection reloadData];
            
            //  [_introcollection reloadItemsAtIndexPaths:@[previousIndexPath]];
        }
        
    });
    
    
}


-(void)SubmitAction : (UIButton *) btn
{
    [self.view showActivityViewWithLabel:@"Loading"];

    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"PPDTestSecA" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:count1 forKey:@"AbleToLaugh"];
    [paramDict setValue:count2 forKey:@"GettingOnTop"];
    [paramDict setValue:count3 forKey:@"Enjoyment"];
    [paramDict setValue:count4 forKey:@"UnHappy"];
    [paramDict setValue:count5 forKey:@"BlamedMyselfUnnecessarily"];
    [paramDict setValue:count6 forKey:@"Miserable"];
    [paramDict setValue:count7 forKey:@"Worried"];
    [paramDict setValue:count8 forKey:@"unhappy_crying"];
    [paramDict setValue:count9 forKey:@"scared_or_panicky"];
    [paramDict setValue:count10 forKey:@"HarmingMyselfHas"];
    
    [paramDict setValue:@"1" forKey:@"form_status"];
    [paramDict setValue:@"5" forKey:@"ScaleType"];

    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"UserId"];
    
        [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
        [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"PPDTestSecA" :dict :paramDict];
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"PPDTestSecA"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            
            
            
            if ([[responseDictionary valueForKey:@"additional_Ques"] integerValue]==1)
            {
                Bs3ViewController *FVC=[[Bs3ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"5"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];
            }
            else
            {
                BS1ViewController *FVC=[[BS1ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"5"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];
                
            }
            
            
             //            if ([[responseDictionary  valueForKey:@"Count"] integerValue] <5)
            //            {
            //
            //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good news"
            //                                                                message:@"“ You do not have problems with anxiety. You may still wish to use Sisuchat to build resilience, strength, empowerment, and confidence.”"
            //                                                               delegate:self
            //                                                      cancelButtonTitle:@"OK"
            //
            //                                                      otherButtonTitles:nil];
            //                alert.tag = 1009;
            //                [alert show];
            //            }
            //            else if ([[responseDictionary  valueForKey:@"Count"] integerValue] >=5 && [[responseDictionary  valueForKey:@"Count"] integerValue] <10)
            //            {
            //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You scored between 5 – 10 on the anxiety scale"
            //                                                                message:@"mild anxiety"
            //                                                               delegate:self
            //                                                      cancelButtonTitle:@"OK"
            //
            //                                                      otherButtonTitles:nil];
            //                alert.tag = 1009;
            //                [alert show];
            //            }
            //
            ////            else if ([[responseDictionary  valueForKey:@"Count"] integerValue] ==10)
            ////
            ////            {
            ////                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wonderful"
            ////                                                                message:@"your score on the depression scale is less than 10 meaning that it is unlikely you are depressed. This means you may have stress and days you are worn out but overall, there appears to be no depression detection."
            //                                                              delegate:self
            //                                                    cancelButtonTitle:@"OK"
            //
            //                                                     otherButtonTitles:nil];
            //                alert.tag = 1009;
            //              [alert show];
            //
            //           }
            //
            //            else  if ([[responseDictionary  valueForKey:@"Count"] integerValue] >10 && [[responseDictionary  valueForKey:@"Count"] integerValue] <=15)
            //            {
            //
            //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You scored between 10 – 15 and may be experiencing some anxiety right now"
            //                                                                message:@"moderate anxiety"
            //                                                               delegate:self
            //                                                      cancelButtonTitle:@"OK"
            //
            //                                                      otherButtonTitles:nil];
            //                alert.tag = 1009;
            //                [alert show];
            //            }
            //            else  if ([[responseDictionary  valueForKey:@"Count"] integerValue] >=16)
            //            {
            //
            //
            //
            //                //                Bs3ViewController *FVC=[[Bs3ViewController alloc]init];
            //                //               // [FVC setStr2:@"feed"];
            //                //                [self.navigationController pushViewController:FVC animated:YES];
            //
            //
            //
            //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You"
            //                                                                message:@"severe anxiety"
            //                                                               delegate:self
            //                                                      cancelButtonTitle:@"OK"
            //
            //                                                      otherButtonTitles:nil];
            //                alert.tag = 1009;
            //                [alert show];
            //
            //
            //            }
            //
            
            
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
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"0";
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"3";
//
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"0";
        
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
        count6=@"1";
        
     }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:question])
    {
        count7=@"0";
        
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"0";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
        count9=@"3";
    }
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"0";
    }
    else
    {
        count2=@"3";
        
    }

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            //[_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        } else {
            [_introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"1";
        
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"2";
//
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"1";
        
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
        count6=@"1";
        
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:question])
    {
        count7=@"1";
        
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"1";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
        count9=@"2";
    }
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"1";
    }
    else
    {
        count2=@"2";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            //[_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        } else {
            [_introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"2";
        
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
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
        count4=@"2";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:question])
    {
        count5=@"1";
        
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
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"2";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
        count9=@"1";
    }
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"2";
    }
    else
    {
        count2=@"1";
        
    }
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            // [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        } else {
            [_introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"3";
        
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
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
        count4=@"3";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:question])
    {
        count5=@"0";
        
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
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"3";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
        count9=@"0";
    }
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"4";
    }
    else
    {
        count2=@"0";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            
            // [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        } else {
            [_introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
@end

//
//  BriefstateViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 02/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//


