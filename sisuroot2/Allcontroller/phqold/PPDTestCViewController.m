//
//  PPDTestCViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 03/09/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "PPDTestCViewController.h"
#import "PPDTest1ViewController.h"
#import "BriefstateViewController.h"
#import "BriefstateCollectionViewCell.h"
#import <Foundation/Foundation.h>
#import "PHQ9CollectionViewCell.h"
#import "MyWebserviceManager.h"
#import "FeedViewController.h"
#import "PHQ8ViewController.h"
#import "Bs3ViewController.h"
#import "PPDTestCCollectionViewCell.h"
#import "BS1ViewController.h"
#import "UIView+RNActivityView.h"

@interface PPDTestCViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *Arr1;
    NSMutableArray *Arr2;
    NSMutableArray *Arr3;
    NSMutableArray *Arr4;
    NSMutableArray *Arr5;
    NSMutableArray *Arr6;
    NSMutableArray *imgArr1;
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
    
    NSString *count8;
    NSString *count9;
    NSString *count10;
    NSString *count11;
    NSString *count12;
    NSString *count13;
    NSString *count14;
    NSString *count15;
    NSString *count16;
    NSString *count17;
    NSString *count18;
    NSString *count19;
    NSString *count20;
    
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

@implementation PPDTestCViewController

