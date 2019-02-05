//
//  EditViewController.m
//  Root_App
//
//  Created by BRIJESH KUMAR on 13/04/1939 IST.
//  Copyright © 1939 Saka EpikSolutions. All rights reserved.
//

#import "EditViewController.h"
#import "SWRevealViewController.h"
#import "MyWebserviceManager.h"
#import "ChangePasswordViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "ProfileViewController.h"
#import "Base64.h"
#import "UIView+RNActivityView.h"
#import "UIImageView+WebCache.h"
#import "FeedViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "BS1ViewController.h"

@interface EditViewController ()
{
    NSString *str;
    NSMutableArray *fetcharr;
    BOOL check;
    BOOL check1;
    CLLocationManager *locationManager;
    CLGeocoder *ceo;
    
}
@end

@implementation EditViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [_UserTF resignFirstResponder];
    [_EmailTF resignFirstResponder];
    [_locationTF resignFirstResponder];
    [_DobTF resignFirstResponder];
    [_MobileTF resignFirstResponder];
    
    
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    //    _EmailTF.text=[defaults objectForKey:@"email_id"];
    //    _MobileTF.text=[defaults objectForKey:@"mobile_no"];
    //    _UserTF.text=[defaults objectForKey:@"username"];
    //    _locationTF.text=[defaults objectForKey:@"location"];
    //    _DobTF.text=[defaults objectForKey:@"dob"];
    //    _uidstr=[defaults objectForKey:@"id"];
    
    //    NSLog(@"%@",_uidstr);
    
    self.MobileTF.keyboardType = UIKeyboardTypePhonePad;
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 375, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithTitle:@"Done" style:
                             UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)]];
    
    [numberToolbar sizeToFit];
    
    _MobileTF.inputAccessoryView = numberToolbar;
    // [self.MobileTF addTarget:self action:@selector(formatPhoneNumber) forControlEvents:UIControlEventEditingChanged];
    
    
    check=NO;
    check1=NO;
    
    [self callFetchProfileDetails];
    
    //_ChangePasswordBtnobj.layer.cornerRadius=13;
    //_ChangePasswordBtnobj.clipsToBounds=YES;
    
    //    _AddprofilepicBtnobj.layer.cornerRadius=12;
    //    _AddprofilepicBtnobj.clipsToBounds=YES;
    //    _AddprofilepicBtnobj.layer.borderWidth =1;
    //    _AddprofilepicBtnobj.layer.borderColor =[[UIColor colorWithRed:(39.0/255.0)
    //                                                              green:(174.0/255.0)
    //                                                               blue:(96.0/255.0)
    //                                                              alpha:(1.0)] CGColor];
    
    //_ChangePasswordBtnobj.layer.borderWidth =1;
    //_ChangePasswordBtnobj.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tapper];
    
    _profileimg.layer.cornerRadius=45;
    _profileimg.clipsToBounds=YES;
    
    
    _profileimg.layer.borderWidth =2;
    _profileimg.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    _profilepic1Btnobj.layer.cornerRadius=45;
    _profilepic1Btnobj.clipsToBounds=YES;
    _profilepic1Btnobj.layer.borderWidth =2;
    _profilepic1Btnobj.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    
    _Datepickerobj.hidden=YES;
    _Callenderlblobj .hidden=YES;
    _DoneBtnobj.hidden=YES;
    
    
    //    _saveandverifybtnobj.layer.borderWidth =1;
    //    _saveandverifybtnobj.layer.borderColor = [UIColor greenColor].CGColor;
    
    _saveandverifybtnobj.layer.cornerRadius=17;
    _saveandverifybtnobj.clipsToBounds=YES;
    
    _scrollViewObj.contentSize = CGSizeMake(375, 467);
    
    [self.Datepickerobj addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    
    SWRevealViewController *revealController = [self revealViewController];
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    [ _revealmenuBtnobj addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view from its nib.
    
    //    UITapGestureRecognizer *tapper=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
    //    [self.view addGestureRecognizer:tapper];
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    
    ceo= [[CLGeocoder alloc]init];
    [locationManager requestWhenInUseAuthorization];
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [locationManager requestWhenInUseAuthorization];
    }
    CLLocationCoordinate2D coordinate;
    
    coordinate.latitude=locationManager.location.coordinate.latitude;
    coordinate.longitude=locationManager.location.coordinate.longitude;
    //CLLocationCoordinate2D  ctrpoint;
    //  ctrpoint.latitude = ;
    //ctrpoint.longitude =f1;
    //coordinate.latitude=23.6999;
    //coordinate.longitude=75.000;
    //    MKPointAnnotation *marker = [MKPointAnnotation new];
    //    marker.coordinate = coordinate;
    NSLog(@"%f",coordinate.latitude);
    //[self.mapView addAnnotation:marker];
    
    
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude
                       ];
    [ceo reverseGeocodeLocation:loc
              completionHandler:^(NSArray *placemarks, NSError *error) {
                  CLPlacemark *placemark = [placemarks objectAtIndex:0];
                  NSLog(@"placemark %@",placemark);
                  //String to hold address
                  NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
                  NSLog(@"addressDictionary %@", placemark.addressDictionary);
                  
                  NSLog(@"placemark %@",placemark.region);
                  NSLog(@"placemark %@",placemark.country);  // Give Country Name
                  NSLog(@"placemark %@",placemark.locality); // Extract the city name
                  NSLog(@"location %@",placemark.name);
                  NSLog(@"location %@",placemark.ocean);
                  NSLog(@"location %@",placemark.postalCode);
                  NSLog(@"location %@",placemark.subLocality);
                  
                  NSLog(@"location %@",placemark.location);
                  //Print the location to console
                  NSLog(@"I am currently at %@",locatedAt);
                  
                  
                  //  _locationTF.text=[placemark.addressDictionary objectForKey:@"City"];
                  [locationManager stopUpdatingLocation];
              }
     
     ];
}
-(void)hideKeyboard
{
    [_UserTF resignFirstResponder];
    [_EmailTF resignFirstResponder];
    [_MobileTF resignFirstResponder];
    [_DobTF resignFirstResponder];
    [_locationTF resignFirstResponder];
    _DoneBtnobj.hidden=YES;
    _Callenderlblobj.hidden=YES;
    _Datepickerobj.hidden=YES;
    
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
}


