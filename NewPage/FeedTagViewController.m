

#import "FeedTagViewController.h"
#import "FeedViewController.h"
#import "ListTableViewCell.h"
#import "EmotionCollectionViewCell.h"
#import "AppDelegate.h"
#import "FriendsViewController.h"
#import "SettingViewController.h"
#import "UIImageView+WebCache.h"
#import "MyWebserviceManager.h"
#import "Base64.h"
#import "ViewController.h"
#import "GalleryViewController.h"
#import "SWRevealViewController.h"
#import "UIView+RNActivityView.h"
#import "Tag_ProfileViewController.h"
#import "ChatViewController.h"
#import "ChatfriendViewController.h"
#import "ResponseViewController.h"
#import "BriefstateViewController.h"
#import "BS1ViewController.h"
#import "EditViewController.h"
#import <sys/utsname.h>
#import "Reachability.h"
#import <GoogleAnalytics/GAI.h>
#import <GoogleAnalytics/GAIDictionaryBuilder.h>
#import <GoogleAnalytics/GAIFields.h>
#import "GAITrackedViewController.h"
#import "BriefstateQ1ViewController.h"
#import "DemoGraphicViewController.h"
#import "DemoOtherViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import "SCLAlertView.h"
#import "smilepage1ViewController.h"
#import "GraphView.h"
#import "chattypeViewController.h"
#import "GraphView1.h"
#import "Sisuroot-Swift.h"
#import "FeedTagCollectionViewCell.h"
#import "LoginViewController.h"
#import "ShareViewController.h"
@interface FeedTagViewController ()
{
    NSMutableArray *imgdata;
       NSMutableDictionary *alldata;
       AVAudioPlayer *audioPlayer;
    NSString *imgstrtagid;
      NSString *imgstruname;
    NSString *selpost;
    NSString *sel_table;
    NSString *selcircle;
    NSString *innercount;
       NSString *outercount;
       NSString *sel_circle;
}
@end

@implementation FeedTagViewController

