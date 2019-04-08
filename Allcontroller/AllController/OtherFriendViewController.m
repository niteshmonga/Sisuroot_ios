
#import "OtherFriendViewController.h"
#import "ListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "MyWebserviceManager.h"
#import "Base64.h"
#import "SettingViewController.h"
#import "ResponseViewController.h"
#import "ViewController.h"
#import "UIView+RNActivityView.h"
#import "FeedViewController.h"
#import "FriendsViewController.h"
#import "GalleryViewController.h"
#import "ChatfriendViewController.h"
#import "Bs3ViewController.h"
#import "BS1ViewController.h"

//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
//#import "ChatController.h"
#import "ChatViewController.h"
#import "ProfileViewController.h"

@interface OtherFriendViewController ()
{
    NSMutableArray *Earr;
    NSMutableArray *imgArr;
    NSMutableArray *Emotionarr;
    NSArray *countarr;
    NSString *countstr;
    NSMutableDictionary *countdict;
    NSMutableDictionary *tabledata;
    BOOL check;
    
}
@end

@implementation OtherFriendViewController
- (UIStatusBarStyle)preferredStatusBarStyle {
    return  UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
      [FIRAnalytics setScreenName:@"My Profile" screenClass:@"My Profile"];
    
    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    
    [self callusertaglist];
   
    self.navigationController.navigationBar.hidden=YES;

    
    activityIden.hidden=NO;
    [activityIden startAnimating];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [self callfetchprofile];

    _FrndResnotificationlblobj.layer.cornerRadius=10;
    _FrndResnotificationlblobj.clipsToBounds=YES;
    
   // _FrndResnotificationlblobj.layer.borderWidth =1;
   // _FrndResnotificationlblobj.layer.borderColor = [UIColor blackColor].CGColor;
    
    _Profilepicimg.layer.cornerRadius=45;
    _Profilepicimg.clipsToBounds=YES;
    
    _Profilepicimg.layer.borderWidth =2;
    _Profilepicimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;

    _FrndResnotificationlblobj.text=_str1;
    
    _profileiconimg.layer.cornerRadius=20;
    _profileiconimg.clipsToBounds=YES;
    
    _profileiconimg.layer.borderWidth =2;
    _profileiconimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _profileBtnobj1.layer.cornerRadius=20;
    _profileBtnobj1.clipsToBounds=YES;
    
    _profileBtnobj1.layer.borderWidth =2;
    _profileBtnobj1.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return imgArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ListtableView";
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ListTableViewCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
        
    }
    cell.chatBtnobj.hidden=YES;
    cell.EmotionBtnobj.tag = indexPath.row;
    
    [cell.EmotionBtnobj addTarget:self action:@selector(EmotionAction:) forControlEvents:UIControlEventTouchUpInside];
    NSString *imgStr11 = [[imgArr objectAtIndex:indexPath.row] valueForKey:@"tagImg"];
    
    cell.Taggedlbl.hidden=YES;
    cell.OtherEmoBtnobj.hidden=YES;
    [cell.EmotionBtnobj setBackgroundImage:[UIImage imageNamed:@"tagmeback.png"] forState:UIControlStateNormal];
    
    if ([imgStr11 isEqual:(id)[NSNull null]] || [imgStr11 isEqualToString:@""] )
    {
       // _coverimg.image = [UIImage imageNamed:@" "];
        
        
    }
    else
    {
//        [cell.EmotionBtnobj setTitle:[[imgArr objectAtIndex:indexPath.row] valueForKey:@"emotionName"] forState:UIControlStateNormal];
        //cell.EmotionBtnobj=@"Tagme";
        [cell.listprofileimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/tag_photo/%@",[[imgArr objectAtIndex:indexPath.row] valueForKey:@"tagImg"]] placeholderImage:nil];
        cell.listprofileimg.contentMode=UIViewContentModeScaleToFill;
        
        cell.Liststmtlblobj.text=[[imgArr objectAtIndex:indexPath.row]  valueForKey:@"comment"];
        cell.usernamelblobj.text=[[imgArr objectAtIndex:indexPath.row] valueForKey:@"username"];
        if([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"1"])
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"root_inner_circle.png"] forState:UIControlStateNormal];
        }
        else if([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"2"])
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"root_outer_circle.png"] forState:UIControlStateNormal];
            
        }
        else if([[[imgArr objectAtIndex:indexPath.row]valueForKey:@"circle"] isEqual:@"3"])
        {
            [cell.inviteBtnobj setImage:[UIImage imageNamed:@"both_circle.png"] forState:UIControlStateNormal];
            
        }
        
    }
   
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

