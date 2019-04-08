//
//  GalleryViewController.m
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 15/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleryCollectionViewCell.h"
#import "MyWebserviceManager.h"
#import "UIImageView+WebCache.h"
#import "Tag_ProfileViewController.h"
#import "FeedViewController.h"
#import "FriendsViewController.h"
#import "ViewController.h"
#import "Base64.h"
#import "ProfileViewController.h"
#import "ChatfriendViewController.h"
#import "Bs3ViewController.h"
#import "BS1ViewController.h"
 #import "UIView+RNActivityView.h"
 #import "Reachability.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
//#import "GAIFields.h"
//#import "GAILogger.h"
@interface GalleryViewController ()
{
    NSMutableArray *Earr;
}
@end

@implementation GalleryViewController

- (void)viewDidLoad {
     [FIRAnalytics setScreenName:@"Gallery" screenClass:@"Gallery"];
    [super viewDidLoad];
    [self Showallimages];
    [self callnetconnection];

    [self.view showActivityViewWithLabel:@"Loading"];
    chatnotification.layer.cornerRadius=10;
    chatnotification.clipsToBounds=YES;
    
    
    _profileiconimg.layer.cornerRadius=20;
    _profileiconimg.clipsToBounds=YES;
    
    _profileiconimg.layer.borderWidth =2;
    _profileiconimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _profileBtnobj1.layer.cornerRadius=20;
    _profileBtnobj1.clipsToBounds=YES;
    
    _profileBtnobj1.layer.borderWidth =2;
    _profileBtnobj1.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    [self callfetchprofile];
    // Do any additional setup after loading the view from its nib.
    [_GalleryCollectionViewobj registerNib:[UINib nibWithNibName:@"GalleryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"CollectionViewCell"];
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
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/3, 120);
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"CollectionViewCell";
    GalleryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //        [cell.mproductimg setImageWithURL:[NSString stringWithFormat:@"http://swadeshiayurved.com/admin/admin/category_image/%@",[[arr objectAtIndex:indexPath.row]valueForKey:@"cat_image"]]placeholderImage:nil];
    //
    // cell.Emotion2lbl.text=[Earr objectAtIndex:indexPath.row];
    [cell.Galleryimg setImageWithURL:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/tag_photo/%@",[[Earr objectAtIndex:indexPath.row]valueForKey:@"img"]] placeholderImage:nil];
    cell.Galleryimg.contentMode=UIViewContentModeScaleToFill;
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if ([[[Earr objectAtIndex:indexPath.row]valueForKey:@"emotion_type"] isEqual:@"0"])
    {
        
        
        Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
        
        [dcv setStr11:[[Earr objectAtIndex:indexPath.row]valueForKey:@"tagId"]];
        [dcv setStr12:[[Earr objectAtIndex:indexPath.row]valueForKey:@"username"]];
        [dcv setSharestr:@"Share"];
        [self.navigationController pushViewController:dcv animated:YES];
    }
    else
    {
        Tag_ProfileViewController *dcv=[[Tag_ProfileViewController alloc]init];
        
        [dcv setStr11:[[Earr objectAtIndex:indexPath.row]valueForKey:@"tagId"]];
        [dcv setStr12:[[Earr objectAtIndex:indexPath.row]valueForKey:@"username"]];
        [dcv setSharestr:@"Share"];
        [dcv setVoicestr111:@"voicestr"];
        
        [self.navigationController pushViewController:dcv animated:YES];
    }
    //    if (value isEqualToString:@"red")
    //    {
    //        coolectionViewCell.color = [UIColor redColor];
    //    }
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void)Showallimages
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"fatchGallery" forKey:@"name"];
    
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    
 
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"fatchGallery" :dict :paramDict];
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    // ActivityIndicator.hidden=YES;
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"fatchGallery"])
    {
        //  NSLog(@"test...%@",responseDictionary);
        
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            
            [self.view hideActivityView];
            
            
            Earr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            //            HomeViewController * hVC =[[HomeViewController  alloc]init];
            //            [self.navigationController pushViewController:hVC animated:YES];
            
            [_GalleryCollectionViewobj reloadData];
        }
        else
        {
            //            UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"Change Password" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            //            [alert show];
            
        }
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
            
            
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Sisuchat_Status"] integerValue]==1)
            {
                if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"])
                {
                    chatnotification.hidden=YES;
                    
                }
                else
                {
                    chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
                    
                }
            }
            else
            {
                chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
                NSInteger b = [chatnotification.text integerValue];
                
                NSString *str = [[responseDictionary valueForKey:@"data"]valueForKey:@"therapist_chat_count"];
                NSInteger j=[str integerValue];;
                j=b+j;
                NSString* myNewString = [NSString stringWithFormat:@"%li", (long)j];
                
                chatnotification.text=myNewString;
                
            }
            
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"] && [[[responseDictionary valueForKey:@"data"]valueForKey:@"therapist_chat_count"] integerValue]==0)
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


-(void) processFailed :(NSError *)responseDictionary
{
    //ActivityIndicator.hidden=YES;
    
    NSLog(@"error");
    
    //       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"status_message" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
}

- (IBAction)BackBtn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (IBAction)ProfileBtnAction:(id)sender {
    ChatfriendViewController *gvc=[[ChatfriendViewController alloc]init];
    //  [gvc setStr1:@"feed"];
    
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)FeedBtnAction:(id)sender {
    FeedViewController *gvc=[[FeedViewController alloc]init];
    [gvc setStr1:@"feed"];
    
    [self.navigationController pushViewController:gvc animated:YES];
}

- (IBAction)FriendsBtnAction:(id)sender {
    FriendsViewController *FVC=[[FriendsViewController alloc]init];
    
    [self.navigationController pushViewController:FVC animated:YES];
}

- (IBAction)GalleryBtnAction:(id)sender {
    
}

- (IBAction)TagBtnAction:(id)sender {
    
    
    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [selectImgAS setTag:6];
    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [selectImgAS showInView:self.view];
    
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
                // imagePicker.allowsEditing = NO;
                // Set source to the Photo Library
                imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                [self presentModalViewController:imagePicker animated:YES];
            }
            
            break;
        default:
            break;
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
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



- (IBAction)profileiconBtnAction:(id)sender {
    //    ProfileViewController *evc=[[ProfileViewController alloc]init];
    //    [self.navigationController pushViewController:evc animated:YES];
    ProfileViewController *VC1=[[ProfileViewController alloc]init];
     
    // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
    // [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)SosBtnAction:(id)sender {
    BS1ViewController *VC1=[[BS1ViewController alloc]init];
    
    // [VC1 setDetail1:[[imgArr objectAtIndex:btn.tag]valueForKey:@"tag_id"]];
    // [VC1 setDetail1:[imgArr objectAtIndex:btn.tag]];
    [self.navigationController pushViewController:VC1 animated:YES];
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




-(void)callnetconnection
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    NetworkStatus status = [reachability currentReachabilityStatus];
    
    if(status == NotReachable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"You should connect with wifi for optimal use." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        alert.tag=2000;
        [alert show];
    }
    else if (status == ReachableViaWiFi)
    {
        //WiFi
    }
    else if (status == ReachableViaWWAN)
    {
        //3G
    }
}
@end

