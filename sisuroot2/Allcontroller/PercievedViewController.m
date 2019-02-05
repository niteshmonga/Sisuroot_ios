//
//  PercievedViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 03/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "PercievedViewController.h"
#import "PercievedCollectionViewCell.h"
#import "MyWebserviceManager.h"
#import "FeedViewController.h"
#import "PHQ8ViewController.h"
#import "Bs3ViewController.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
#import "BS1ViewController.h"
#import "UIView+RNActivityView.h"

@interface PercievedViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
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

@implementation PercievedViewController

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
    // Do any additional setup after loading the view from its nib.
    
    flag=NO;
    check=@"no";
    check1=@"no";
    
    check2=@"no";
    
    check3=@"no";
    _thankulbl.hidden=YES;
    
    _SubmitBtnobj.hidden=YES;
    
    self.navigationController.navigationBar.hidden=YES;
    
    Arr1=[[NSMutableArray alloc]initWithObjects:@"Question 1/10",@"Question 2/10",@"Question 3/10",@"Question 4/10",@"Question 5/10",@"Question 6/10",@"Question 7/10",@"Question 8/10",@"Question 9/10",@"Question 10/10",@"Question 10/10",nil];
    Arr2=[[NSMutableArray alloc]initWithObjects:@"been upset because of something that happened unexpectedly?",@"felt that you were unable to control the important things in your life?",@"felt nervous and “stressed”?",@"felt confident about your ability to handle your personal problems?",@"felt that things were going your way?",
          @"found that you could not cope with all the things that you had to do?",@"Been able to control irritations in your life?",@"felt that you were on top of things?",@"been angered because of things that were outside of your control?",@"felt difficulties were piling up so high that you could not overcome them?",@"Submit",nil];
    
    
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
    
    [_introcollection registerNib:[UINib nibWithNibName:@"PercievedCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
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
        
        if ([direction isEqualToString:@"Previous"])
        {
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
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 5)
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
    
    return Arr2.count;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseIdentifier = @"FirstCollectionViewCell";
    
     PercievedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // cell.backgroundimg.image = [UIImage imageNamed:[Arrayimage objectAtIndex:indexPath.row]];
    cell.SubmitBtnobj.hidden=YES;
    cell.thankulbl.hidden=YES;
    cell.scorelbl.hidden=YES;
    
     cell.Questionlbl.text = [Arr1 objectAtIndex:indexPath.row];
    cell.BSAlbl.text = [Arr2 objectAtIndex:indexPath.row];
    questionA= cell.BSAlbl.text;
    
    question=cell.Questionlbl.text;
    cell.SubmitBtnobj.tag = indexPath.row;
    [cell.SubmitBtnobj addTarget:self action:@selector(SubmitAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.Homebtnobj.tag = indexPath.row;
    [cell.Homebtnobj addTarget:self action:@selector(HomeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
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
    
    cell.Btn5obj.tag = indexPath.row;
    
    [cell.Btn5obj addTarget:self action:@selector(btn5Action:) forControlEvents:UIControlEventTouchUpInside];
    
 
     int lastindex=[Arr1 count]-1;
    
    if (indexPath.row == lastindex)
    {
        cell.backbtnobj.hidden=NO;
        cell.Questionlbl.hidden=YES;
        cell.BSAlbl.hidden=YES;
        cell.Btn1obj.hidden=YES;
        cell.Btn2obj.hidden=YES;
        cell.Btn3obj.hidden=YES;
        cell.Btn4obj.hidden=YES;
        cell.Btn5obj.hidden=YES;
        cell.btn1lbl.hidden=YES;
        cell.btn2lbl.hidden=YES;
        cell.btn3lbl.hidden=YES;
        cell.btn4lbl.hidden=YES;
        cell.btn5lbl.hidden=YES;
        cell.headerlbl.hidden=YES;
        cell.skipbacklbl.hidden=YES;
        cell.SubmitBtnobj.hidden=NO;
        cell.thankulbl.hidden=NO;
        cell.scorelbl.hidden=NO;
         _pagecontrol.hidden=NO;
        cell.skipBtnobj.hidden=YES;
    }
    else
    {
        _pagecontrol.hidden=NO;

        if (indexPath.row == 0)
        {
            
            cell.backbtnobj.hidden=YES;
            cell.Questionlbl.hidden=NO;
            cell.BSAlbl.hidden=NO;
            cell.Btn1obj.hidden=NO;
            cell.Btn2obj.hidden=NO;
            cell.Btn3obj.hidden=NO;
            cell.Btn4obj.hidden=NO;
            cell.Btn5obj.hidden=NO;
            cell.btn1lbl.hidden=NO;
            cell.btn2lbl.hidden=NO;
            cell.headerlbl.hidden=NO;
            cell.skipbacklbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.btn5lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
            _pagecontrol.hidden=NO;
            cell.skipBtnobj.hidden=NO;
            
        }
        else if (indexPath.row == 9)
        {
             cell.skipBtnobj.hidden=YES;
            cell.skipbacklbl.hidden=YES;
            cell.Questionlbl.hidden=NO;
            cell.BSAlbl.hidden=NO;
            cell.Btn1obj.hidden=NO;
            cell.Btn2obj.hidden=NO;
            cell.Btn3obj.hidden=NO;
            cell.Btn4obj.hidden=NO;
            cell.Btn5obj.hidden=NO;
            cell.btn1lbl.hidden=NO;
            cell.btn2lbl.hidden=NO;
            cell.headerlbl.hidden=NO;
            // cell.skipbacklbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.btn5lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
            _pagecontrol.hidden=NO;
            cell.backbtnobj.hidden=NO;
        }
        else
        {
            
            cell.skipBtnobj.hidden=NO;
            cell.skipbacklbl.hidden=NO;
             cell.Questionlbl.hidden=NO;
            cell.BSAlbl.hidden=NO;
            cell.Btn1obj.hidden=NO;
            cell.Btn2obj.hidden=NO;
            cell.Btn3obj.hidden=NO;
            cell.Btn4obj.hidden=NO;
            cell.Btn5obj.hidden=NO;
            cell.btn1lbl.hidden=NO;
            cell.btn2lbl.hidden=NO;
            cell.headerlbl.hidden=NO;
            // cell.skipbacklbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.btn5lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
            _pagecontrol.hidden=NO;
            cell.backbtnobj.hidden=NO;
        }
         //cell.skipBtnobj.hidden=NO;
        
    }
    
    selectedIndex = indexPath.row;
    NSDictionary *dict = [selectedIndexArray objectAtIndex:indexPath.row];
    if([[dict valueForKey:@"selectedvalue"] integerValue] == 1)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 2)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 3)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 4)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 5)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        
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
    //flag=0;
 
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




-(void) BackBtnAction : (UIButton *) btn
{
    //flag=1;
   
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
 
        if (previousIndex < firstIndex) {
            
            // [_introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        }
        else {
            [_introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            [_introcollection reloadData];
            
            // _pagecontrol.currentPage = currentIndex1;
        }
    });

//    CGFloat prevPageX = _introcollection.frame.size.width * MAX(_pagecontrol.currentPage, 0);
//    [_introcollection setContentOffset:CGPointMake(prevPageX, 0) animated:YES];
    //NSLog(@"NewPage: %ld", (long)_pagecontrol.currentPage);
    
}

-(void)SubmitAction : (UIButton *) btn
{
    
    [self.view showActivityViewWithLabel:@"Loading"];

    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"scale" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:count1 forKey:@"HappenedUnexpectedly"];
    [paramDict setValue:count2 forKey:@"ControlTheImportantThings"];
    [paramDict setValue:count3 forKey:@"FeltNervous"];
    [paramDict setValue:count4 forKey:@"PersonalProblems"];
    [paramDict setValue:count5 forKey:@"FeltThatThings"];
    [paramDict setValue:count6 forKey:@"CouldNotCope"];
    [paramDict setValue:count7 forKey:@"ControlIrritations"];
    [paramDict setValue:count8 forKey:@"OnTopOfThings"];
    [paramDict setValue:count9 forKey:@"HaveBeenAngered"];
    [paramDict setValue:count10 forKey:@"FeltDifficulties"];
    
    [paramDict setValue:@"3" forKey:@"ScaleType"];
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
                [FVC setScaletype:@"3"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];
            }
            else
            {
                BS1ViewController *FVC=[[BS1ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"3"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];
                
            }
            
            
          
            
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
    
    // [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"0";
    }
    else if ([[Arr1 objectAtIndex:1] isEqualToString:question])
    {
        count2=@"0";
    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"4";
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"0";
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:question])
    {
        count5=@"4";
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:question])
    {
        count6=@"4";
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:question])
    {
        count7=@"4";
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"4";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
        count9=@"4";
    }
    else
    {
        count10=@"4";
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
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
    else if ([[Arr1 objectAtIndex:1] isEqualToString:question])
    {
        count2=@"1";
    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"3";
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"1";
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
        count10=@"3";
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        
        if (nextIndex > lastIndex) {
            [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
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
    //  [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"2";
    }
    else if ([[Arr1 objectAtIndex:1] isEqualToString:question])
    {
        count2=@"2";
    }
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
        count10=@"2";
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
    //  [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"3";
    }
    if ([[Arr1 objectAtIndex:1] isEqualToString:question])
    {
         count2=@"3";
    }
     else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"1";
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"3";
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
        count10=@"1";
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        //        if (lastIndex==9)
        //        {
        //            btn.hidden=YES;
        //        }
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
- (IBAction)SubmitbtnAction:(id)sender {
}

-(void)btn5Action : (UIButton *) btn
{
    
    //[btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"4";
    }
    if ([[Arr1 objectAtIndex:1] isEqualToString:question])
    {
        count2=@"4";
    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"0";
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"4";
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
        count10=@"0";
    }
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *firstIndexPath = [NSIndexPath indexPathForRow:firstIndex inSection:0];
        //        if (lastIndex==9)
        //        {
        //            btn.hidden=YES;
        //        }
        if (nextIndex > lastIndex) {
            // [_introcollection scrollToItemAtIndexPath:firstIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        } else {
            [_introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    });
    NSMutableDictionary *localDict = [[NSMutableDictionary alloc] init];
    localDict = [selectedIndexArray objectAtIndex:btn.tag];
    
    [localDict setValue:@"5" forKey:@"selectedvalue"];
    [localDict setValue:[NSString stringWithFormat:@"%d",btn.tag] forKey:@"selectedindex"];
    
    [localDict setValue:btn.titleLabel.text forKey:@"value"];
    [selectedIndexArray replaceObjectAtIndex:btn.tag withObject:localDict];
    
}

@end
