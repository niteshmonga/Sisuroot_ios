
#import "EditViewController.h"
#import "SWRevealViewController.h"
#import "MyWebserviceManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "Base64.h"
#import "UIView+RNActivityView.h"
#import "UIImageView+WebCache.h"
#import "FeedViewController.h"
#import "BS1ViewController.h"
#import "Reachability.h"
#import "LeftViewController.h"
#import <Photos/Photos.h>
#import "GraphView.h"
#import "chattypeViewController.h"
#import "GraphView1.h"
#import "smilepage1ViewController.h"
#import "Sisuroot-Swift.h"
@interface EditViewController ()
{
    BOOL check;
    BOOL check1;
}
@end

@implementation EditViewController
- (IBAction)BTN_HOME:(id)sender {
    FeedViewController *VC1=[[FeedViewController alloc]init];
       [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)editusername:(id)sender {
   // [_UserTF becomeFirstResponder];
    _UserTF.userInteractionEnabled=YES;
   [_UserTF becomeFirstResponder];
    
    
}
- (IBAction)edit_email:(id)sender {
    //_EmailTF.userInteractionEnabled=YES;
    _EmailTF.userInteractionEnabled=YES;
     [_EmailTF becomeFirstResponder];
}
- (IBAction)btn_chat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
      [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnyoy:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btn_qa:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [_UserTF resignFirstResponder];
    [_EmailTF resignFirstResponder];
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu{
    self.navigationController.navigationBar.hidden=YES;
    return NO;
}
- (IBAction)menubtnobj:(id)sender {
    
    SWRevealViewController *sw=[[SWRevealViewController alloc]init];
    sw.tabBarItem.enabled=NO;
}


- (void)viewDidLoad {
     [FIRAnalytics setScreenName:@"Edit Profile" screenClass:@"Edit Profile"];
   
    _UserTF.userInteractionEnabled=NO;
    _EmailTF.userInteractionEnabled=NO;

    
    
    [super viewDidLoad];
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
       graphView.backgroundColor = [UIColor clearColor];
       GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
       graphView1.backgroundColor = [UIColor clearColor];
       [self.view_footer1 addSubview:graphView];
       [self.view_footer2 addSubview:graphView1];
self.navigationController.navigationBar.hidden=YES;
    [self callnetconnection];

    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    check=NO;
    check1=NO;
    [self callFetchProfileDetails];
   UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    
    _profileimg.layer.cornerRadius=45;
    _profileimg.clipsToBounds=YES;
    
    
    _profileimg.layer.borderWidth =2;
    _profileimg.layer.borderColor = [UIColor whiteColor].CGColor;
    _profilepic1Btnobj.layer.cornerRadius=45;
    _profilepic1Btnobj.clipsToBounds=YES;
    _profilepic1Btnobj.layer.borderWidth =2;
    _profilepic1Btnobj.layer.borderColor = [UIColor whiteColor].CGColor;
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
      revealController.tapGestureRecognizer.enabled=YES;
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _revealmenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
     UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
}

-(void)hideKeyboard
{
    [_UserTF resignFirstResponder];
    [_EmailTF resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.UserTF)
    {
         [_EmailTF endEditing:YES];
    }
    
    else if (textField==self.EmailTF)
    {
       [_UserTF endEditing:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)actionSheet:(UIActionSheet *)profileactionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    switch (buttonIndex)
    {
        case 0:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                imagePicker.sourceType =UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:imagePicker animated:YES];
            }
            break;
        case 1:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
            {
                PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
                
                if (status == PHAuthorizationStatusAuthorized)
                {
                   imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                    [self presentModalViewController:imagePicker animated:YES];
                }
                
                else if (status == PHAuthorizationStatusDenied) {
                    
                }
                
                else if (status == PHAuthorizationStatusNotDetermined) {
                    
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
   UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
   if(check==YES)
    {
       _profileimg.image=chosenImage;
       CGRect rect = CGRectMake(0,0,200,200);
        
        UIImage *imggs = [self  imageResize :[info objectForKey:UIImagePickerControllerEditedImage] andResizeTo:rect.size];
         NSData *daataa = UIImagePNGRepresentation(imggs);
        
        base64_encoded_image =  [Base64 encode:daataa];
        
        NSDate *dtTime = [NSDate date];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
        imageNameStr = [df stringFromDate:dtTime];
        
        NSArray *arra = [imageNameStr componentsSeparatedByString:@" "];
        
        imageNameStr = [NSString stringWithFormat:@"%@%@",[arra objectAtIndex:0],[arra objectAtIndex:1]];
        
        check=NO;
        
    }
    if(check1==YES)
    {
         _profilebackimg.image=chosenImage;
 
        CGRect rect = CGRectMake(0,0,300,200);
        
        UIImage *imggs = [self  imageResize :[info objectForKey:UIImagePickerControllerEditedImage] andResizeTo:rect.size];
        NSData *daataa1 = UIImagePNGRepresentation(imggs);
         base64_encoded_image1 =  [Base64 encode:daataa1];
         NSDate *dtTime = [NSDate date];
        NSDateFormatter *df1 = [[NSDateFormatter alloc] init];
        [df1 setDateFormat:@"dd-MMM-yyyy hh-MM-ss"];
        imageNameStr1 = [df1 stringFromDate:dtTime];
        NSArray *arra1 = [imageNameStr1 componentsSeparatedByString:@" "];
        imageNameStr1 = [NSString stringWithFormat:@"%@%@",[arra1 objectAtIndex:0],[arra1 objectAtIndex:1]];
        check1=NO;
        
     }
    
    [picker dismissModalViewControllerAnimated:YES];
    
}


- (IBAction)profilePicBtn:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
    [actionSheet setTag:6];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [actionSheet showInView:self.view];
     check=YES;
    
}
- (IBAction)AddprofilepicBtn:(id)sender {
      BS1ViewController *CPVC=[[BS1ViewController alloc]init];
        [self.navigationController pushViewController:CPVC animated:YES];
        check1=YES;
}
- (IBAction)VerifyBtn:(id)sender {
    NSString *foo = _EmailTF.text;
    NSString *trimmed = [foo stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    _EmailTF.text=trimmed;
    
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
     NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    NSString *msg  = @"0";
     if([_UserTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter username";
     }
    else if (_EmailTF.text.length < 1)
    {
        msg = @"Please enter email address";
        
    }
    else if([emailTest evaluateWithObject:_EmailTF.text] == NO)
    {
        msg = @"Please enter valid email address";
    }
    if (![msg isEqualToString:@"0"])
    {
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"Alert" message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                                                   //button click event
                                                       }];
         [alert1 addAction:ok];
         [self presentViewController:alert1 animated:YES completion:nil];
    }
    else
    {
        [self CallEditProfile];
    }
}
-(void)CallEditProfile
{
   [self.view showActivityViewWithLabel:@"Loading"];
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"profile_update" forKey:@"name"];
    NSMutableDictionary *paramDict = [[NSMutableDictionary alloc]init];
    [paramDict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    [paramDict setValue:_UserTF.text forKey:@"username"];
    [paramDict setValue:_EmailTF.text forKey:@"email_id"];
    [paramDict setValue:@"" forKey:@"mobile_no"];
    [paramDict setValue:@"" forKey:@"phonenum_country_code"];
    [paramDict setValue:@"" forKey:@"location"];
    [paramDict setValue:base64_encoded_image forKey:@"img_file"];
    [paramDict setValue:imageNameStr forKey:@"img_name"];
    [paramDict setValue:@"png" forKey:@"img_ext"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"profile_update" :dict :paramDict];
 }

-(void)callFetchProfileDetails
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"profile_update"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"notoggle"];
            FeedViewController *EVC=[[FeedViewController alloc]init];
            [EVC setStr2:@"feed"];
            [self.navigationController pushViewController:EVC animated:YES];
         }
        else
        {
             [self.view hideActivityView];
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
             [alert show];
        }
     }
    
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
             [self.view hideActivityView];
            
            if([[[responseDictionary valueForKey:@"data"]valueForKey:@"sub"] isEqual:@""] || [[[responseDictionary valueForKey:@"data"]valueForKey:@"sub"] isEqual:[NSNull null]])
                      {
                          _editemail.hidden=NO;
                         //_EmailTF.enabled = YES;
                      }
                      else
                      {
                           _editemail.hidden=YES;
                          _EmailTF.textColor=[UIColor lightGrayColor];
                       //  _EmailTF.enabled = NO;
                      }
            _UserTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
            _EmailTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"email"];
            NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _profileimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
                
            {
                 [_profileimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _profileimg.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
              [_profileimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _profileimg.contentMode=UIViewContentModeScaleToFill;
            }
           NSString *imgStr1 = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img_two"];
            
            if ([imgStr1 isEqual:(id)[NSNull null]] || imgStr1.length < 1 )
            {
                _profilebackimg.image = [UIImage imageNamed:@" "];
            }
            else
            {
                [_profilebackimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"cover_pic/",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img_two"]]] placeholderImage:nil];
            _profilebackimg.contentMode=UIViewContentModeScaleToFill;
            }
        }
    }
}

-(void) processFailed :(NSError *)responseDictionary
{
    [self.view hideActivityView];
    NSLog(@"error");
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
    }
}
@end