-(void)doneWithNumberPad
{
    [_MobileTF resignFirstResponder];
    [ _DobTF endEditing:YES];
    // [_DobTF resignFirstResponder];
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
}

-(void)cancelNumberPad
{
    [_MobileTF resignFirstResponder];
    // [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    [ _DobTF endEditing:YES];
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
    // [_DobTF resignFirstResponder];
    
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:datePicker.date];
    
    if ([str isEqualToString:@"DateTFObj"])
    {
        _DobTF.text = strDate;
    }
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if(textField==self.UserTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        // [_UserTF endEditing:YES];
        [_EmailTF endEditing:YES];
        [_locationTF endEditing:YES];
        [_DobTF endEditing:YES];
        [ _MobileTF endEditing:YES];
        //[_UserTF resignFirstResponder];
        
    }
    
    else if(textField==self.MobileTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 75)animated:YES];
        [_UserTF endEditing:YES];
        [_EmailTF endEditing:YES];
        [_locationTF endEditing:YES];
        [_DobTF endEditing:YES];
        // [_MobileTF resignFirstResponder];
        
        //  [ _MobileTF endEditing:YES];
    }
    
    else if (textField==self.EmailTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 60)animated:YES];
        [_UserTF endEditing:YES];
        // [_EmailTF endEditing:YES];
        [_locationTF endEditing:YES];
        [_DobTF endEditing:YES];
        [ _MobileTF endEditing:YES];
        // [_EmailTF resignFirstResponder];
        
    }
    else if (textField==self.locationTF)
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 115)animated:YES];
        
        [_UserTF endEditing:YES];
        [_EmailTF endEditing:YES];
        // [_locationTF endEditing:YES];
        [_DobTF endEditing:YES];
        [ _MobileTF endEditing:YES];
        [ _DobTF endEditing:YES];
        // [_DobTF resignFirstResponder];
        _Datepickerobj.hidden=YES;
        _DoneBtnobj.hidden=YES;
        _Callenderlblobj.hidden=YES;
        
    }
    
    else
    {
        [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
        
        
    }
    if(textField == _DobTF)
    {
        //    [_UserTF endEditing:YES];
        //    [_EmailTF endEditing:YES];
        //    [_locationTF endEditing:YES];
        //    [_DobTF endEditing:YES];
        //    [ _MobileTF endEditing:YES];
        str=@"DateTFObj";
        [textField endEditing:YES];
        _Datepickerobj.hidden=NO;
        _DoneBtnobj.hidden=NO;
        _Callenderlblobj.hidden=NO;
        
        
        //    _dobstraightLbl.hidden=NO;
        //    _doblinObj.hidden=NO;
        [self.scrollViewObj setContentOffset:CGPointMake(0, 75)animated:YES];
        
        _Datepickerobj.backgroundColor=[UIColor whiteColor];
        //[ _DobTF endEditing:YES];
        [_Datepickerobj reloadInputViews];
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) tapped:(UIGestureRecognizer *) sender
{
    _Datepickerobj.hidden=YES;
    _DoneBtnobj.hidden=YES;
    _Callenderlblobj.hidden=YES;
    [_UserTF resignFirstResponder];
    [_EmailTF resignFirstResponder];
    [_locationTF resignFirstResponder];
    [_MobileTF resignFirstResponder];
    [_DobTF resignFirstResponder];
    
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
                
                // Set source to the Photo Library
                imagePicker.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                [self presentModalViewController:imagePicker animated:YES];
            }
            
            break;
        default:
            break;
    }
    
    
}