- (void)viewDidLoad {
    
    selectedIndexArray = [[NSMutableArray alloc] init];
    for(int i =0 ; i < 21; i++)
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
    Arr1=[[NSMutableArray alloc]initWithObjects:@"Question 1/20",@"Question 2/20",@"Question 3/20",@"Question 4/20",@"Question 5/20",@"Question 6/20",@"Question 7/20",@"Question 8/20",@"Question 9/20",@"Question 10/20",@"Question 11/20",@"Question 12/20",@"Question 13/20",@"Question 14/20",@"Question 15/20",@"Question 16/20",@"Question 17/20",@"Question 18/20",@"Question 19/20",@"Question 20/20",@"Thank You",nil];
    
    Arr2=[[NSMutableArray alloc]initWithObjects:@"I feel comfortable in the presence of strangers..",@"I am in tune with the world.",@" Even among my friends, there is no sense of brother/sisterhood.",@"I fit in well in new situations..",@"I feel close to people..",@"I feel disconnected from the world around me..",@"Even around people I know, I don't feel that I really belong..",@"I see people as friendly and approachable..",@"I feel like an outsider..",@"I feel understood by the people I know..",@"I feel distant from people.. ",@"I am able to relate to my peers..",@"I have little sense of togetherness with my peers..",@"I find myself actively involved in people’s lives..",@"I catch myself losing a sense of connectedness with society..",@"I am able to connect with other people..",@"I see myself as a loner..",@"I don’t feel related to most people..",@"My friends feel like family..",@"I don't feel I participate with anyone or any group..",@" ",nil];
    
    [self.view addSubview:_pagecontrol];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.navigationController.navigationBar.hidden=YES;
    // Arrayimage=[NSArray arrayWithObjects:@"welcome (1).jpg",@"thank_you.jpg",@"get_started.jpg",nil];
    //arraylabel=[NSArray arrayWithObjects:@"Search Schools & Colleges because Edubuddy is a right choice",@"Select your Schools and Colleges",@"Apply by one Click on Edubudy And Find Best Result", nil];
    // [_introcollection registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    [_introcollection registerNib:[UINib nibWithNibName:@"PPDTestCCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    
    
    // [_introcollection registerNib:[UINib nibWithNibName:@"PHQ9CollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollToPreviousOrNextCell:(NSString *)direction {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 20;
        
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
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 5)
    {
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 6)
    {
        
    }
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseIdentifier = @"FirstCollectionViewCell";
    
    PPDTestCCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
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
    
    cell.Btn5obj.tag = indexPath.row;
    [cell.Btn5obj addTarget:self action:@selector(btn5Action:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.Btn6obj.tag = indexPath.row;
    [cell.Btn6obj addTarget:self action:@selector(btn6Action:) forControlEvents:UIControlEventTouchUpInside];
    
    
    int lastindex=[Arr1 count]-1;
    
    if (indexPath.row == lastindex)
    {
        cell.Questionlbl.hidden=YES;
        cell.BSAlbl.hidden=YES;
        cell.Btn1obj.hidden=YES;
        cell.Btn2obj.hidden=YES;
        cell.Btn3obj.hidden=YES;
        cell.Btn4obj.hidden=YES;
        cell.Btn5obj.hidden=YES;
        cell.Btn6obj.hidden=YES;
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
            cell.Btn5obj.hidden=NO;
            cell.Btn6obj.hidden=NO;
            
        }
        else if (indexPath.row == 19)
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
            cell.Btn5obj.hidden=NO;
            cell.Btn6obj.hidden=NO;
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
            cell.Btn5obj.hidden=NO;
            cell.Btn6obj.hidden=NO;
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
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn6obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 2)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn6obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 3)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn6obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 4)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn6obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 5)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        [cell.Btn6obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
    }
    else  if([[dict valueForKey:@"selectedvalue"] integerValue] == 6)
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn6obj setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
    }
    else
    {
        [cell.Btn1obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn2obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn3obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn4obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn5obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
        [cell.Btn6obj setBackgroundImage:[UIImage imageNamed:@"Questionw.png"] forState:UIControlStateNormal];
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
    
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 20;
        
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
        NSInteger lastIndex = 20;
        NSArray *currentIndex = [_introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
        
        if (previousIndex < firstIndex) {
            
        }
        else {
            
            [_introcollection scrollToItemAtIndexPath:previousIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            [_introcollection reloadData];
            
            //  [_introcollection reloadItemsAtIndexPaths:@[previousIndexPath]];
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
    [paramDict setValue:count1 forKey:@"feelcomfortable"];
    [paramDict setValue:count2 forKey:@"tune"];
    [paramDict setValue:count3 forKey:@"amongmyfriends"];
    [paramDict setValue:count4 forKey:@"newsituations"];
    [paramDict setValue:count5 forKey:@"feelclose"];
    [paramDict setValue:count6 forKey:@"feeldisconnected"];
    [paramDict setValue:count7 forKey:@"aroundpeople"];
    [paramDict setValue:count8 forKey:@"friendlyand"];
    [paramDict setValue:count9 forKey:@"likean"];
    [paramDict setValue:count10 forKey:@"understood"];
    [paramDict setValue:count11 forKey:@"feeldistant"];
    [paramDict setValue:count12 forKey:@"mypeers"];
    [paramDict setValue:count13 forKey:@"togethernesswithmypeers"];
    [paramDict setValue:count14 forKey:@"activelyinvolved"];
    [paramDict setValue:count15 forKey:@"losingasenseof"];
    [paramDict setValue:count16 forKey:@"ableto"];
    [paramDict setValue:count17 forKey:@"myselfasaloner"];
    [paramDict setValue:count18 forKey:@"feelrelated"];
    [paramDict setValue:count19 forKey:@"feellikefamily"];
    [paramDict setValue:count20 forKey:@"feelIparticipatewith"];
    [paramDict setValue:@"1" forKey:@"form_status"];
    [paramDict setValue:@"6" forKey:@"ScaleType"];

    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"UserId"];
    
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] forKey:@"lat"];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"lng"] forKey:@"lng"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"PPDTestSecC" :dict :paramDict];
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"scale"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            
            
            
            if ([[responseDictionary valueForKey:@"additional_Ques"] integerValue]==1)
            {
                Bs3ViewController *FVC=[[Bs3ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"6"];
                [FVC setMsgcheckstr:@"Testmsg"];
                [self.navigationController pushViewController:FVC animated:YES];
            }
            else
            {
                BS1ViewController *FVC=[[BS1ViewController alloc]init];
                [FVC setCountstr:[responseDictionary valueForKey:@"Count"]];
                [FVC setScaletype:@"6"];
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
            ////                                                               delegate:self
            ////                                                      cancelButtonTitle:@"OK"
            ////
            ////                                                      otherButtonTitles:nil];
            ////                alert.tag = 1009;
            ////                [alert show];
            ////
            ////            }
            ////
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
        count1=@"1";
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"1";
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
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"1";
    }
    else if ([[Arr1 objectAtIndex:10] isEqualToString:question])
    {
        count11=@"1";
    }
    else if ([[Arr1 objectAtIndex:11] isEqualToString:question])
    {
        count12=@"1";
    }
    else if ([[Arr1 objectAtIndex:12] isEqualToString:question])
    {
        count13=@"1";
    }else if ([[Arr1 objectAtIndex:13] isEqualToString:question])
    {
        count14=@"1";
    }
    else if ([[Arr1 objectAtIndex:14] isEqualToString:question])
    {
        count15=@"1";
    }
    else if ([[Arr1 objectAtIndex:15] isEqualToString:question])
    {
        count16=@"1";
    }
    else if ([[Arr1 objectAtIndex:16] isEqualToString:question])
    {
        count17=@"1";
    }
    else if ([[Arr1 objectAtIndex:17] isEqualToString:question])
    {
        count18=@"1";
    }else if ([[Arr1 objectAtIndex:18] isEqualToString:question])
    {
        count19=@"1";
    }
    else if ([[Arr1 objectAtIndex:19] isEqualToString:question])
    {
        count20=@"1";
    }
    else
    {
        count2=@"1";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 20;
        
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
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"2";
        
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"2";
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
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"2";
    }
    else if ([[Arr1 objectAtIndex:10] isEqualToString:question])
    {
        count11=@"2";
    }
    else if ([[Arr1 objectAtIndex:11] isEqualToString:question])
    {
        count12=@"2";
    }
    else if ([[Arr1 objectAtIndex:12] isEqualToString:question])
    {
        count13=@"2";
    }else if ([[Arr1 objectAtIndex:13] isEqualToString:question])
    {
        count14=@"2";
    }
    else if ([[Arr1 objectAtIndex:14] isEqualToString:question])
    {
        count15=@"2";
    }
    else if ([[Arr1 objectAtIndex:15] isEqualToString:question])
    {
        count16=@"2";
    }
    else if ([[Arr1 objectAtIndex:16] isEqualToString:question])
    {
        count17=@"2";
    }
    else if ([[Arr1 objectAtIndex:17] isEqualToString:question])
    {
        count18=@"2";
    }else if ([[Arr1 objectAtIndex:18] isEqualToString:question])
    {
        count19=@"2";
    }
    else if ([[Arr1 objectAtIndex:19] isEqualToString:question])
    {
        count20=@"2";
    }
    else
    {
        count2=@"2";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 20;
        
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
        count1=@"3";
        
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"3";
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
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"3";
    }
    else if ([[Arr1 objectAtIndex:10] isEqualToString:question])
    {
        count11=@"3";
    }
    else if ([[Arr1 objectAtIndex:11] isEqualToString:question])
    {
        count12=@"3";
    }
    else if ([[Arr1 objectAtIndex:12] isEqualToString:question])
    {
        count13=@"3";
    }else if ([[Arr1 objectAtIndex:13] isEqualToString:question])
    {
        count14=@"3";
    }
    else if ([[Arr1 objectAtIndex:14] isEqualToString:question])
    {
        count15=@"3";
    }
    else if ([[Arr1 objectAtIndex:15] isEqualToString:question])
    {
        count16=@"3";
    }
    else if ([[Arr1 objectAtIndex:16] isEqualToString:question])
    {
        count17=@"3";
    }
    else if ([[Arr1 objectAtIndex:17] isEqualToString:question])
    {
        count18=@"3";
    }else if ([[Arr1 objectAtIndex:18] isEqualToString:question])
    {
        count19=@"3";
    }
    else if ([[Arr1 objectAtIndex:19] isEqualToString:question])
    {
        count20=@"3";
    }
    else
    {
        count2=@"3";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 20;
        
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
        count1=@"4";
        
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"4";
//
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"4";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"4";
        
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
        [btn setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"4";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
        count9=@"4";
    }
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"4";
    }
    else if ([[Arr1 objectAtIndex:10] isEqualToString:question])
    {
        count11=@"4";
    }
    else if ([[Arr1 objectAtIndex:11] isEqualToString:question])
    {
        count12=@"4";
    }
    else if ([[Arr1 objectAtIndex:12] isEqualToString:question])
    {
        count13=@"4";
    }else if ([[Arr1 objectAtIndex:13] isEqualToString:question])
    {
        count14=@"4";
    }
    else if ([[Arr1 objectAtIndex:14] isEqualToString:question])
    {
        count15=@"4";
    }
    else if ([[Arr1 objectAtIndex:15] isEqualToString:question])
    {
        count16=@"4";
    }
    else if ([[Arr1 objectAtIndex:16] isEqualToString:question])
    {
        count17=@"4";
    }
    else if ([[Arr1 objectAtIndex:17] isEqualToString:question])
    {
        count18=@"4";
    }else if ([[Arr1 objectAtIndex:18] isEqualToString:question])
    {
        count19=@"4";
    }
    else if ([[Arr1 objectAtIndex:19] isEqualToString:question])
    {
        count20=@"4";
    }
    else
    {
        count2=@"4";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 20;
        
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

-(void)btn5Action : (UIButton *) btn
{
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"5";
        
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"5";
//
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"5";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"5";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:question])
    {
        count5=@"5";
        
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:question])
    {
        count6=@"5";
        
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:question])
    {
        count7=@"5";
        [btn setBackgroundImage:[UIImage imageNamed:@"Question.png"] forState:UIControlStateNormal];
        
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"5";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
        count9=@"5";
    }
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"5";
    }
    else if ([[Arr1 objectAtIndex:10] isEqualToString:question])
    {
        count11=@"5";
    }
    else if ([[Arr1 objectAtIndex:11] isEqualToString:question])
    {
        count12=@"5";
    }
    else if ([[Arr1 objectAtIndex:12] isEqualToString:question])
    {
        count13=@"5";
    }else if ([[Arr1 objectAtIndex:13] isEqualToString:question])
    {
        count14=@"5";
    }
    else if ([[Arr1 objectAtIndex:14] isEqualToString:question])
    {
        count15=@"5";
    }
    else if ([[Arr1 objectAtIndex:15] isEqualToString:question])
    {
        count16=@"5";
    }
    else if ([[Arr1 objectAtIndex:16] isEqualToString:question])
    {
        count17=@"5";
    }
    else if ([[Arr1 objectAtIndex:17] isEqualToString:question])
    {
        count18=@"5";
    }else if ([[Arr1 objectAtIndex:18] isEqualToString:question])
    {
        count19=@"5";
    }
    else if ([[Arr1 objectAtIndex:19] isEqualToString:question])
    {
        count20=@"5";
    }
    else
    {
        count2=@"5";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 20;
        
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
    
    [localDict setValue:@"5" forKey:@"selectedvalue"];
    [localDict setValue:[NSString stringWithFormat:@"%d",btn.tag] forKey:@"selectedindex"];
    
    [localDict setValue:btn.titleLabel.text forKey:@"value"];
    [selectedIndexArray replaceObjectAtIndex:btn.tag withObject:localDict];
    
    
}
-(void)btn6Action : (UIButton *) btn
{
    
    if ([[Arr1 objectAtIndex:0] isEqualToString:question])
    {
        count1=@"6";
        
    }
//    else if ([[Arr2 objectAtIndex:1] isEqualToString:questionA])
//    {
//        count2=@"6";
//
//    }
    else if ([[Arr1 objectAtIndex:2] isEqualToString:question])
    {
        count3=@"6";
        
    }
    else if ([[Arr1 objectAtIndex:3] isEqualToString:question])
    {
        count4=@"6";
        
    }
    else if ([[Arr1 objectAtIndex:4] isEqualToString:question])
    {
        count5=@"6";
        
    }
    else if ([[Arr1 objectAtIndex:5] isEqualToString:question])
    {
        count6=@"6";
        
    }
    else if ([[Arr1 objectAtIndex:6] isEqualToString:question])
    {
        count7=@"6";
        
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:question])
    {
        count8=@"6";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:question])
    {
        count9=@"6";
    }
    else if ([[Arr1 objectAtIndex:9] isEqualToString:question])
    {
        count10=@"6";
    }
    else if ([[Arr1 objectAtIndex:10] isEqualToString:question])
    {
        count11=@"6";
    }
    else if ([[Arr1 objectAtIndex:11] isEqualToString:question])
    {
        count12=@"6";
    }
    else if ([[Arr1 objectAtIndex:12] isEqualToString:question])
    {
        count13=@"6";
    }else if ([[Arr1 objectAtIndex:13] isEqualToString:question])
    {
        count14=@" ";
    }
    else if ([[Arr1 objectAtIndex:14] isEqualToString:question])
    {
        count15=@"6";
    }
    else if ([[Arr1 objectAtIndex:15] isEqualToString:question])
    {
        count16=@"6";
    }
    else if ([[Arr1 objectAtIndex:16] isEqualToString:question])
    {
        count17=@"6";
    }
    else if ([[Arr1 objectAtIndex:17] isEqualToString:question])
    {
        count18=@"6";
    }else if ([[Arr1 objectAtIndex:18] isEqualToString:question])
    {
        count19=@"6";
    }
    else if ([[Arr1 objectAtIndex:19] isEqualToString:question])
    {
        count20=@"6";
    }
    else
    {
        count2=@"6";
        
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 20;
        
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
    
    [localDict setValue:@"6" forKey:@"selectedvalue"];
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
