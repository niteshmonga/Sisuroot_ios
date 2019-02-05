//
//  Tag_ProfileViewController.m
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 22/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import "Tag_ProfileViewController.h"
#import "SWRevealViewController.h"
#import "UIImageView+WebCache.h"
#import "MyWebserviceManager.h"
#import "Base64.h"
#import "ShareViewController.h"
#import "ProfileViewController.h"
#import "EmotionCollectionViewCell.h"
#import "UIView+RNActivityView.h"
#import "Bs3ViewController.h"
#import "BS1ViewController.h"
#import <AVFoundation/AVFoundation.h>

//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface Tag_ProfileViewController ()
{
    NSMutableArray *fetcharr;
    BOOL flag;
    NSMutableArray *Earr;
    AVAudioPlayer *audioPlayer;
    NSString *voicestr;
}

@end

@implementation Tag_ProfileViewController
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    
    return YES;
}
-(void)viewDidAppear:(BOOL)animated
{
    _ShareViewobj.hidden=YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view showActivityViewWithLabel:@"Loading"];
    //    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
    //    [tracker set:kGAIScreenName value:@"tag_profile Screen"];
    //    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    _ShareViewobj.hidden=YES;
 
    //_CircleBtnobj.hidden=YES;
   // [self callEmotionlist];
     flag=1;
    if ([_sharestr isEqualToString:@"Share"])
    {
        if ([_voicestr111 isEqualToString:@"voicestrboth"])
        {
            _voiceBtnobj.hidden=NO;
            _Emotionlbl.hidden=NO;
        }
        else if ([_voicestr111 isEqualToString:@"voicestr"])
        {
            _voiceBtnobj.hidden=NO;
            _Emotionlbl.hidden=YES;
        }
        else
        {
            _voiceBtnobj.hidden=YES;
            _Emotionlbl.hidden=NO;


        }
        _CircleBtnobj.hidden=NO;
        //    _MenuBtnobj.hidden=NO;
        [self calltagdetail];
        
        
    }
    if ([_sharestr isEqualToString:@"Shared"])
    {
        _CircleBtnobj.hidden=NO;
        //    _MenuBtnobj.hidden=NO;
        [self calltagdetail];
        
    }
    _Commentlinelbl.layer.cornerRadius=10;
    _Commentlinelbl.clipsToBounds=YES;
    _Commentlinelbl.layer.borderWidth =0.5f;

    _Tagimg.layer.cornerRadius=10;
    _Tagimg.clipsToBounds=YES;
    
   // _Tagimg.layer.borderWidth =2;
 
    _Profileimg.layer.cornerRadius=10;
    _Profileimg.clipsToBounds=YES;
    
    _Profileimg.layer.borderWidth =2;
    _Profileimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    [self.CommentTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    // [_CircleBtnobj addTarget:self action:@selector(publicBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer *tapOnce = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapOnce:)];
    UITapGestureRecognizer *tapTwice = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapTwice:)];
    // UITapGestureRecognizer *tapTrice = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapTrice:)];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [_CircleBtnobj addGestureRecognizer:longPress];
    // [longPress release];
    
    tapOnce.numberOfTapsRequired = 1;
    tapTwice.numberOfTapsRequired = 2;
    // tapTrice.numberOfTapsRequired = 3;
    //stops tapOnce from overriding tapTwice
    [tapOnce requireGestureRecognizerToFail:tapTwice];
    //[tapTwice requireGestureRecognizerToFail:tapTrice];
    
    [self.CircleBtnobj addGestureRecognizer:tapOnce];
    [self.CircleBtnobj addGestureRecognizer:tapTwice];
    
    [_EmotionCollectionViewobj registerNib:[UINib nibWithNibName:@"EmotionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"EmotionCollectionViewCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
     return [Earr count];
    
 }

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/3, 45);
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"EmotionCollectionViewCell";
    EmotionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //        [cell.mproductimg setImageWithURL:[NSString stringWithFormat:@"http://swadeshiayurved.com/admin/admin/category_image/%@",[[arr objectAtIndex:indexPath.row]valueForKey:@"cat_image"]]placeholderImage:nil];
    //
    //cell.Emotion2lbl.text=[[Earr objectAtIndex:indexPath.row] valueForKey:@"with_emotion"];
    if([[[Earr objectAtIndex:indexPath.row] valueForKey:@"VALUE"] integerValue]==1)
    {
        cell.Emotion2lbl.text=[[Earr objectAtIndex:indexPath.row] valueForKey:@"with_emotion"];
        
    }
    else
    {
        cell.Emotion2lbl.text=[[Earr objectAtIndex:indexPath.row] valueForKey:@"with_emotion"];
        cell.Emotion2lbl.textColor = [UIColor colorWithRed:(203/255.f) green:(133/255.f) blue:(64/255.f) alpha:1.0];
        
    }
    if ([[[Earr objectAtIndex:indexPath.row] valueForKey:@"with_emotion"] isEqualToString:@""])
    {
        cell.Emotion2lbl.text=@"None";
    }
    
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    ViewController *pvc=[[ViewController alloc]init];
    //    [self.navigationController pushViewController:pvc animated:YES];
    
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
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.CommentTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 170)animated:YES];
    }
    
    else
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 37)animated:YES];
        [_CommentTF endEditing:YES];
        
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(textField==self.CommentTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 20)animated:YES];
    }
    else
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 37)animated:YES];
        [_CommentTF endEditing:YES];
        
    }
    return YES;
}

