//
//  BriefstateQ1ViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 03/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "BriefstateQ1ViewController.h"
#import "PHQ9CollectionViewCell.h"
#import "MyWebserviceManager.h"
#import "FeedViewController.h"
#import "PHQ8ViewController.h"
#import "Bs3ViewController.h"
#import "AppDelegate.h"
#import "BS1ViewController.h"
#import "UIView+RNActivityView.h"

@interface BriefstateQ1ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *Arr1;
    NSMutableArray *Arr2;
    NSMutableArray *Arr3;
    NSMutableArray *Arr4;
    NSMutableArray *Arr5;
    NSMutableArray *Arr6;
    
    // NSMutableArray *Arr3;
    NSString *check;
    NSString *check1;
    
    NSString *check2;
    
    NSString *check3;
    
    CGPoint endPoint;
    CGPoint  scrollingPoint ;
    BOOL flag;
    NSString *count1;
    NSString *count2;
    NSString *count3;
    NSString *count4;
    NSString *count5;
    NSString *count6;
    
    NSString *count7;
    NSString *count8;
    NSString *count9;
    NSString *count10;
    
    NSString *question;
    NSString *questionA;
    NSMutableDictionary *localDict;
    
}
@end

@implementation BriefstateQ1ViewController

- (void)viewDidLoad {
    
    selectedIndexArray = [[NSMutableArray alloc] init];
    for(int i =0 ; i < 10; i++)
    {
        localDict = [[NSMutableDictionary alloc] init];
        [localDict setValue:[NSString stringWithFormat:@"%d",i] forKey:@"selectedindex"];
        [localDict setValue:@"0" forKey:@"value"];
        [localDict setValue:@"0" forKey:@"selectedvalue"];
        
        [selectedIndexArray addObject:localDict];
    }
    
    selectedIndex = 0;
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    flag=NO;
    check=@"no";
    check1=@"no";
    
    check2=@"no";
    
    check3=@"no";
    
    self.navigationController.navigationBar.hidden=YES;
    
    
    Arr1=[[NSMutableArray alloc]initWithObjects:@"Question 1/9",@"Question 2/9",@"Question 3/9",@"Question 4/9",@"Question 5/9",@"Question 6/9",@"Question 7/9",@"Question 8/9",@"Question 9/9",@"Thankyou",nil];
    
    Arr2=[[NSMutableArray alloc]initWithObjects:@"Little interest or pleasure in doing things",@"Feeling down, depressed,or hopeless",@"Trouble falling asleep or staying asleep",@"Feeling tired or having little energy",@"Poor appetite or overeating",@"Feeling bad about yourself — or that you are a failure or have let yourself or your family down",@"Trouble concentrating on things,such as reading the newspaper or watching television",@"Moving or speaking so slowly that other day people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual",@"Thoughts that you would be better off dead or of hurting yourself in some way",@" ",nil];
    
    
    // Do any additional setup after loading the view from its nib.
    
    //[_introcollection registerNib:[UINib nibWithNibName:@"BriefstateCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"IntroCollectioncell"];
    
    //    [_introcollection registerNib:[UINib nibWithNibName:@"Briefstate1CollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"Intro1"];
    //    [_introcollection registerNib:[UINib nibWithNibName:@"Briefstate2CollectionViewCell.h" bundle:nil ]forCellWithReuseIdentifier:@"Intro2"];
    //      [_introcollection registerNib:[UINib nibWithNibName:@"Briefstate2CollectionViewCell.h" bundle:nil ]forCellWithReuseIdentifier:@"Intro3"];
    
    [self.view addSubview:_pagecontrol];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.navigationController.navigationBar.hidden=YES;
    // Arrayimage=[NSArray arrayWithObjects:@"welcome (1).jpg",@"thank_you.jpg",@"get_started.jpg",nil];
    //arraylabel=[NSArray arrayWithObjects:@"Search Schools & Colleges because Edubuddy is a right choice",@"Select your Schools and Colleges",@"Apply by one Click on Edubudy And Find Best Result", nil];
    // [_introcollection registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    [_introcollection registerNib:[UINib nibWithNibName:@"BriefstateCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    
    
    [_introcollection registerNib:[UINib nibWithNibName:@"PHQ9CollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
}
- (void)scrollToPreviousOrNextCell:(NSString *)direction {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 9;
        
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
    //    if(indexPath.row == 0)
    //    {
    //        [_StartedBtn setTitle:@"WELCOME" forState:UIControlStateNormal];
    //    }
    //    else if(indexPath.row == 1)
    //    {
    //        [_StartedBtn setTitle:@"THANK YOU" forState:UIControlStateNormal];
    //    }
    //    else
    //    {
    //        [_StartedBtn setTitle:@"GET STARTED" forState:UIControlStateNormal];
    //    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return Arr1.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseIdentifier = @"FirstCollectionViewCell";
    
    PHQ9CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.SubmitBtnobj.hidden=YES;
    cell.thankulbl.hidden=YES;
    // cell.backgroundimg.image = [UIImage imageNamed:[Arrayimage objectAtIndex:indexPath.row]];
    cell.Questionlbl.text = [Arr1 objectAtIndex:indexPath.row];
    cell.BSAlbl.text = [Arr2 objectAtIndex:indexPath.row];
    question=cell.Questionlbl.text;
    questionA=cell.BSAlbl.text;
    cell.SubmitBtnobj.tag = indexPath.row;
    [cell.SubmitBtnobj addTarget:self action:@selector(SubmitAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.skipBtnobj.tag = indexPath.row;
    [cell.skipBtnobj addTarget:self action:@selector(SkipAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.Homebtnobj.tag = indexPath.row;
    [cell.Homebtnobj addTarget:self action:@selector(HomeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
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
    
    
    
    int lastindex=[Arr2 count]-1;
    
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
        cell.btn3lbl.hidden=YES;
        cell.btn4lbl.hidden=YES;
        cell.headerlbl.hidden=YES;
        cell.skipbacklbl.hidden=YES;
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
        else if (indexPath.row == 8)
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
            // cell.skipbacklbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
            _pagecontrol.hidden=NO;
            //cell.skipBtnobj.hidden=NO;
            
        }
        else
        {
            
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
            cell.skipbacklbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
            _pagecontrol.hidden=NO;
            cell.skipBtnobj.hidden=NO;
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




-(void)HomeBtnAction : (UIButton *) btn
{
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr2:@"feed"];
    [self.navigationController pushViewController:FVC animated:YES];
    
}

-(void)SkipAction : (UIButton *) btn
{
    
    _pagecontrol.currentPage = btn.tag;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 9;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        if (lastIndex==5)
        {
           // btn.hidden=YES;
            
        }
        if (nextIndex > lastIndex) {
            
            // [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        } else {
            [_introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    });
    
}



-(void) BackBtnAction : (UIButton *) btn
{
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 9;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
        
        if (previousIndex < firstIndex) {
            
            //            [_introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        else {
            [_introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            _pagecontrol.currentPage = btn.tag;

           
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
    [paramDict setValue:count1 forKey:@"LittleInterest"];
    [paramDict setValue:count2 forKey:@"FeelingDown"];
    [paramDict setValue:count3 forKey:@"TroubleFalling"];
    [paramDict setValue:count4 forKey:@"FeelingTired"];
    [paramDict setValue:count5 forKey:@"PoorAppetite"];
    [paramDict setValue:count6 forKey:@"FeelingBad"];
     [paramDict setValue:count7 forKey:@"TroubleConcentrating"];
    [paramDict setValue:count8 forKey:@"MovingSpeaking"];
    [paramDict setValue:count9 forKey:@"ThoughtsThat"];
    [paramDict setValue:@"2" forKey:@"ScaleType"];
    
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"UserId"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"scale" :dict :paramDict];
    
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"scale"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
        
            
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT"
//                                                            message:[responseDictionary valueForKey:@"status_message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//            alert.tag = 1009;
//            [alert show];
          
            
            if ([[responseDictionary valueForKey:@"additional_Ques"] integerValue]==1)
            {
                Bs3ViewController *FVC=[[Bs3ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"2"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];
            }
            else
            {
                BS1ViewController *FVC=[[BS1ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"2"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];

            }
            
            
            
            
 
 //            FeedViewController *FVC=[[FeedViewController alloc]init];
//            [FVC setStr2:@"feed"];
//            [self.navigationController pushViewController:FVC animated:YES];
            
            //                if ([[responseDictionary  valueForKey:@"Count"] integerValue] <5)
            //                {
            //
            //                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good news"
            //                                                                    message:@"minimal depression"
            //                                                                   delegate:self
            //                                                          cancelButtonTitle:@"OK"
            //                                                           otherButtonTitles:nil];
            //                    alert.tag = 1009;
            //                    [alert show];
            //                }
            //                else if ([[responseDictionary  valueForKey:@"Count"] integerValue] >=5 && [[responseDictionary  valueForKey:@"Count"] integerValue] <10)
            //                {
            //                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You scored between 5 – 9 on the anxiety scale"
            //                                                                    message:@"mild depression"
            //                                                                   delegate:self
            //                                                          cancelButtonTitle:@"OK"
            //                                                           otherButtonTitles:nil];
            //                    alert.tag = 1009;
            //                    [alert show];
            //                }
            //
            //
            //
            //                else  if ([[responseDictionary  valueForKey:@"Count"] integerValue] >10 && [[responseDictionary  valueForKey:@"Count"] integerValue] <=14)
            //                {
            //
            //                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You scored between 10 – 14 and may be experiencing some anxiety right now"
            //                                                                    message:@"moderate depression"
            //                                                                   delegate:self
            //                                                          cancelButtonTitle:@"OK"
            //
            //                                                          otherButtonTitles:nil];
            //                    alert.tag = 1009;
            //                    [alert show];
            //                }
            //                else  if ([[responseDictionary  valueForKey:@"Count"] integerValue] >14 && [[responseDictionary  valueForKey:@"Count"] integerValue] <20)
            //                {
            //
            //
            //
            //                    //                Bs3ViewController *FVC=[[Bs3ViewController alloc]init];
            //                    //               // [FVC setStr2:@"feed"];
            //                    //                [self.navigationController pushViewController:FVC animated:YES];
            //
            //
            //
            //                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You"
            //                                                                    message:@"moderately severe depression"
            //                                                                   delegate:self
            //                                                          cancelButtonTitle:@"OK"
            //
            //                                                          otherButtonTitles:nil];
            //                    alert.tag = 1009;
            //                    [alert show];
            //
            //
            //                }
            //                else  if ([[responseDictionary  valueForKey:@"Count"] integerValue] >=20)
            //                {
            //
            //                    //                Bs3ViewController *FVC=[[Bs3ViewController alloc]init];
            //                    //               // [FVC setStr2:@"feed"];
            //                    //                [self.navigationController pushViewController:FVC animated:YES];
            //
            //                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank You"
            //                                                                    message:@"severe depression"
            //                                                                   delegate:self
            //                                                          cancelButtonTitle:@"OK"
            //
            //                                                          otherButtonTitles:nil];
            //
            //                    alert.tag = 1009;
            //                    [alert show];
            //
            //
            //                }
            
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
    
    //  [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"0";
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"0";
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
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"3";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
            count9=@"3";
    }
    else
    {
        
            count2=@"0";
        
    }
    
    
    // [cell.Btn4obj setSelected:NO];
    
    //    if([check isEqualToString:@"no"])
    //    {
    //
    //        check=@"yes";
    //        flag=YES;
    //
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 9;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            //  [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
    
    // [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"1";
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"1";
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
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"2";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
            count9=@"2";
    }
    else
    {
             count2=@"1";
            
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 9;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            //  [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
    // [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"2";
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"2";
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"1";
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
            count9=@"1";
    }
    else
    {
            count2=@"2";
            
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 9;
        
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
    // [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"3";
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"3";
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"0";
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
        count6=@"0";
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
            count9=@"0";
    }
     else
    {
        count2=@"3";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 9;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            //  [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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

@end
