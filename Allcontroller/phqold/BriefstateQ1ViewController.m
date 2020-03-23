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
#import "GraphView.h"
#import "chattypeViewController.h"
#import "smilepage1ViewController.h"
#import "GraphView1.h"
@interface BriefstateQ1ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *Arr1;
    NSMutableArray *Arr2;
    NSMutableArray *Arr3;
    NSMutableArray *Arr4;
    NSMutableArray *Arr5;
    NSMutableArray *Arr6;
    float someFloat;
       
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
- (void)viewDidLoad {
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
            graphView.backgroundColor = [UIColor clearColor];
            
            GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
               graphView1.backgroundColor = [UIColor clearColor];
            
            
               [self.view_footer1 addSubview:graphView];
            [self.view_footer2 addSubview:graphView1];
      someFloat=0.111111;
    if([_teststatus isEqualToString:@"1"])
    {
        _backbtnobj1.hidden=YES;
    }
    else
    {
        _backbtnobj1.hidden=NO;
    }
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
    flag=NO;
    check=@"no";
    check1=@"no";
    
    check2=@"no";
    
    check3=@"no";
    
    self.navigationController.navigationBar.hidden=YES;
    
    
    //Arr1=[[NSMutableArray alloc]initWithObjects:@"Question 1/9",@"Question 2/9",@"Question 3/9",@"Question 4/9",@"Question 5/9",@"Question 6/9",@"Question 7/9",@"Question 8/9",@"Question 9/9",@"newzealand",@"Thankyou",nil];
    Arr1=[[NSMutableArray alloc]initWithObjects:@"Question 1/9",@"Question 2/9",@"Question 3/9",@"Question 4/9",@"Question 5/9",@"Question 6/9",@"Question 7/9",@"Question 8/9",@"Question 9/9",@"Thankyou",nil];
    
  /*  Arr2=[[NSMutableArray alloc]initWithObjects:@"Little interest or pleasure in doing things",@"Feeling down, depressed,or hopeless",@"Trouble falling asleep or staying asleep",@"Feeling tired or having little energy",@"Poor appetite or overeating",@"Feeling bad about yourself — or that you are a failure or have let yourself or your family down",@"Trouble concentrating on things,such as reading the newspaper or watching television",@"Moving or speaking so slowly that other day people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual",@"Thoughts that you would be better off dead or of hurting yourself in some way",@" ",nil];*/
    
     Arr2=[[NSMutableArray alloc]initWithObjects:@"Little interest or pleasure in doing things",@"Feeling down, depressed,or hopeless",@"Trouble falling asleep or staying asleep",@"Feeling tired or having little energy",@"Poor appetite or overeating",@"Feeling bad about yourself — or that you are a failure or have let yourself or your family down",@"Trouble concentrating on things,such as reading the newspaper or watching television",@"Moving or speaking so slowly that other day people could have noticed? Or the opposite — being so fidgety or restless that you have been moving around a lot more than usual",@"Thoughts that you would be better off dead or of hurting yourself in some way. (Your safety is of utmost importance. If you are concerned about your ability to protect yourself from self-harm, please click on SOS in this app and get help immediately.)",@" ",nil];
    
    // Do any additional setup after loading the view from its nib.
    
    //[self.introcollection registerNib:[UINib nibWithNibName:@"BriefstateCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"IntroCollectioncell"];
    
    //    [self.introcollection registerNib:[UINib nibWithNibName:@"Briefstate1CollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"Intro1"];
    //    [self.introcollection registerNib:[UINib nibWithNibName:@"Briefstate2CollectionViewCell.h" bundle:nil ]forCellWithReuseIdentifier:@"Intro2"];
    //      [self.introcollection registerNib:[UINib nibWithNibName:@"Briefstate2CollectionViewCell.h" bundle:nil ]forCellWithReuseIdentifier:@"Intro3"];
    
    [self.view addSubview:_pagecontrol];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    self.navigationController.navigationBar.hidden=YES;
    // Arrayimage=[NSArray arrayWithObjects:@"welcome (1).jpg",@"thank_you.jpg",@"get_started.jpg",nil];
    //arraylabel=[NSArray arrayWithObjects:@"Search Schools & Colleges because Edubuddy is a right choice",@"Select your Schools and Colleges",@"Apply by one Click on Edubudy And Find Best Result", nil];
    // [self.introcollection registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    [self.introcollection registerNib:[UINib nibWithNibName:@"BriefstateCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
    
    
    [self.introcollection registerNib:[UINib nibWithNibName:@"PHQ9CollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
}
- (void)scrollToPreviousOrNextCell:(NSString *)direction {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
        
        if ([direction isEqualToString:@"Previous"]) {
            
            if (previousIndex < firstIndex) {
                
            } else {
                
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
    cell.newzealantviewobj.hidden=YES;
    // cell.backgroundimg.image = [UIImage imageNamed:[Arrayimage objectAtIndex:indexPath.row]];
    cell.BSAlbl.text = [Arr2 objectAtIndex:indexPath.row];
    question=[Arr1 objectAtIndex:indexPath.row];
    questionA=cell.BSAlbl.text;
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
    
    
    cell.helplinebtnobj.tag = indexPath.row;
    [cell.helplinebtnobj addTarget:self action:@selector(helplineAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.emergencybtnobj.tag = indexPath.row;
    [cell.emergencybtnobj addTarget:self action:@selector(EmergencyAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.suicidebtnobj.tag = indexPath.row;
    [cell.suicidebtnobj addTarget:self action:@selector(suicideAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.youthlinebtnobj.tag = indexPath.row;
    [cell.youthlinebtnobj addTarget:self action:@selector(youthlineAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.depresionbtnobj1.tag = indexPath.row;
    [cell.depresionbtnobj1 addTarget:self action:@selector(depression1Action:) forControlEvents:UIControlEventTouchUpInside];
    cell.depresionbtnobj2.tag = indexPath.row;
    [cell.depresionbtnobj2 addTarget:self action:@selector(depression2Action:) forControlEvents:UIControlEventTouchUpInside];
    cell.healthlinebtnobj.tag = indexPath.row;
    [cell.healthlinebtnobj addTarget:self action:@selector(healthAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.samaritansbtnobj.tag = indexPath.row;
    [cell.samaritansbtnobj addTarget:self action:@selector(samaritonsAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.crisisbtnobj.tag = indexPath.row;
    [cell.crisisbtnobj addTarget:self action:@selector(crisisAction:) forControlEvents:UIControlEventTouchUpInside];
 

    int lastindex=[Arr2 count]-1;
    
    if (indexPath.row == lastindex)
    {
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
        cell.newzealantviewobj.hidden=YES;

        
    }
    else
    {
        
        if (indexPath.row == 0)
        {
            cell.backbtnobj.hidden=YES;
            cell.newzealantviewobj.hidden=YES;

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
            cell.newzealantviewobj.hidden=YES;

            cell.skipBtnobj.hidden=NO;
            cell.skipbacklbl.hidden=YES;
            cell.backbtnobj.hidden=NO;
            cell.BSAlbl.hidden=NO;
            cell.Btn1obj.hidden=NO;
            cell.Btn2obj.hidden=NO;
            cell.Btn3obj.hidden=NO;
            cell.Btn4obj.hidden=NO;
            cell.btn1lbl.hidden=NO;
            cell.btn2lbl.hidden=NO;
            cell.headerlbl.hidden=NO;
            //cell.skipbacklbl.hidden=NO;
            cell.btn3lbl.hidden=NO;
            cell.btn4lbl.hidden=NO;
            cell.SubmitBtnobj.hidden=YES;
            cell.thankulbl.hidden=YES;
            _pagecontrol.hidden=NO;
            //cell.skipBtnobj.hidden=NO;
            
        }
        else if (indexPath.row == 9)
        {
            cell.skipBtnobj.hidden=NO;
            //cell.skipbacklbl.hidden=YES;
            cell.backbtnobj.hidden=NO;
            cell.newzealantviewobj.hidden=YES;
        }
        else
        {
            cell.newzealantviewobj.hidden=YES;

            cell.backbtnobj.hidden=NO;
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

-(void)helplineAction : (UIButton *) btn
{
        NSString *phNo = @"111";
        NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
        if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
            [[UIApplication sharedApplication] openURL:phoneUrl];
        } else
        {
           UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [calert show];
        }
 }
    
-(void)EmergencyAction : (UIButton *) btn
{
    NSString *phNo = @"0800543354";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
-(void)suicideAction : (UIButton *) btn
{
    NSString *phNo = @"0800376633";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
-(void)depression1Action : (UIButton *) btn
{
    NSString *phNo = @"0800111757";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
-(void)depression2Action : (UIButton *) btn
{
    NSString *phNo = @"0800543354";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
-(void)healthAction : (UIButton *) btn
{
    
    NSString *phNo = @"0800611116";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
-(void)samaritonsAction : (UIButton *) btn
{
    NSString *phNo = @"0800726666";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
}
-(void)crisisAction : (UIButton *) btn
{
    NSString *phNo = @"0800920092";
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",phNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView *calert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [calert show];
    }
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
    someFloat = someFloat + 0.111111;
       [_progressview setProgress:someFloat animated:YES];
       
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 10;
        
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        NSInteger nextIndex = [[currentIndex objectAtIndex:0] row] + 1;
        
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForRow:nextIndex inSection:0];
        if (lastIndex==5)
        {
        }
        if (nextIndex > lastIndex) {
        }
        else
        {
           [self.introcollection scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
    });
    
}

-(void) BackBtnAction : (UIButton *) btn
{
    
    someFloat = someFloat - 0.111111;
          [_progressview setProgress:someFloat animated:YES];
         

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
       
        NSArray *currentIndex = [self.introcollection indexPathsForVisibleItems];
        NSInteger previousIndex = [[currentIndex objectAtIndex:0] row] - 1;
        NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:previousIndex inSection:0];
        
        if (previousIndex < firstIndex) {
            

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
    someFloat = someFloat + 0.111111;
     [_progressview setProgress:someFloat animated:YES];
    //  [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
  /*  if ([[Arr1 objectAtIndex:0] isEqualToString:question])
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
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count8=@"0";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count9=@"0";
    }
    else
    {
   
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 10;
        
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
    someFloat = someFloat + 0.111111;
         [_progressview setProgress:someFloat animated:YES];
     
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
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count8=@"1";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count9=@"1";
    }
    else
    {
       // count2=@"1";
        
    }
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 10;
        
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
    someFloat = someFloat + 0.111111;
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
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count8=@"2";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count9=@"2";
    }
    else
    {
       // count2=@"2";
        
    }
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 10;
        
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
    someFloat = someFloat + 0.111111;
       [_progressview setProgress:someFloat animated:YES];
      
    // [btn setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
    
   /* if ([[Arr1 objectAtIndex:0] isEqualToString:question])
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
        
    }*/
    
    
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
    }
    else if ([[Arr1 objectAtIndex:7] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count8=@"3";
    }
    else if ([[Arr1 objectAtIndex:8] isEqualToString:[Arr1 objectAtIndex:btn.tag]])
    {
        count9=@"3";
    }
    else
    {
       // count2=@"3";
        
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger lastIndex = 10;
        
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

@end