-(void)calltagdetail
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"singleTag" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [dict1 setValue:_str11 forKey:@"tag_id"];
    [dict1 setValue:_str12 forKey:@"friend_username"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"singleTag":dict :dict1];
    
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"singleTag"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [self.view hideActivityView];
            
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Not Found"])
            {
                NSLog(@"data not found");
            }
            else
            {
                //                    if ( [[[[responseDictionary valueForKey:@"data"] objectAtIndex:0]valueForKey:@"username"] isEqualToString:_str12]) {
                //
                //                        _CircleBtnobj.hidden=NO;
                //
                //                    }
                //                    else
                //                    {
                //                        _CircleBtnobj.hidden=YES;
                //
                //                    }
                
                // _Usernamelbl.text = [[responseDictionary valueForKey:@"data"] valueForKey:@"username"];
                
                _Usernamelbl.text = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0]valueForKey:@"username"];
                 _latestemotionnamelbl.text = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0]valueForKey:@"emotionLatest"];
                
                if ([_voicestr111 isEqualToString:@"voicestrboth"])
                {
                     voicestr=[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"emotionName"];
                    _Emotionlbl.text = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"emotion_txt"];
                }
                else if ([_voicestr111 isEqualToString:@"voicestr"])
                {
                    voicestr=[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"emotionName"];
                    _Emotionlbl.text=@"None";

                }
                else
                {
                    _Emotionlbl.text = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"emotion_txt"];
                    _Emotionlbl.frame = CGRectMake(130, 122, 148, 31);

                }
                
                
                _Commentstmtlbl.text = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"comment"];
                if ([_Commentstmtlbl.text isEqualToString:@""])
                {
                    _Commentstmtlbl.text=@"No Comments..";
                }
                _str3=[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tag_id"];
                
                NSString *imgStr = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0]valueForKey:@"profile_img"];
                
                
                if ([imgStr isEqual:(id)[NSNull null]] ||[imgStr isEqualToString:@""])
                {
                    _Profileimg.image = [UIImage imageNamed:@"user.png"];
                    
                }
                else
                {
                    if([[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"img_status"] integerValue] == 1)
                        
                    {
                        
                        [_Profileimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"profile_img"]]] placeholderImage:nil];
                        _Profileimg.contentMode=UIViewContentModeScaleToFill;
                    }
                    else
                    {
                        [_Profileimg setImageWithURL:[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"profile_img"]placeholderImage:nil];
                        _Profileimg.contentMode=UIViewContentModeScaleToFill;
                    }
                    
                    
                }
                
                NSString *imgStr1 = [[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tagImg"];
                
                
                if ([imgStr1 isEqual:(id)[NSNull null]] || imgStr1.length < 1 )
                {
                    _Tagimg.image = [UIImage imageNamed:@" "];
                    
                }
                else
                {
                    
                    
                    [_Tagimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/tag_photo/realimage/%@",[[[responseDictionary valueForKey:@"data"] objectAtIndex:0] valueForKey:@"tagImg"]]] placeholderImage:nil];
                    _Tagimg.contentMode=UIViewContentModeScaleToFill;
                    
                    
                }
                
                
            }
            
            
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"updateTag"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            //            ActivityIdenter.hidden=YES;
            //            _indcatorlbl.hidden=YES;
            ProfileViewController *PVC=[[ProfileViewController alloc]init];
            [self.navigationController pushViewController:PVC animated:YES];
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"listOfEmotionOnTag"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            
            if([[responseDictionary valueForKey:@"data"] isEqual:(id)[NSNull null]])
            {
                
            }
            else
            {
                Earr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
                
            }
            
            [_EmotionCollectionViewobj reloadData];
        }
    }
    
}