- (void)userCoverActionSheet:(UIActionSheet *)userCoverActionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //-(void)actionSheet:(UIActionSheet *)coverprofileactionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
    //{
    
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
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //  _profileimg.image=chosenImage;
    
    //[profileiMg setImage:chosenImage forState:UIControlStateNormal];
    if(check==YES)
    {
        
        //      [ self.profileBtnobj setImage:chosenImage forState:UIControlStateNormal];
        _profileimg.image=chosenImage;
        
        
        
        CGRect rect = CGRectMake(0,0,200,200);
        
        UIImage *imggs = [self  imageResize :[info objectForKey:UIImagePickerControllerEditedImage] andResizeTo:rect.size];
        
        
        // NSData *daataa = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
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
        
        
        // NSData *daataa = UIImagePNGRepresentation([info objectForKey:UIImagePickerControllerEditedImage]);
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
//    id<GAITracker> tracker = [GAI sharedInstance].defaultTracker;
//    [tracker set:kGAIScreenName value:@"click on cover camera"];
//    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
//    UIActionSheet *selectImgAS = [[UIActionSheet alloc] initWithTitle:@"Source Type?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Camera" otherButtonTitles:@"Gallery", nil];
//    selectImgAS.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
//    [selectImgAS showInView:self.view];
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
    //NSString *laxString1 =@"^[7-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]";
    //NSString *specialchar=@"!@#$%^&*()_+";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    // NSPredicate *emailTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", laxString1];
    NSString *phoneRegex = @"^[\+(00)][0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];

 
    NSString *msg  = @"0";
    
    if([_UserTF.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length < 1)
    {
        msg = @"Please enter username";
     }
    else if(_MobileTF.text.length < 1)
    {
        msg =@"Please enter mobile number";
        
    }
    else if(_MobileTF.text.length >13 || _MobileTF.text.length < 10)
    {
         msg =@"Please enter your valid mobile number";
        
    }
    else if([phoneTest evaluateWithObject:_MobileTF.text])
    {
        msg =@"Please enter your valid mobile number";

    }
    
    else if (_EmailTF.text.length < 1)
    {
        msg = @"Please enter email address";
        
    }
    else if([emailTest evaluateWithObject:_EmailTF.text] == NO)
    {
        msg = @"Please enter valid email address";
        
    }
    else if (_locationTF.text.length < 1)
    {
        msg = @"Please enter location";
        
    }
    //   else if ([specialchar evaluateWithObject:_locationTF.text] == NO)
    //    {
    //        msg = @"Please enter valid location";
    //
    //    }
    
    else if (_DobTF.text.length < 1)
    {
        msg = @"Please select date of birth";
    }
    
    if (![msg isEqualToString:@"0"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:msg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
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
    [paramDict setValue:_DobTF.text forKey:@"dob"];
    [paramDict setValue:_MobileTF.text forKey:@"mobile_no"];
 
    [paramDict setValue:_EmailTF.text forKey:@"email_id"];
    
    //        if (![_locationTF.text isEqualToString:[NSNull null]] || ![_locationTF.text isEqualToString:@" "])
    //        {
    [paramDict setValue:_locationTF.text forKey:@"location"];
     // }
    // id,username,dob,mobile_no,email_id,location,img_file,img_name,img_ext,img_file_two,img_name_two,img_ext_two
    [paramDict setValue:base64_encoded_image forKey:@"img_file"];
    [paramDict setValue:imageNameStr forKey:@"img_name"];
    [paramDict setValue:@"png" forKey:@"img_ext"];
    [paramDict setValue:base64_encoded_image1 forKey:@"img_file_two"];
    [paramDict setValue:imageNameStr1 forKey:@"img_name_two"];
    [paramDict setValue:@"png" forKey:@"img_ext_two"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"profile_update" :dict :paramDict];
    
 }

-(void)callFetchProfileDetails
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

-(void)callvalidateemrnumber
{
    
    [self.view showActivityViewWithLabel:@"Loading"];
    NSString *i=_MobileTF.text;
    NSString *j =[NSString stringWithFormat:@"%d%@",+1,i];
    i=j;
    NSString *url1 = @"http://apilayer.net/api/validate?access_key=5e4b227c69d89a6d252e69a7dfaf8cdf&number=";
    NSString *mainUrl=[url1 stringByAppendingString:i];
 
    //    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    
    NSURL *url = [NSURL URLWithString:mainUrl];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
         NSLog(@"%@",dictionary);
         if ([[dictionary valueForKey:@"valid"] integerValue]==1)
         {
             [self CallEditProfile];
             
         }
         else
         {
             [self.view hideActivityView];

             UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"This number not valid" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             dispatch_async(dispatch_get_main_queue(), ^{
                 [alertview show];
             });
             
         }
     }];
    
    //  activityIden.hidden = YES;
    
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"profile_update"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
             [self.view hideActivityView];
            
            
            
//                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:@"Profile updated" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//                        [alert show];
            
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
            //hud.hidden=YES;
            // fetcharr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
             [self.view hideActivityView];
            //  [[NSUserDefaults standardUserDefaults] setValue:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserImage"] forKey:@"UserImage"];
            if([[[responseDictionary valueForKey:@"data"]valueForKey:@"sub"] isEqual:@""] || [[[responseDictionary valueForKey:@"data"]valueForKey:@"sub"] isEqual:[NSNull null]])
            {
                _ChangePasswordBtnobj.hidden=NO;
                _UserTF.enabled = YES;
                _EmailTF.enabled = YES;
            }
            else
            {
                _ChangePasswordBtnobj.hidden=YES;

                _UserTF.enabled = NO;
                _EmailTF.enabled = NO;

            }
            _UserTF.text = [[responseDictionary valueForKey:@"data"]valueForKey:@"username"];
            _EmailTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"email"];
            
            
            
            NSString *phonestr = [[responseDictionary valueForKey:@"data"]valueForKey:@"mobile_no"];
            
            
            if ([phonestr isEqual:(id)[NSNull null]] || phonestr.length < 1 )
            {
                _MobileTF.text=@"";
                
            }
            
            else
            {
                _MobileTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"mobile_no"];
                
            }
            
            NSString *locationstr = [[responseDictionary valueForKey:@"data"]valueForKey:@"location"];
            
            if ([locationstr isEqual:(id)[NSNull null]] || locationstr.length < 1 )
            {
                _locationTF.text=@"";
                
            }
            
            else
            {
                _locationTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"location"];
                
            }
            
            NSString *dobstr = [[responseDictionary valueForKey:@"data"]valueForKey:@"dob"];
            
            if ([dobstr isEqual:(id)[NSNull null]] || dobstr.length < 1 )
            {
                _DobTF.text=@"";
                
            }
            
            else
            {
                _DobTF.text=[[responseDictionary valueForKey:@"data"] valueForKey:@"dob"];
                
            }
            
             // [_SigninSignupBtnobj setTitle:[[responseDictionary valueForKey:@"data"]valueForKey:@"UserName"] forState:UIControlStateNormal];
 
            NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            NSString *strlength;
            
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _profileimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            //
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
                
            {
                [_profileimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _profileimg.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                
                [_profileimg setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _profileimg.contentMode=UIViewContentModeScaleToFill;
            }
            // }
            //         else
            //         {
            //             [_profileimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://epiksolution.org/rootapp/servicebus/profile_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
            //             _profileimg.contentMode=UIViewContentModeScaleToFill;
            //         }
            
            NSString *imgStr1 = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img_two"];
            
            if ([imgStr1 isEqual:(id)[NSNull null]] || imgStr1.length < 1 )
            {
                _profilebackimg.image = [UIImage imageNamed:@" "];
                
            }
            else
            {
                [_profilebackimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://w2.sisuroot.com/servicebus/cover_pic/%@",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img_two"]]] placeholderImage:nil];
                _profilebackimg.contentMode=UIViewContentModeScaleToFill;
                
            }
            
            
        }
    }
    
}

-(void) processFailed :(NSError *)responseDictionary
{
    // ActivityIdenter.hidden=NO;
     [self.view hideActivityView];
    NSLog(@"error");
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"status_message" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    //    [alert show];
    
}

- (IBAction)ChangePasswordBtn:(id)sender {
    ChangePasswordViewController *CPVC=[[ChangePasswordViewController alloc]init];
    
    [self.navigationController pushViewController:CPVC animated:YES];
}
- (IBAction)DoneBtnobj:(id)sender {
    _Datepickerobj.hidden=YES;
    _DoneBtnobj.hidden=YES;
    _Callenderlblobj.hidden=YES;
    [_UserTF endEditing:YES];
    [_EmailTF endEditing:YES];
    [_locationTF endEditing:YES];
    [_DobTF endEditing:YES];
    [_MobileTF endEditing:YES];
    
    //    _dobstraightLbl.hidden=YES;
    //    _doblinObj.hidden=YES;
    [self.scrollViewObj setContentOffset:CGPointMake(0, 0)animated:YES];
    
}
@end