- (IBAction)btn_can_source_type:(id)sender {
    _viewsourcetype.hidden=YES;
}
- (IBAction)btn_new_post:(id)sender {
    _viewsourcetype.hidden=NO;
}
- (IBAction)cancel_new_post:(id)sender {
    _view_shar1.hidden=YES;
     _view_share2.hidden=YES;
}
- (IBAction)btn_share_post2:(id)sender {
}
- (IBAction)btn_share_post:(id)sender {
   
}
- (IBAction)btn_private_post:(id)sender {
    selpost=@"Private";
    _view_shar1.hidden=YES;
    _view_share2.hidden=NO;
    
}
- (IBAction)btn_public_post:(id)sender {
     selpost=@"Public";
       _view_shar1.hidden=NO;
       _view_share2.hidden=YES;
}
- (IBAction)tbl_public:(id)sender {
    sel_table=@"Public";
    publicdata = [alldata valueForKey:@"public_data"];
      [_tbl_private setImage:[UIImage imageNamed:@"Ellipse 808.png"] forState:UIControlStateNormal];
      [_tbl_pub setImage:[UIImage imageNamed:@"Ellipse 807.png"] forState:UIControlStateNormal];
    _tbl_private.contentMode=UIViewContentModeScaleToFill;
    arrdata=publicdata;
    [_tbl_pub_private reloadData];
}
- (IBAction)tbl_private:(id)sender {
     sel_table=@"Private";
      [_tbl_private setImage:[UIImage imageNamed:@"Ellipse 807.png"] forState:UIControlStateNormal];
      [_tbl_pub setImage:[UIImage imageNamed:@"Ellipse 808.png"] forState:UIControlStateNormal];
     privatedata = [alldata valueForKey:@"private_data"];
     _tbl_private.contentMode=UIViewContentModeScaleToFill;
    arrdata=privatedata;
    [_tbl_pub_private reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return imgdata.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
          return CGSizeMake(110, 150);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 330;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    imgstrtagid=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tag_id"];
    imgstruname=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"username"];
    if ([imgstruname isEqualToString:_usernamestr])
        {
            
            NSString *fstr=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
            NSString *f1str=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotionName"];
            
            ShareViewController *SVC=[[ShareViewController alloc]init];
            [SVC setStr2:imgstrtagid];
            [SVC setStr_img:[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tagImg"]];
             [self.navigationController pushViewController:SVC animated:YES];
            
//
//            if (fstr.length >1 && f1str.length >1)
//            {
//                Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
//
//                [dcv setStr11:[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
//                [dcv setStr12:imgstruname];
//                [dcv setSharestr:@"Share"];
//                [dcv setVoicestr111:@"voicestrboth"];
//
//                [self.navigationController pushViewController:dcv animated:YES];
//            }
//            else if ([f1str isEqual:[NSNull null]] || f1str.length <1)
//            {
//
//                Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
//
//                [dcv setStr11:[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
//                [dcv setStr12:imgstruname];
//                [dcv setSharestr:@"Share"];
//                [self.navigationController pushViewController:dcv animated:YES];
//            }
//            else if ([fstr isEqual:[NSNull null]] || fstr.length <1)
//            {
//                Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
//
//                [dcv setStr11:[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
//                [dcv setStr12:imgstruname];
//                [dcv setSharestr:@"Share"];
//                [dcv setVoicestr111:@"voicestr"];
//
//                [self.navigationController pushViewController:dcv animated:YES];
//            }
            
        }
        else
        {
            if ([[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tagging_status"] isEqual:@"1"])
            {
                ViewController *VC1=[[ViewController alloc]init];
                
                [VC1 setTagmestr:@"tagged"];
                [VC1 setDatestrarr:[arrdata objectAtIndex:indexPath.row]];

                [VC1 setStr11:[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                [self.navigationController pushViewController:VC1 animated:YES];
            }
            else
            {
                ViewController *VC1=[[ViewController alloc]init];
                [VC1 setTagmestr:@"tagme"];
                [VC1 setDatestrarr:[arrdata objectAtIndex:indexPath.row]];
                [VC1 setStr11:[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tag_id"]];
                [self.navigationController pushViewController:VC1 animated:YES];
             }
        }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrdata.count;
}
-(void)btn_like : (UIButton *) btn
{
    if([[[arrdata objectAtIndex:btn.tag]valueForKey:@"tagLike_status"] isEqual:@"1"])
    {
        
    }
    else
    {
       [self calllike: [[arrdata objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
    }
    
//    if (_btn_fav.currentImage == [UIImage imageNamed:@"heart.png"])
//                {
//                           [self callviewWebservice:[[_arr_ques1 valueForKey:@"id"] objectAtIndex:bgselect]];
//                            [self.btn_fav setImage:[UIImage imageNamed:@"favorite-heart-button.png"] forState:UIControlStateNormal];
//                            NSInteger b = [self.lbl_like.text integerValue];
//                            b++;
//                            self.lbl_like.text=[NSString stringWithFormat:@"%li", (long)b];
//                            [self callThisWebservice];
//                }
}

-(void)calllike:(NSString *)tagid
{
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:SS"];
   
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"like" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"user_id"];
    [dict1 setValue:tagid forKey:@"tag_id"];
    [dict1 setValue:[dateFormatter stringFromDate:currentDate] forKey:@"datetime"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"tags_like" :dict :dict1];
}

-(void)EmotionAction : (UIButton *) btn
{
    [self.view showActivityViewWithLabel:@"Loading"];
    if (audioPlayer.playing)
        {
            _indicatorviewobj.hidden=YES;
            [audioPlayer stop];
            [btn setBackgroundImage:[UIImage imageNamed:@"play_button_white.png"] forState:UIControlStateNormal];
             [self.view hideActivityView];
        }
        else
        {
           // _indicatorviewobj.hidden=NO;
            [_indicatorview startAnimating];

            NSString *voicename=[[arrdata objectAtIndex:btn.tag]valueForKey:@"emotionName"];
           // NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
             NSString *mainUrl =[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"EmotionAudio/",voicename];
            
            NSURL *url = [NSURL URLWithString:mainUrl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
            [audioPlayer play];
             [self.view hideActivityView];
            audioPlayer.delegate = self;
            [btn setBackgroundImage:[UIImage imageNamed:@"pause_button_white.png"] forState:UIControlStateNormal];
            
        //    [_indicatorview stopAnimating];

      // _indicatorviewobj.hidden=YES;
            
        }
 }
- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
    [audioPlayer stop];
    [_tbl_pub_private reloadData];
    //[_voiceBtnobj setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                    message: @"Finish playing the recording!"
                                                   delegate: nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

-(void)OtherEmotionAction : (UIButton *) btn
{
    [self.view showActivityViewWithLabel:@"Loading"];
    if (audioPlayer.playing)
    {
        _indicatorviewobj.hidden=YES;
        [audioPlayer stop];
        [btn setBackgroundImage:[UIImage imageNamed:@"play_button_green.png"] forState:UIControlStateNormal];
         [self.view hideActivityView];
    }
    else
    {
        //_indicatorviewobj.hidden=NO;
        [_indicatorview startAnimating];

        NSString *voicename=[[arrdata objectAtIndex:btn.tag]valueForKey:@"emotionLatest"];
        //NSString *mainUrl = [NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/EmotionAudio/%@",voicename];
         NSString *mainUrl =[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"EmotionAudio/",voicename];
        NSURL *url = [NSURL URLWithString:mainUrl];
        NSData *data = [NSData dataWithContentsOfURL:url];
        audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:nil];
         [audioPlayer play];
          audioPlayer.delegate = self;
        
         [btn setBackgroundImage:[UIImage imageNamed:@"pause_button_green.png"] forState:UIControlStateNormal];
        [_indicatorview stopAnimating];
         [self.view hideActivityView];
        if([btn.currentImage isEqual:[UIImage imageNamed:@"pause_button_green.png"]])
        {
            //[self.view hideActivityView];
        }
        //_indicatorviewobj.hidden=YES;
     }
    
 }

-(void)btn_add_contact  : (UIButton *) btn
{
 _requestid= [[arrdata objectAtIndex:btn.tag]valueForKey:@"id"];
        if([[[arrdata objectAtIndex:btn.tag]valueForKey:@"friend_request_send_status"]integerValue]==1)
        {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Friend request already send" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//            [alert show];
        }
        else
        {
            UIAlertView *alertcrp=[[UIAlertView alloc]initWithTitle:@"SISUROOT" message:@"Do you want to send friend request?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:nil];
                            [alertcrp addButtonWithTitle:@"YES"];
                           alertcrp.tag=12;
                           [alertcrp show];
        }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    static NSString *simpleTableIdentifier = @"ListtableView";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];

    cell.activityobj.hidden=YES;
    cell.EmotionBtnobj.tag = indexPath.row;
    [cell.EmotionBtnobj addTarget:self action:@selector(EmotionAction:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.OtherEmoBtnobj.tag = indexPath.row;
    cell.btn_like.tag = indexPath.row;
    cell.lbl_like.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tagLike_count"];
    
    if(![[[arrdata objectAtIndex:indexPath.row]valueForKey:@"id"] isEqualToString:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]])
    {
    if( [[[arrdata objectAtIndex:indexPath.row]valueForKey:@"friend_request_send_status"] integerValue]==1)
    {
        [cell.btnaddcontact setBackgroundImage:[UIImage imageNamed:@"add-a-contact-on-phone-interface-symbol-of-a-user-with-a-plus-sign (1).png"] forState:UIControlStateNormal];
        cell.btnaddcontact.tag = indexPath.row;
        [cell.btnaddcontact addTarget:self action:@selector(btn_add_contact:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else if([[[arrdata objectAtIndex:indexPath.row]valueForKey:@"myfriend_status"]integerValue]==0)
    {
        [cell.btnaddcontact setBackgroundImage:[UIImage imageNamed:@"add-a-contact-on-phone-interface-symbol-of-a-user-with-a-plus-sign (2).png"] forState:UIControlStateNormal];
        cell.btnaddcontact.tag = indexPath.row;
        [cell.btnaddcontact addTarget:self action:@selector(btn_add_contact:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else
    {
        cell.btnaddcontact.hidden=YES;
    }
    }
    
    
    
    if([[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tagLike_status"] isEqual:@"1"])
     {
         [cell.btn_like setImage:[UIImage imageNamed:@"favorite-heart-button.png"] forState:UIControlStateNormal];
     }
     else
     {
         [cell.btn_like setImage:[UIImage imageNamed:@"heart.png"] forState:UIControlStateNormal];
     }
    
    [cell.OtherEmoBtnobj addTarget:self action:@selector(OtherEmotionAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btn_like addTarget:self action:@selector(btn_like:) forControlEvents:UIControlEventTouchUpInside];
    cell.chatBtnobj.tag = indexPath.row;
    [cell.chatBtnobj addTarget:self action:@selector(ChatAction:) forControlEvents:UIControlEventTouchUpInside];
       
    NSString *userstr2=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"username"];
    if ( [userstr2 isEqualToString:_usernamestr]) {
            //[cell.EmotionBtnobj setTitle:[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotionName"] forState:UIControlStateNormal];
        NSString *countstr11=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
        if ([countstr11 isEqual:(id)[NSNull null]] || countstr11.length <1)
            {
                // cell.EmotionBtnlblobj.text=@"";
                cell.EmotionBtnlblobj.hidden=YES;
            }
            else
            {
                cell.EmotionBtnlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotion_txt"];
            }
            NSString *countstr12=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotionName"];

            if ([countstr12 isEqual:(id)[NSNull null]] || countstr12.length <1)
            {
                // cell.EmotionBtnlblobj.text=@"";
                cell.EmotionBtnobj.hidden=YES;
            }
            else
            {
                cell.EmotionBtnobj.hidden=NO;
            }
            
            cell.usernamelblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"username"];
            //cell.usernamelblobj.textColor=[UIColor orangeColor];
            cell.shareimg.hidden = YES;
            cell.share1img.hidden = NO;
            cell.inviteBtnobj.hidden=NO;

            cell.taggedimg.hidden=YES;
            cell.backlbl.layer.cornerRadius=10;
            cell.backlbl.clipsToBounds=YES;
            cell.chatBtnobj.hidden=YES;
            
            NSString *countstr2=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
            
            if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
            {
                cell.OtherEmoBtnlblobj.text=@"None";
            }
            else
            {
                cell.OtherEmoBtnlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
            }
            
            NSString *countstr3=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
            
            if ([countstr3 isEqual:(id)[NSNull null]] || countstr3.length < 1)
            {
                cell.OtherEmoBtnobj.hidden=YES;
                CGRect frame = cell.OtherEmoBtnlblobj.frame;
                                   frame.origin.x= cell.OtherEmoBtnlblobj.frame.origin.x - 25;
                                   cell.OtherEmoBtnlblobj.frame= frame;
            }
            else
            {
                cell.OtherEmoBtnobj.hidden=NO;
            }
            NSString *commentstr=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
            if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
            {
                NSString *commentstr=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"comment"];
                if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
                {
                    cell.Liststmtlblobj.text=@"No Comments";
                }
                else
                {
                    cell.Liststmtlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"comment"];
                }
            }
            else
            {
                cell.Liststmtlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
            }
            
        }
        else
        {
            
            cell.chatBtnobj.hidden=NO;
           // cell.inviteBtnobj.frame = CGRectMake(319.0, 48.0, 25.0, 25.0);
            cell.EmotionBtnlblobj.hidden=YES;
            cell.EmotionBtnobj.hidden=YES;

            // [cell.EmotionBtnobj setTitle:@"Tagme" forState:UIControlStateNormal];
            //[cell.EmotionBtnobj setTitle:@"Tag Me" forState:UIControlStateNormal];
          //  [cell.EmotionBtnobj setBackgroundImage:[UIImage imageNamed:@"tagmeback.png"] forState:UIControlStateNormal];
                       //  cell.Taggedlbl.text=@"Tagged";
            cell.taggedimg.hidden=NO;

            NSString *imgStr3 = [[arrdata objectAtIndex:indexPath.row]valueForKey:@"tagging_status"];
            
            if ([imgStr3 isEqual:(id)[NSNull null]] || [imgStr3 isEqual:@"0"] )
            {
            NSString *commentstr=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
                if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
                {
                    NSString *commentstr=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"comment"];
                    if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
                    {
                        cell.Liststmtlblobj.text=@"No Comments";
                    }
                    else
                    {
                        cell.Liststmtlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"comment"];
                    }
                }
                else
                {
                    cell.Liststmtlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
                }
                
                
                
                
                cell.usernamelblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"username"];
 
                cell.shareimg.image = [UIImage imageNamed:@"tag.png"];
                cell.taggedimg.image = [UIImage imageNamed:@"tag_me1.png"];
                cell.shareimg.hidden = NO;
                cell.share1img.hidden = YES;
                cell.inviteBtnobj.hidden=YES;
                cell.backlbl.layer.cornerRadius=10;
                cell.backlbl.clipsToBounds=YES;
                
                NSString *countstr2=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
                
                if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
                {
                    cell.OtherEmoBtnlblobj.text=@"None";
                }
                else
                {
                    cell.OtherEmoBtnlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
                }
                
                NSString *countstr3=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
                
                if ([countstr3 isEqual:(id)[NSNull null]] || countstr3.length < 1)
                {
                    cell.OtherEmoBtnobj.hidden=YES;
                    CGRect frame = cell.OtherEmoBtnlblobj.frame;
                    frame.origin.x= cell.OtherEmoBtnlblobj.frame.origin.x - 25;
                    cell.OtherEmoBtnlblobj.frame= frame;
                 }
                else
                {
                    cell.OtherEmoBtnobj.hidden=NO;
                }
                
            }
            else
            {
                cell.usernamelblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"username"];
              //  cell.usernamelblobj.textColor=[UIColor blackColor];
                NSString *commentstr=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
                if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
                {
                    NSString *commentstr=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"comment"];
                    if ([commentstr isEqual:(id)[NSNull null]] || commentstr.length < 1 )
                    {
                        cell.Liststmtlblobj.text=@"No Comments";
                    }
                    else
                    {
                        cell.Liststmtlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"comment"];
                    }
                }
                else
                {
                    cell.Liststmtlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"commentLatest"];
                }
                cell.shareimg.image = [UIImage imageNamed:@"tagged.png"];
                 cell.taggedimg.image = [UIImage imageNamed:@"tag_me.png"];
                cell.shareimg.hidden = NO;
                cell.share1img.hidden = YES;
                cell.inviteBtnobj.hidden=YES;
                cell.backlbl.layer.cornerRadius=10;
                cell.backlbl.clipsToBounds=YES;

               NSString *countstr2=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
                
                if ([countstr2 isEqual:(id)[NSNull null]] || countstr2.length < 1)
                {
                    cell.OtherEmoBtnlblobj.text=@"None";
                }
                else
                {
                    cell.OtherEmoBtnlblobj.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"with_emotion_txt"];
                }
                
                NSString *countstr3=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"emotionLatest"];
                
                if ([countstr3 isEqual:(id)[NSNull null]] || countstr3.length < 1)
                {
                   cell.OtherEmoBtnobj.hidden=YES;
                    CGRect frame = cell.OtherEmoBtnlblobj.frame;
                    frame.origin.x= cell.OtherEmoBtnlblobj.frame.origin.x - 25;
                    cell.OtherEmoBtnlblobj.frame= frame;
                    
                }
                else
                {
                    cell.OtherEmoBtnobj.hidden=NO;
                    
                }
            }
        }
        [cell.listprofileimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[arrdata objectAtIndex:indexPath.row]valueForKey:@"tagImg"]] placeholderImage:nil];
         cell.listprofileimg.contentMode=UIViewContentModeScaleAspectFill;
        if([[[arrdata objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"1"])
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"inner_circle_green40.png"] forState:UIControlStateNormal];
        }
        else if([[[arrdata objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"2"])
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"outer_circle_green40.png"] forState:UIControlStateNormal];
       }
        else if([[[arrdata objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"3"])
        {
           [cell.inviteBtnobj setImage:[UIImage imageNamed:@"both_circle-green40.png"] forState:UIControlStateNormal];
       }
        else
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"both_circle_golden40.png"] forState:UIControlStateNormal];
            
        }
        
        cell.lbl_time.text=[[arrdata objectAtIndex:indexPath.row]valueForKey:@"date"];
        NSString *imgStr = [[arrdata objectAtIndex:indexPath.row]valueForKey:@"profile_pic"];
        
        if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
        {
            cell.profileimg.image = [UIImage imageNamed:@"user.png"];
            
        }
        //
        else if([[[arrdata objectAtIndex:indexPath.row]valueForKey:@"img_status"] integerValue]==1)
            
        {
            [cell.profileimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[arrdata objectAtIndex:indexPath.row]valueForKey:@"profile_pic"]]] placeholderImage:nil];
            cell.profileimg.contentMode=UIViewContentModeScaleToFill;
        }
        else
        {
            
            [cell.profileimg setImageWithURL:[[arrdata objectAtIndex:indexPath.row]valueForKey:@"profile_pic"] placeholderImage:nil];
            cell.profileimg.contentMode=UIViewContentModeScaleToFill;
        }
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
         static NSString *identifier = @"FeedTagCollectionViewCell";
         FeedTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
         cell.taglabel.text=  [[imgdata objectAtIndex:indexPath.row] valueForKey:@"username"];
         cell.tagimage.contentMode=UIViewContentModeScaleToFill;
         [cell.tagimage setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",[[imgdata objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
    
         if([[[imgdata objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"1"])
         {
             cell.circleimg.image =[UIImage imageNamed:@"Group 372.png"];
         }
         else if([[[imgdata objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"2"])
         {
             cell.circleimg.image =[UIImage imageNamed:@"Group 374.png"];
         }
         else if([[[imgdata objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"3"])
         {
           cell.circleimg.image =[UIImage imageNamed:@"Group 373.png"];
         }
         else
         {
           cell.circleimg.image =[UIImage imageNamed:@"both_circle_golden40.png"];
         }
         cell.tagimage.layer.cornerRadius= 20;
         return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
      //  FeedTagViewController *VC1=[[FeedTagViewController alloc]init];
       //   [self.navigationController pushViewController:VC1 animated:YES];
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

- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnfaq:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnfaqchat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)SosBtnAction:(id)sender {
    BS1ViewController *BSVC=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:BSVC animated:YES];
}

- (void)viewDidLoad {
      _view_add_new_conaact.hidden=YES;
    _usernamestr=[[NSUserDefaults standardUserDefaults] valueForKey:@"username"];
     _viewsourcetype.hidden=YES;
    _can1.layer.borderColor= UIColor.whiteColor.CGColor;
      _can1.layer.borderWidth=1.0;
      _can1.layer.cornerRadius=5;
      _can1.clipsToBounds=YES;
     [self createborder:_viewinner];
     sel_table=@"Public";
    sel_circle=@"Inner";
     [_collectview registerNib:[UINib nibWithNibName:@"FeedTagCollectionViewCell" bundle:nil ]forCellWithReuseIdentifier:@"FeedTagCollectionViewCell"];
   _cancel_new_post1.layer.borderColor= UIColor.whiteColor.CGColor;
    _cancel_new_post1.layer.borderWidth=1.0;
    _cancel_new_post1.layer.cornerRadius=5;
    _cancel_new_post1.clipsToBounds=YES;
    _cancel_new_post2.layer.borderColor= UIColor.whiteColor.CGColor;
    _cancel_new_post2.layer.borderWidth=1.0;
    _cancel_new_post2.layer.cornerRadius=5;
    _cancel_new_post2.clipsToBounds=YES;
    _view11.layer.cornerRadius=10;
    _view11.clipsToBounds=YES;
              _viewsourcetypein.layer.cornerRadius=10;
               _viewsourcetypein.clipsToBounds=YES;
    //_view22.layer.borderColor= UIColor.whiteColor.CGColor;
    //_view22.layer.borderWidth=1.0;
    _view22.layer.cornerRadius=10;
    _view22.clipsToBounds=YES;
    _view_shar1.hidden=YES;
     _view_share2.hidden=YES;
    [super viewDidLoad];
  
    _indicatorviewobj.hidden=YES;
      _indicatorviewobj.layer.cornerRadius=10;
      _indicatorviewobj.clipsToBounds=YES;
      
    
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];

      graphView.backgroundColor = [UIColor clearColor];
         
         GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
            graphView1.backgroundColor = [UIColor clearColor];
         
         
            [self.view_footer1 addSubview:graphView];
         [self.view_footer2 addSubview:graphView1];

    // Do any additional setup after loading the view from its nib.
}
- (IBAction)BackBtnAction:(id)sender {
    FeedViewController *VC1=[[FeedViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
   // [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)btncamera:(id)sender {
    
        _view_camera.backgroundColor=[UIColor colorWithRed:(170.0/255.0) green:(229.0/255) blue:(255.0/255) alpha:1];
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
        [self presentModalViewController:imagePicker animated:YES];
}

- (IBAction)btngallery:(id)sender {
     _view_gallery.backgroundColor=[UIColor colorWithRed:(170.0/255.0) green:(229.0/255) blue:(255.0/255) alpha:1];
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
                    
        if (status == PHAuthorizationStatusAuthorized)
        {
           imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
           [self presentModalViewController:imagePicker animated:YES];
        }
        else if (status == PHAuthorizationStatusDenied) {
        }
        else if (status == PHAuthorizationStatusNotDetermined) {
                        
                        // Access has not been determined.
                [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                            
                            if (status == PHAuthorizationStatusAuthorized) {
                                // Access has been granted.
                                imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                                 [self presentModalViewController:imagePicker animated:YES];
                            }
                            
                            else {
                                // Access has been denied.
                            }
                        }];
                    }
                    
                    else if (status == PHAuthorizationStatusRestricted) {
                        // Restricted access - normally won't happen.
                    }
    }

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
        
        if(alertView.tag == 2000)
        {
            EditViewController *Hgn= [[EditViewController alloc]init];
             [self.navigationController pushViewController:Hgn animated:YES];
            
        }
        else
            if(alertView.tag == 2001)
            {
                BriefstateViewController *bsvc=[[BriefstateViewController alloc]init];
                [bsvc setIdentifystr:@"done1"];
                bsvc.teststatus=@"1";
               [self.navigationController pushViewController:bsvc animated:YES];
                
            }
            else if (alertView.tag == 2009)
            {
                [self.view showActivityViewWithLabel:@"Loading"];
                                    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                                    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                                    [dict setValue:@"friendRequest" forKey:@"name"];
                
                                    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                
                                    [dict1 setValue:_requestid forKey:@"requestToId"];
                
                                    [dict1 setValue:@"1" forKey:@"circle"];
                                    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                                    [dict1 setValue:@"1" forKey:@"friend_request_type"];
                                    [webServiceManager setDelegateMethode:self];
                                    [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
            
//
//                [self.view showActivityViewWithLabel:@"Loading"];
//                MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//                NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//                [dict setValue:@"friendRequest" forKey:@"name"];
//
//                NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
//
//                    [dict1 setValue:_requestid forKey:@"requestToId"];
//
//                [dict1 setValue:@"1" forKey:@"circle"];
//                [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
//                [dict1 setValue:@"1" forKey:@"friend_request_type"];
//                [webServiceManager setDelegateMethode:self];
//                [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
                
            }
        else
        {
            
        }
    }
    else
    {
        if (alertView.tag == 2009)
        {
            SettingViewController *svc=[[SettingViewController alloc]init];
            [self.navigationController pushViewController:svc animated:YES];
            [svc setStr1:@"done"];
            
            [self.view showActivityViewWithLabel:@"Loading"];
            MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
            [dict setValue:@"friendRequest" forKey:@"name"];
            
            NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
            [dict1 setValue:_requestid forKey:@"requestToId"];
            [dict1 setValue:@"1" forKey:@"circle"];
            [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
            [dict1 setValue:@"1" forKey:@"friend_request_type"];
            [webServiceManager setDelegateMethode:self];
            [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
        }
       
        else if(alertView.tag==12)
        {
             _view_add_new_conaact.hidden=NO;
            
//            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Inner" otherButtonTitles:@"Outer",nil];
//                      [actionSheet setTag:6];
//                      actionSheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
//                       [actionSheet showInView:self.view];
        }
    }
 }


-(void)actionSheet:(UIActionSheet *)profileactionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
       switch (buttonIndex)
        {
            case 0:
            {
                if ([innercount integerValue] >=25)
                {
                    /* UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You Exceeded the Limit to add friend in Inner Circle" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];*/
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have 7 friends in your inner circle. Please remove a user from your inner circle to add more." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alert show];
                }
                else
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT!" message:@"Do you want to share your red flags with your inner circle?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                    alert.tag=2009;
                    [alert show];
//                    [self.view showActivityViewWithLabel:@"Loading"];
//                    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//                    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//                    [dict setValue:@"friendRequest" forKey:@"name"];
//
//                    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
//
//                    [dict1 setValue:_requestid forKey:@"requestToId"];
//
//                    [dict1 setValue:@"1" forKey:@"circle"];
//                    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
//                    [dict1 setValue:@"1" forKey:@"friend_request_type"];
//                    [webServiceManager setDelegateMethode:self];
//                    [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
                    
                }
            }
                break;
            case 1:
            {
                if ([outercount integerValue] >=25)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have 25 friends in your outer circle. Please remove a user from your outer circle to add more." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                   [alert show];
                }
                else
                {
                    [self.view showActivityViewWithLabel:@"Loading"];
                    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                    [dict setValue:@"friendRequest" forKey:@"name"];
                    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                    [dict1 setValue:@"2" forKey:@"circle"];
                    [dict1 setValue:_requestid forKey:@"requestToId"];
                    [dict1 setValue:@"1" forKey:@"friend_request_type"];
                    [webServiceManager setDelegateMethode:self];
                    [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
                }
            }
             break;
            case 2:
            {
            }
            break;
            default:
                break;
        }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self.view hideActivityView];
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    CGFloat scale = 1.00f;
    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width/2,newSize.height/2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *originalImage = info[UIImagePickerControllerEditedImage];
    // UIImage *originalImage = [info objectForKey:@"UIImagePickerControllerCropRect"];
    CGSize destinationSize1 = CGSizeMake(200, 200);
    UIGraphicsBeginImageContext(destinationSize1);
    [originalImage drawInRect:CGRectMake(0,0,destinationSize1.width,destinationSize1.height)];
    UIImage *newImage1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // _Backgroundimg.image = newImage1;
    NSData *daataa = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
    base64_encoded_image =  [Base64 encode:daataa];
    NSDate *dtTime = [NSDate date];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
    imageNameStr = [df stringFromDate:dtTime];
    NSArray *arra = [imageNameStr componentsSeparatedByString:@" "];
    imageNameStr = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
    // [picker dismissModalViewControllerAnimated:YES];
    ViewController *Tvc=[[ViewController alloc]init];
    [Tvc setBackimg:newImage1];
    [Tvc setImageNameStr1:imageNameStr];
    [Tvc setBase64_encoded_image1:base64_encoded_image];
    [Tvc setDetailstr:@"done"];
    
    [self.navigationController pushViewController:Tvc animated:YES];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
         _viewsourcetype.hidden=YES;
    
    [self.view showActivityViewWithLabel:@"Loading"];
    [self callTaglist];
    [self callTaglist1];
    [_tbl_pub_private reloadData];
       
}
-(void)callTaglist1
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"feedListing1" forKey:@"name"];

    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
     //[dict1 setValue:@"403" forKey:@"id"];
  [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"feed-listing2" :dict :dict1];

}
-(void)callTaglist
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"feedListing" forKey:@"name"];

    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    // [dict1 setValue:@"403" forKey:@"id"];
  [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"feedListing" :dict :dict1];

}

-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    NSLog(@"error");
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"feedListing"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"All tags listing"])
            {
                imgdata =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            }
            else
            {
            }
            [_collectview reloadData];
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"feedListing1"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
              [self.view hideActivityView];
            if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"All tags listing"])
            {
               alldata = [[NSMutableDictionary alloc]init];
               [alldata setDictionary:[responseDictionary valueForKey:@"data"]];
                if([sel_table isEqualToString:@"Public"])
                {
                 arrdata=[[NSMutableArray alloc]initWithArray:[[responseDictionary valueForKey:@"data"] valueForKey:@"public_data"]];
                }
                else
                {
                     arrdata=[[NSMutableArray alloc]initWithArray:[[responseDictionary valueForKey:@"data"] valueForKey:@"private_data"]];
                }
             //   arrdata=[[NSMutableArray alloc]initWithArray:[[responseDictionary valueForKey:@"data"] valueForKey:@"public_data"]];
                privatedata = [alldata valueForKey:@"private_data"];
            }
            else
            {
            }
            [_tbl_pub_private reloadData];
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"like"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
             [self.view showActivityViewWithLabel:@"Loading"];
             [self callTaglist1];
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"friendRequest"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
             SCLAlertView *alert = [[SCLAlertView alloc] init];
            
            UIColor *color = [UIColor colorWithRed:255.0/255.0 green:124.0/255.0 blue:0.0/255.0 alpha:1.0];
            [alert showCustom:self image:[UIImage imageNamed:@"root_app_v7 1.png"] color:color title:@"Sisuroot" subTitle:[responseDictionary valueForKey:@"status_message"] closeButtonTitle:@"OK" duration:0.0f];
            _view_add_new_conaact.hidden=YES;
             [self callTaglist1];
            
        }
    }
}
- (IBAction)btn_inner:(id)sender {
    sel_circle=@"Inner";
    _btn_inner.titleLabel.textColor = [UIColor  whiteColor];
     _btn_outer.titleLabel.textColor = [UIColor  blackColor];
    [self createborder:_viewinner];
    _viewouter.backgroundColor =[UIColor clearColor];
}
-(void)createborder:(UIView *)view11
{
    view11.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
      UIBezierPath *maskPath = [UIBezierPath
          bezierPathWithRoundedRect:view11.bounds
          byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
          cornerRadii:CGSizeMake(20, 20)
      ];
      CAShapeLayer *maskLayer = [CAShapeLayer layer];
      maskLayer.frame = view11.bounds;
      maskLayer.path = maskPath.CGPath;
      view11.layer.mask = maskLayer;
}