//        cell.imgsObj.image = [UIImage imageNamed:[imgArr objectAtIndex:indexPath.row]];

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 124;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
}
-(void)EmotionAction :(UIButton *) btn
{
        ViewController *VC1=[[ViewController alloc]init];
        [VC1 setTagmestr:@"tagme"];
        [VC1 setStr11:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
        [self.navigationController pushViewController:VC1 animated:YES];
}
-(void)callusertaglist
{
    [self.view showActivityViewWithLabel:@"Loading"];

    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"TagsOfSingleUser" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [dict1 setValue:_detail forKey:@"friend_id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"TagsOfSingleUser" :dict :dict1];
    
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"TagsOfSingleUser"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [self.view hideActivityView];

            //               if([[responseDictionary valueForKey:@"status_message"] isEqualToString:@"Not Found"])
            //            {
            if ([[responseDictionary valueForKey:@"friend_data"] isEqual:(id)[NSNull null]])
            {
                
            }
            else
            {
                NSString *fstr=[[responseDictionary valueForKey:@"friend_data"] valueForKey:@"username"];
                if ([fstr isEqualToString:@""] || [fstr isEqual:[NSNull null]])
                {
                    _profilelblobj.text=@"";
                }
                else
                {
            _profilelblobj.text = [[responseDictionary valueForKey:@"friend_data"] valueForKey:@"username"];
                    tabledata =[[NSMutableDictionary alloc]initWithDictionary:[responseDictionary valueForKey:@"friend_data"]];

                }
            NSString *imgStr = [[responseDictionary valueForKey:@"friend_data"] valueForKey:@"profile_pic"];
            
            
            if ([imgStr isEqual:(id)[NSNull null]] || [imgStr isEqualToString:@""])
            {
                _Profilepicimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            else
            {
           
             if([[[responseDictionary valueForKey:@"friend_data"] valueForKey:@"img_status"] integerValue]==1)
            {
                NSString *imgStr = [[responseDictionary valueForKey:@"friend_data"] valueForKey:@"profile_pic"];
                
                if ([imgStr isEqual:(id)[NSNull null]] || [imgStr isEqualToString:@""])
                {
                    _Profilepicimg.image = [UIImage imageNamed:@"user.png"];
                    
                }
                else
                {
                [_Profilepicimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"friend_data"]  valueForKey:@"profile_pic"]]] placeholderImage:nil];
                _Profilepicimg.contentMode=UIViewContentModeScaleToFill;
                }
            }
            else if([[[responseDictionary valueForKey:@"friend_data"] valueForKey:@"img_status"] integerValue]==0)
            {
                
                [_Profilepicimg setImageWithURL:[[responseDictionary valueForKey:@"friend_data"]valueForKey:@"profile_pic"]placeholderImage:nil];
                _Profilepicimg.contentMode=UIViewContentModeScaleToFill;
            }
                    
                }
            NSString *imgStr1 = [[responseDictionary valueForKey:@"friend_data"]  valueForKey:@"cover_pic"];
            
            
            if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
            {
                _coverimg.image = [UIImage imageNamed:@" "];
                
            }
            else
            {
                [_coverimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/cover_pic/%@",[[responseDictionary valueForKey:@"friend_data"]  valueForKey:@"cover_pic"]]] placeholderImage:nil];
                _coverimg.contentMode=UIViewContentModeScaleToFill;
                
                
            }
            }
        }
        else{
            
            // Earr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"friend_data"]];
            
            _profilelblobj.text = [[responseDictionary valueForKey:@"friend_data"] valueForKey:@"username"];
            
            
            NSString *imgStr = [[responseDictionary valueForKey:@"friend_data"] valueForKey:@"profile_pic"];
            
            
            if ([imgStr isEqual:(id)[NSNull null]] || [imgStr isEqualToString:@""])
            {
                _Profilepicimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            else
            {
                [_Profilepicimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"friend_data"]  valueForKey:@"profile_pic"]]] placeholderImage:nil];
                _Profilepicimg.contentMode=UIViewContentModeScaleToFill;
                
            }
            
            NSString *imgStr1 = [[responseDictionary valueForKey:@"friend_data"] valueForKey:@"cover_pic"];
            
            
            if ([imgStr1 isEqual:(id)[NSNull null]] || imgStr1.length < 1 )
            {
                _coverimg.image = [UIImage imageNamed:@" "];
                
            }
            else
            {
                [_coverimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/cover_pic/%@",[[responseDictionary valueForKey:@"friend_data"]  valueForKey:@"cover_pic"]]] placeholderImage:nil];
                _coverimg.contentMode=UIViewContentModeScaleToFill;
                
            }
            
        }
            
        // imgArr=[[NSMutableArray alloc]init];
        if([[responseDictionary valueForKey:@"data"] isEqual:(id)[NSNull null]])
        {
            // imgArr =[[NSMutableArray alloc]initWithArray:@" "];
        }
        else
        {
            imgArr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
        }
        [_DashTableviewobj reloadData];
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] isEqual:@"0"])
            {
                
                [_Chatbtnobj setUserInteractionEnabled:YES];
                
            }
            else
            {
                _Chatbtnobj.alpha = 0.5;
                
                [_Chatbtnobj setUserInteractionEnabled:NO];
                
            }
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"SOS_Status"] isEqual:@"0"])
            {
                [_Sosbtnobj setUserInteractionEnabled:YES];
                
                
            }
            else
            {
                
                _Sosbtnobj.alpha = 0.5;
                
                [_Sosbtnobj setUserInteractionEnabled:NO];
            }
            chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"])
            {
                chatnotification.hidden=YES;
                
            }
            
            NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
            
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _profileiconimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                [_profileiconimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _profileiconimg.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                [_profileiconimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _profileiconimg.contentMode=UIViewContentModeScaleToFill;
            }
            
            
        }
    }
}