- (IBAction)BackBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)PostBtnAction:(id)sender {
}
- (IBAction)LikeBtn:(id)sender {
}
- (IBAction)CommentBtn:(id)sender {
}
- (IBAction)ShareBtn:(id)sender {
    //    if (flag==1)
    //    {
    //        flag=0;
    
    //_ShareViewobj.hidden=NO;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Share In?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Inner",@"Outer", nil];
    [actionSheet setTag:6];
    //  yourActionSheet.delegate = self;
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    
    [actionSheet showInView:self.view];
    
    //}
    //    else{
    //        flag=1;
    //        _ShareViewobj.hidden=YES;
    //
    //    }
}
- (IBAction)InnerBtnAction:(id)sender {
    //    ShareViewController *SVC=[[ShareViewController alloc]init];
    //    [SVC setStr1:@"one"];
    //    [SVC setStr2:_str3];
    //    [self.navigationController pushViewController:SVC animated:YES];
    //
    
}
- (IBAction)OuterBtnAction:(id)sender {
    //    ShareViewController *SVC=[[ShareViewController alloc]init];
    //    [SVC setStr4:@"Two"];
    //    [SVC setStr2:_str3];
    //
    //    [self.navigationController pushViewController:SVC animated:YES];
    //
    
}
- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateEnded ) {
        NSLog(@"Long Press");
        
        [_CircleBtnobj setImage:[UIImage imageNamed:@"both_circle-green150.png"] forState:UIControlStateNormal];
        // [_CircleBtnobj setSelected:YES];
        
        //                ActivityIdenter.hidden = NO;
        //                [ActivityIdenter startAnimating];
        // _indcatorlbl.hidden=NO;
        
        [self CallTagEmotioninandout];
        [_CircleBtnobj setEnabled:NO];
        
        //  [_BackBtnobj setEnabled:NO];
        //  [_HomeBtnobj setEnabled:NO];
    }
}

- (void)tapOnce:(UIGestureRecognizer *)gesture
{
    
    
    //  if (public==false) {
    
    [_CircleBtnobj setImage:[UIImage imageNamed:@"inner_circle_green150.png"] forState:UIControlStateNormal];
    //Navigate here
    NSLog(@"epikso");
    // [_CircleBtnobj setSelected:YES];
    
    
    //            ActivityIdenter.hidden = NO;
    //            [ActivityIdenter startAnimating];
    //   _indcatorlbl.hidden=NO;
    
    [self CallInnerTagEmotion];
    
    [_CircleBtnobj setEnabled:NO];
    
    
    
    
    
}