- (IBAction)btn_outer:(id)sender {
    _btn_inner.titleLabel.textColor = [UIColor  blackColor];
     _btn_outer.titleLabel.textColor = [UIColor  whiteColor];
     sel_circle=@"Outer";
    _viewouter.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
     UIBezierPath *maskPath = [UIBezierPath
         bezierPathWithRoundedRect:_viewouter.bounds
         byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
         cornerRadii:CGSizeMake(20, 20)
     ];

     CAShapeLayer *maskLayer = [CAShapeLayer layer];

     maskLayer.frame = _viewouter.bounds;
     maskLayer.path = maskPath.CGPath;

     _viewouter.layer.mask = maskLayer;
    _viewinner.backgroundColor =[UIColor clearColor];
}

- (IBAction)cancel_Add_contact:(id)sender {
    _view_add_new_conaact.hidden=YES;
}


- (IBAction)addtonewcontactbtnclick:(id)sender
{
   if([sel_circle isEqualToString:@"Inner"])
    {
                    if ([innercount integerValue] >=25)
                    {
                        /* UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You Exceeded the Limit to add friend in Inner Circle" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];*/
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have 7 friends in your inner circle. Please remove a user from your inner circle to add more." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                        [alert show];
                    }
                    else
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT!" message:@"Do you want to share your red flags with your inner circle?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
                        alert.tag=2009;
                        [alert show];
    //                    [self.view showActivityViewWithLabel:@"Loading"];
    //                    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    //                    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    //                    [dict setValue:@"friendRequest" forKey:@"name"];
    //
    //                    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    //
    //                    [dict1 setValue:_requestid forKey:@"requestToId"];
    //
    //                    [dict1 setValue:@"1" forKey:@"circle"];
    //                    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
    //                    [dict1 setValue:@"1" forKey:@"friend_request_type"];
    //                    [webServiceManager setDelegateMethode:self];
    //                    [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
                        
                    }
                }
            else  if([sel_circle isEqualToString:@"Outer"])
            {
                if ([outercount integerValue] >=25)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"You have 25 friends in your outer circle. Please remove a user from your outer circle to add more." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                   [alert show];
                }
                else
                {
                    [self.view showActivityViewWithLabel:@"Loading"];
                    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
                    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
                    [dict setValue:@"friendRequest" forKey:@"name"];
                    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
                    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"requestFromId"];
                    [dict1 setValue:@"2" forKey:@"circle"];
                    [dict1 setValue:_requestid forKey:@"requestToId"];
                    [dict1 setValue:@"1" forKey:@"friend_request_type"];
                    [webServiceManager setDelegateMethode:self];
                    [webServiceManager callMyWebServiceManager:@"friendRequest":dict :dict1];
                }
            }
}


@end