- (IBAction)BackBtn:(id)sender {
    
    self.navigationController.navigationBar.hidden=YES;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)SettingBtnAction:(id)sender {
    SettingViewController *SVC=[[SettingViewController alloc]init];
    
    self.navigationController.navigationBar.hidden=YES;
    [self.navigationController pushViewController:SVC animated:YES];
}

- (IBAction)FriendRequestNotificationBtnAction:(id)sender {
    ResponseViewController *RVC=[[ResponseViewController alloc]init];
    
    self.navigationController.navigationBar.hidden=YES;
    [self.navigationController pushViewController:RVC animated:YES];
    
}

- (IBAction)SosBtnAction:(id)sender {
    
    BS1ViewController *RVC=[[BS1ViewController alloc]init];
//    [RVC setDetail:_detail];
//    [RVC setDetail1:tabledata];
    
    [self.navigationController pushViewController:RVC animated:YES];
}
- (IBAction)ChatBtnAction:(id)sender {
    ChatViewController *RVC=[[ChatViewController alloc]init];
    [RVC setDetail:_detail];
    [RVC setDetail1:tabledata];

    [self.navigationController pushViewController:RVC animated:YES];
    
}
- (IBAction)profileiconBtnAction:(id)sender {
    ProfileViewController *evc=[[ProfileViewController alloc]init];
    [self.navigationController pushViewController:evc animated:YES];
}

-(void)callfetchprofile
{
    //hud.hidden=NO;
    
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
    
    
}


- (IBAction)HomeBtnAction:(id)sender {
    FeedViewController *FVC=[[FeedViewController alloc]init];
    [FVC setStr1:@"feed"];
    
   
    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)FriendsBtnAction:(id)sender {
    FriendsViewController *VC1=[[FriendsViewController alloc]init];
    
    // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
    // [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)GalleryBtnAction:(id)sender {
    GalleryViewController *gvc=[[GalleryViewController alloc]init];
    
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)TagBtnAction:(id)sender {
    check=YES;
    
   
    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [selectImgAS setTag:6];
    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [selectImgAS showInView:self.view];
    check=YES;
}

- (IBAction)chatbtnAction:(id)sender {
    ChatfriendViewController *gvc=[[ChatfriendViewController alloc]init];
    
    [self.navigationController pushViewController:gvc animated:YES];
}




-(void)actionSheet:(UIActionSheet *)myActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    
    
    switch (buttonIndex)
    {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                // imagePicker.allowsEditing = NO;
                
                imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:imagePicker animated:YES];
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
            {
                
                // Set source to the Photo Library
                //  imagePicker.allowsEditing = NO;
                imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                [self presentModalViewController:imagePicker animated:YES];
            }
            
            break;
        default:
            break;
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    check=YES;
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(UIImage *)imageResize :(UIImage*)img andResizeTo:(CGSize)newSize
{
    check=YES;
    
    CGFloat scale = 1.00f;
    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
    //UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width/2,newSize.height/2)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//- (UIImage *)crop:(UIImage *)image inRect:(CGRect)cropRect
//{
//    CGImageRef cropRef = CGImageCreateWithImageInRect(image.CGImage, cropRect);
//    UIImage* cropImage = [UIImage imageWithCGImage:cropRef];
//    CGImageRelease(cropRef);
//
//    return cropImage;
//}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    check=YES;
    
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
@end