- (void)tapTwice:(UIGestureRecognizer *)gesture
{
    
    [_CircleBtnobj setImage:[UIImage imageNamed:@"outer_circle_green150.png"] forState:UIControlStateNormal];
    // [_CircleBtnobj setSelected:YES];
 
    NSLog(@"india");
    //            ActivityIdenter.hidden = NO;
    //            [ActivityIdenter startAnimating];
    //            _indcatorlbl.hidden=NO;
    
    [self CallTagEmotionouter];
    [_CircleBtnobj setEnabled:NO];
    //            [_BackBtnobj setEnabled:NO];
    //            [_HomeBtnobj setEnabled:NO];
    
}

-(void)CallTagEmotionouter
 {
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"updateTag" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [paramDict setValue:_str3 forKey:@"tag_id"];
    
    [paramDict setValue:@"2" forKey:@"Tag_circle"];
 
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"updateTag" :dict :paramDict];
    
}

-(void)CallInnerTagEmotion
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"updateTag" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [paramDict setValue:_str3 forKey:@"tag_id"];
    
    [paramDict setValue:@"1" forKey:@"Tag_circle"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"updateTag" :dict :paramDict];
}

-(void)CallTagEmotioninandout
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"updateTag" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [paramDict setValue:_str3 forKey:@"tag_id"];
    
    [paramDict setValue:@"3" forKey:@"Tag_circle"];
 
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"updateTag" :dict :paramDict];
}

- (IBAction)CircleBtnAction:(id)sender
{
    
}

-(void)callEmotionlist
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"listOfEmotionOnTag" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [paramDict setValue:_str11 forKey:@"tag_id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"listOfEmotionOnTag" :dict :paramDict];
}

-(void)actionSheet:(UIActionSheet *)profileactionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    switch (buttonIndex)
    {
        case 0:
        {
            ShareViewController *SVC=[[ShareViewController alloc]init];
            [SVC setStr1:@"one"];
            [SVC setStr2:_str3];
            [self.navigationController pushViewController:SVC animated:YES];
        }
            //            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            //            {
            //                imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
            //                [self presentModalViewController:imagePicker animated:YES];
            //            }
            break;
        case 1:
        {
            ShareViewController *SVC=[[ShareViewController alloc]init];
            [SVC setStr4:@"Two"];
            [SVC setStr2:_str3];
            [self.navigationController pushViewController:SVC animated:YES];
            
        }
            break;
        default:
            break;
    }
}
- (IBAction)SosBtnAction:(id)sender {
    BS1ViewController *SVC=[[BS1ViewController alloc]init];
    //  [SVC setStr4:@"Two"];
    //[SVC setStr2:_str3];
    [self.navigationController pushViewController:SVC animated:YES];
}




- (IBAction)innerCircleBtnAction:(id)sender
{
    ShareViewController *SVC=[[ShareViewController alloc]init];
    [SVC setStr1:@"one"];
    [SVC setStr2:_str3];
    [self.navigationController pushViewController:SVC animated:YES];
}



- (IBAction)outerCircleBtnAction:(id)sender
{
    ShareViewController *SVC=[[ShareViewController alloc]init];
    [SVC setStr4:@"Two"];
    [SVC setStr2:_str3];
    [self.navigationController pushViewController:SVC animated:YES];
    
}


- (IBAction)VoiceBtnAction:(id)sender
{
    if (audioPlayer.playing)
    {
        [audioPlayer stop];
        [_voiceBtnobj setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
        
    }
    else
    {
        NSString *voicename=voicestr;
        NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
        NSURL *url = [NSURL URLWithString:mainUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
        [audioPlayer play];
        audioPlayer.delegate = self;
        
        [_voiceBtnobj setBackgroundImage:[UIImage imageNamed:@"pause_button_green.png"] forState:UIControlStateNormal];
    }
}
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    [audioPlayer stop];
    [_voiceBtnobj setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                    message: @"Finish playing the recording!"
                                                   delegate: nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

@end

