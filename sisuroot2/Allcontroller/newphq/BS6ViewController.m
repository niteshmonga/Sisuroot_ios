//
//  BS6ViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "BS6ViewController.h"
#import "TutorialCollectionViewCell.h"
#import "MyWebserviceManager.h"
#import "FrontViewController.h"
#import "DemoGraphicViewController.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
#import "MyWebserviceManager.h"
#import "DemoOtherViewController.h"

@interface BS6ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableDictionary *strarr;
    NSMutableArray *strarr1;
    NSMutableArray *newarr;
    NSMutableArray *messages;
    NSString *str;
    NSString *text;
    NSString *text1;
    NSString *senderidlbl;
    NSString *receiveridlbl;
    UILabel *label1;
    UILabel *label2;
}
@end

@implementation BS6ViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.hidden=YES;
    
    strarr1=[[NSMutableArray alloc]initWithObjects:@"home_screen.jpg",@"9-Home-Settings.jpg",@"test.jpg",@"sos.jpg",@"8-Home-Setting.jpg",@"inner-circle.jpg",@"Outer-Circle.jpg",@"Sisuchat (1).jpg",@"chats.jpg",nil];
 
     if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
     [_introcollection registerNib:[UINib nibWithNibName:@"TutorialCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FirstCollectionViewCell"];
}
- (void)scrollToPreviousOrNextCell:(NSString *)direction {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^ {
        
        NSInteger firstIndex = 0;
        NSInteger lastIndex = 8;
        
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
     return strarr1.count;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *reuseIdentifier = @"FirstCollectionViewCell";
    
     TutorialCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 8)
    {
        cell.skipBtnobj.hidden=NO;
    }
    
    int lastindex=[strarr1 count]-1;
    
    if (indexPath.row == lastindex)
    {
        cell.skipBtnobj.hidden=NO;
        [cell.skipBtnobj setTitle:@"Finish" forState:UIControlStateNormal];

     }
    else
    {
        cell.skipBtnobj.hidden=NO;

    }
      cell.backgroundimg.image = [UIImage imageNamed:[strarr1 objectAtIndex:indexPath.row]];
    
    // cell.backgroundimg.image = [strarr objectAtIndex:indexPath.row];
 
     cell.skipBtnobj.tag = indexPath.row;
    [cell.skipBtnobj addTarget:self action:@selector(SkipAction:) forControlEvents:UIControlEventTouchUpInside];
    
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
    [self callfetchprofile];

//        DemoGraphicViewController *fvc=[[DemoGraphicViewController alloc]init];
//        [self.navigationController pushViewController:fvc animated:YES];
 
}


-(void)callfetchprofile
{
 
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
    
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
{
    if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
    {
        
        
        if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] isEqual:@"1"])
        {
//             id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//            [tracker set:kGAIScreenName value:@"Open Demographic form"];
//            [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
            DemoGraphicViewController *EVC=[[DemoGraphicViewController alloc]init];
            [self.navigationController pushViewController:EVC animated:YES];
        }
        
        else if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] isEqual:@"2"])
        {
            DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
            [BSV setTypeString:@"demo1"];
            [BSV setDemostr:@"demostr"];

            [self.navigationController pushViewController:BSV animated:YES];
            
        }
        else if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] isEqual:@"3"])
        {
             DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
            [BSV setTypeString:@"demo2"];
            [BSV setDemostr:@"demostr"];

            [self.navigationController pushViewController:BSV animated:YES];
        }
        
        else if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Dafault_demographic_form_status"] isEqual:@"4"])
        {
            
            DemoOtherViewController *BSV=[[DemoOtherViewController alloc]init];
            [BSV setTypeString:@"demo3"];
            [BSV setDemostr:@"demostr"];

            [self.navigationController pushViewController:BSV animated:YES];
        }
        
       
    }
    
}
}
@end


