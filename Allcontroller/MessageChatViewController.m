//
//  MessageChatViewController.m
//  Eyes N Ears
//
//  Created by Ashwani  on 8/4/17.
//  Copyright © 2017 Gomes. All rights reserved.
//

#import "MessageChatViewController.h"
#import "MessageChatTableViewCell.h"
#import "AppDelegate.h"

#define AppDelegate (YourAppDelegate *)[[UIApplication sharedApplication] delegate]

@interface MessageChatViewController ()

@end

@implementation MessageChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
   // appDelegate.myViewController = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.userImageView.layer.cornerRadius = 18;
    
    UILabel * leftView = [[UILabel alloc] initWithFrame:CGRectMake(10,0,7,26)];
    leftView.backgroundColor = [UIColor clearColor];
    
    
    self.messageTextField.leftView = leftView;
    
    self.messageTextField.leftViewMode = UITextFieldViewModeAlways;
    self.messageTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    self.messageTextField.layer.borderWidth = 1.0;
    self.messageTextField.layer.borderColor = [UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1.0].CGColor;
    self.messageTextField.layer.cornerRadius = 12.0;
    
    self.sendMessageButton.layer.cornerRadius = 20;
    [self callChatListing:self.complaintId];
    [self startTimer];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [AppDelegate instance].headerView.hidden = YES;
//    self.userNameLabel.text = self.userNameString;
//    [FIRAnalytics setScreenName:@"MessageChat" screenClass:@"MessageChatViewController"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark - CountDown Timer
-(void)startTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer=[NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

-(void)timerFired {
//    [self callGetUserNewMessageService:self.recieverUserID];
    [self callChatListing:self.complaintId];
}


- (IBAction)backButtonAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sendMessageButtonAction:(id)sender{
    if ([self.messageTextField.text length] == 0) {
        [[AppDelegate instance] showAlertWithTitle:@"No Message" WithMessage:@"Please enter your message" withTwoButtons:NO withAlertType:SIMPLE_ALERT_TYPE];
    }
    else {
//        [self.sendMessageButton setEnabled:true];
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        [self callSendMessage:self.complaintId];
    }
}

- (IBAction)attachButtonAction:(id)sender{
    UIAlertController *imageAlertController = [UIAlertController
                                               alertControllerWithTitle:@"Upload File"
                                               message:@"Select your photo or document here"
                                               preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* cameraAction = [UIAlertAction
                                   actionWithTitle:@"Camera"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       [self pickPhotoFromCamera];
                                       [imageAlertController dismissViewControllerAnimated:YES completion:nil];
                                   }];
    UIAlertAction* photoLibraryAction = [UIAlertAction
                                         actionWithTitle:@"Photo Library"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * action) {
                                             [self pickPhotoFromGallery];
                                             [imageAlertController dismissViewControllerAnimated:YES completion:nil];
                                         }];
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action) {
                                 [imageAlertController dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    [imageAlertController addAction:cameraAction];
    [imageAlertController addAction:photoLibraryAction];
//    [imageAlertController addAction:documentAction];
    [imageAlertController addAction:cancel];
    
    [[AppDelegate instance].navigationController presentViewController:imageAlertController animated:YES completion:nil];
}


-(void)pickDocumentFromList{
    UIDocumentPickerViewController *documentPicker = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:@[@"public.data"] inMode:UIDocumentPickerModeImport];
    documentPicker.delegate = self;
    documentPicker.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:documentPicker animated:YES completion:nil];
}


#pragma mark - iCloud files
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    if (controller.documentPickerMode == UIDocumentPickerModeImport) {
        //  NSString *alertMessage = [NSString stringWithFormat:@"Successfully imported %@", [url lastPathComponent]];
        //do stuff
//        NSLog(@"Document");
    }
}

/*
 UIAlertController * view=   [UIAlertController
 alertControllerWithTitle:@"My Title"
 message:@"Select you Choice"
 preferredStyle:UIAlertControllerStyleActionSheet];
 
 UIAlertAction* ok = [UIAlertAction
 actionWithTitle:@"OK"
 style:UIAlertActionStyleDefault
 handler:^(UIAlertAction * action)
 {
 //Do some thing here
 [view dismissViewControllerAnimated:YES completion:nil];
 
 }];
 UIAlertAction* cancel = [UIAlertAction
 actionWithTitle:@"Cancel"
 style:UIAlertActionStyleDefault
 handler:^(UIAlertAction * action)
 {
 [view dismissViewControllerAnimated:YES completion:nil];
 
 }];
 
 
 [view addAction:ok];
 [view addAction:cancel];
 [self presentViewController:view animated:YES completion:nil];
 */

#pragma mark - Table View Datasource & Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.messageListArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"MessageChatTableViewCell";
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    messageChatTableViewCell = (MessageChatTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    messageChatTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(messageChatTableViewCell==nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MessageChatTableViewCell" owner:self options:nil];
        messageChatTableViewCell = [nib objectAtIndex:0];
    }
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentJustified;
    
    NSString *textString = [NSString stringWithFormat:@"%@", [[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"message"]];
    
//    messageChatTableViewCell.messageTimeLabel.text = [CommonUtils getTimeInterValTillTodayFromDate:[[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"msg_time"]];
    
    messageChatTableViewCell.messageTimeLabel.text = [self  convertDateToTime:[[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"post_time"]];
    
//    messageChatTableViewCell.messageTimeLabel.text = [CommonUtils getTimeInterValTillTodayFromDate:[NSString stringWithFormat:@"%@",[[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"post_time"]]];


//    if (![[[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"msg_status"] isEqualToString:@"Read"]){
//        messageChatTableViewCell.messageTickImageView.image = [UIImage imageNamed:@"check_read_icon"];
//        messageChatTableViewCell.messageStatusLabel.textColor = [UIColor colorWithRed:166.0f/255.0f green:166.0f/255.0f blue:166.0f/255.0f alpha:1.0];
//    }
//    else{
//        messageChatTableViewCell.messageTickImageView.image = [UIImage imageNamed:@"check_delivered_icon"];
//        messageChatTableViewCell.messageStatusLabel.textColor = [UIColor colorWithRed:254.0f/255.0f green:223.0f/255.0f blue:224.0f/255.0f alpha:1.0];
//    }
    
    messageChatTableViewCell.messageStatusLabel.text = [[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"msg_status"];
    
    CGSize dynamicSize = [textString boundingRectWithSize:CGSizeMake([[AppDelegate instance] getFlexibleWidth:215], 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :messageChatTableViewCell.messageTextLabel.font, NSParagraphStyleAttributeName: paragraphStyle} context:nil].size;
    
    CGFloat xCordForBubble = 0;
    
    if([[NSString stringWithFormat:@"%@", [[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"type"]] isEqualToString:@"1"]) {
        
    //if([[[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"msg_user_id"] isEqualToString:[CommonUtils getValue:LOGGEDIN_USER_ID]]) {
        
//        messageChatTableViewCell.chatBubbleView.backgroundColor = [UIColor colorWithRed:254.0/255.0f green:223.0f/255.0f blue:224.0f/255.0f alpha:1.0];
        messageChatTableViewCell.chatBubbleView.backgroundColor = [UIColor whiteColor];
        messageChatTableViewCell.messageStatusLabel.alpha = 1;
        
//        if([textString length] == 0){
//            xCordForBubble = [CommonUtils getFlexibleWidth:93];
//            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake([CommonUtils getFlexibleWidth:10], 10, [CommonUtils getFlexibleWidth:246], 246)];
//            imgView.contentMode = UIViewContentModeScaleAspectFill;
//            imgView.clipsToBounds = YES;
//            [messageChatTableViewCell.chatBubbleView addSubview:imgView];
//            [imgView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [NSString stringWithFormat:@"%@", [[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"attachment"]]]] placeholderImage:[UIImage imageNamed:@"user_placeholder.png"]];
//            messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, 15, [CommonUtils getFlexibleWidth:266], 266);
//        }
//        else{
            xCordForBubble = self.view.frame.size.width - ([CommonUtils getFlexibleWidth:16]+dynamicSize.width+5+[CommonUtils getFlexibleWidth:16]);
            if (dynamicSize.height > [CommonUtils getFlexibleHeight:19]){
                messageChatTableViewCell.messageTextLabel.frame = CGRectMake([CommonUtils getFlexibleWidth:8], 5, [CommonUtils getFlexibleWidth:215], dynamicSize.height+6);
                NSLog(@"%f", [CommonUtils getFlexibleWidth:230]);
                messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, 15, [CommonUtils getFlexibleWidth:230], messageChatTableViewCell.messageTextLabel.frame.size.height+12);
            }
            else{
                messageChatTableViewCell.messageTextLabel.frame = CGRectMake([CommonUtils getFlexibleWidth:8], 5, dynamicSize.width+5, 21);
                messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, 15, messageChatTableViewCell.messageTextLabel.frame.size.width+[CommonUtils getFlexibleWidth:16], 21+12);
            }
//        }
        messageChatTableViewCell.messageTimeLabel.frame = CGRectMake([CommonUtils getFlexibleWidth:245], messageChatTableViewCell.chatBubbleView.frame.origin.y+messageChatTableViewCell.chatBubbleView.frame.size.height+5, [CommonUtils getFlexibleWidth:70], 21);
//        messageChatTableViewCell.messageStatusLabel.frame = CGRectMake([CommonUtils getFlexibleWidth:182], messageChatTableViewCell.chatBubbleView.frame.origin.y+messageChatTableViewCell.chatBubbleView.frame.size.height+5, [CommonUtils getFlexibleWidth:125], 21);
//        messageChatTableViewCell.messageTickImageView.alpha = 1;
//        messageChatTableViewCell.messageTickImageView.frame = CGRectMake([CommonUtils getFlexibleWidth:313], messageChatTableViewCell.chatBubbleView.frame.origin.y+messageChatTableViewCell.chatBubbleView.frame.size.height+8, [CommonUtils getFlexibleWidth:16], 16);
    }
    else{
//        messageChatTableViewCell.backgroundColor = [UIColor redColor];
//        messageChatTableViewCell.chatBubbleView.backgroundColor = [UIColor colorWithRed:231.0f/255.0f green:231.0f/255.0f blue:231.0f/255.0f alpha:1.0];
        messageChatTableViewCell.chatBubbleView.backgroundColor = [UIColor whiteColor];
        messageChatTableViewCell.messageStatusLabel.alpha = 0;
        
        xCordForBubble = [CommonUtils getFlexibleWidth:6];
        messageChatTableViewCell.messageTickImageView.alpha = 0;
        if([textString length] == 0) {
//            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake([CommonUtils getFlexibleWidth:10], [CommonUtils getFlexibleHeight:10], [CommonUtils getFlexibleWidth:262], [CommonUtils getFlexibleHeight:262])];
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake([CommonUtils getFlexibleWidth:10], 10, [CommonUtils getFlexibleWidth:262], 262)];

            [messageChatTableViewCell.chatBubbleView addSubview:imgView];
            [imgView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [NSString stringWithFormat:@"%@", [[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"attachment"]]]] placeholderImage:[UIImage imageNamed:@"user_placeholder.png"]];
//            messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, [CommonUtils getFlexibleHeight:15], [CommonUtils getFlexibleWidth:282], [CommonUtils getFlexibleHeight:282]);
            messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, 15, [CommonUtils getFlexibleWidth:230], 282);
        }
        else{
            if (dynamicSize.height > [CommonUtils getFlexibleHeight:19]){
//                messageChatTableViewCell.messageTextLabel.frame = CGRectMake([CommonUtils getFlexibleWidth:8], [CommonUtils getFlexibleHeight:6], [CommonUtils getFlexibleWidth:266], dynamicSize.height+6);
//                messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, [CommonUtils getFlexibleHeight:15], [CommonUtils getFlexibleWidth:282], messageChatTableViewCell.messageTextLabel.frame.size.height+[CommonUtils getFlexibleHeight:12]);
                messageChatTableViewCell.messageTextLabel.frame = CGRectMake([CommonUtils getFlexibleWidth:8], 5, [CommonUtils getFlexibleWidth:215], dynamicSize.height+6);
                messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, 15, [CommonUtils getFlexibleWidth:230], messageChatTableViewCell.messageTextLabel.frame.size.height+12);
            }
            else {
//                messageChatTableViewCell.messageTextLabel.frame = CGRectMake([CommonUtils getFlexibleWidth:8], [CommonUtils getFlexibleHeight:6], dynamicSize.width+5, [CommonUtils getFlexibleHeight:19]);
//                messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, [CommonUtils getFlexibleHeight:12], messageChatTableViewCell.messageTextLabel.frame.size.width+[CommonUtils getFlexibleWidth:16], [CommonUtils getFlexibleHeight:19]+[CommonUtils getFlexibleHeight:12]);
                
                messageChatTableViewCell.messageTextLabel.frame = CGRectMake([CommonUtils getFlexibleWidth:8], 5, dynamicSize.width+5, 21);
                messageChatTableViewCell.chatBubbleView.frame = CGRectMake(xCordForBubble, 12, messageChatTableViewCell.messageTextLabel.frame.size.width+[CommonUtils getFlexibleWidth:16], 21+12);

            }
        }
//        messageChatTableViewCell.backgroundColor = [UIColor yellowColor];
    }
    
    NSLog(@"%f - %f", messageChatTableViewCell.chatBubbleView.frame.origin.x, messageChatTableViewCell.chatBubbleView.frame.size.width);
    
    messageChatTableViewCell.messageTextLabel.text = textString;
    messageChatTableViewCell.chatBubbleView.layer.cornerRadius = [CommonUtils getFlexibleHeight:4];
    return messageChatTableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat totalHeight = 0;
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentJustified;
    
    NSString *textString = [NSString stringWithFormat:@"%@", [[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"message"]];
    
//    Time - x:245, y:21, w:70, h:21
//    MessageLabe - x:8, y:6, w:215, h:19
//    View - x:6, y:8, w:230, h:46


    CGSize dynamicSize = [textString boundingRectWithSize:CGSizeMake([CommonUtils getFlexibleWidth:215], 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:14.0], NSParagraphStyleAttributeName: paragraphStyle} context:nil].size;

    if([[NSString stringWithFormat:@"%@", [[self.messageListArray objectAtIndex:indexPath.row] valueForKey:@"type"]] isEqualToString:@"1"]) {
//        if([textString length] == 0) {
//            totalHeight =  282;
//        }
//        else{
            if (dynamicSize.height > 19){
                totalHeight =  dynamicSize.height+6+12;
            }
            else{
                totalHeight =  19+12;
            }


//        }
        totalHeight = totalHeight+21+21+4;

    }
    else{
//        if([textString length] == 0){
//            totalHeight =  282;
//        }
//        else{
            if (dynamicSize.height > 19) {
                totalHeight =  dynamicSize.height+6+12;
            }
            else{
                totalHeight = 19+15;
            }
//        }
        totalHeight = totalHeight+15;
    }
    return totalHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}




#pragma mark - WebService Delegate Method
//- (void)getWebServiceResponseWithData:(NSData *)dataVal{
//    id jsonValue = [NSJSONSerialization JSONObjectWithData:dataVal options:kNilOptions error:nil];
//    NSLog(@"%@", jsonValue);
//    NSDictionary *responseDictionary = jsonValue;
//    [self.sendMessageButton setEnabled:YES];
//    [[AppDelegate instance] hideProgressView];
//    if ([[responseDictionary valueForKey:@"status"] integerValue] == 1) {
//        if ([self.serviceType isEqualToString:METHOD_GET_USER_NEW_MESSAGE]) {
//            self.messageListArray = [[NSMutableArray alloc] init];
//            self.messageListArray =  [[responseDictionary valueForKey:@"data"] valueForKey:@"msg_list"];
//            NSLog(@"%@", self.messageListArray);
//            [self.chatTableView reloadData];
//            if ([self.messageListArray count] > 0){
//                [self.chatTableView reloadData];
//                NSIndexPath* ip = [NSIndexPath indexPathForRow:[self.chatTableView numberOfRowsInSection:0] - 1 inSection:0];
//                [self.chatTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
//            }
//        }
//        else {
//            [self.sendMessageButton setEnabled:true];
////            self.lastTimeString = [[[[responseDictionary valueForKey:@"data"] valueForKey:@"msg_list"] objectAtIndex:0] valueForKey:@"msg_time"];
//            self.messageTextField.text = @"";
//            [self callGetUserNewMessageService:self.recieverUserID];
//        }
//    }
//    else{
//        NSString *message = [responseDictionary valueForKey:@"error"];
//        [[AppDelegate instance] showAlertWithTitle:@"Message" WithMessage:message withTwoButtons:NO withAlertType:SIMPLE_ALERT_TYPE];
//    }
//}

//- (void)showServiceRequestError:(NSString *)errorMessage{
//    [[AppDelegate instance] hideProgressView];
//    [[AppDelegate instance] showAlertWithTitle:TITLE_ERROR WithMessage:errorMessage withTwoButtons:NO withAlertType:SIMPLE_ALERT_TYPE];
//}

#pragma mark - TextField Delegates
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    [[AppDelegate instance] slideUpDownView:self.enterMessageView yCord:[CommonUtils getFlexibleHeight:301]];
//    if ([AppDelegate instance].window.bounds.size.height == 568) {
        [[AppDelegate instance] slideUpDownView:self.enterMessageView yCord:[CommonUtils getFlexibleHeight:301]];
//    }
//    else if ([AppDelegate instance].window.bounds.size.height == 667) {
//        [[AppDelegate instance] slideUpDownView:self.enterMessageView yCord:[CommonUtils getFlexibleHeight:342]];
//    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.chatTableView.frame = CGRectMake(0, [CommonUtils getFlexibleHeight:59], [CommonUtils getFlexibleWidth:320], [CommonUtils getFlexibleHeight:240]);
    if ([self.messageListArray count] > 0) {
        NSIndexPath* ip = [NSIndexPath indexPathForRow:[self.chatTableView numberOfRowsInSection:0] - 1 inSection:0];
        [self.chatTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.chatTableView.frame = CGRectMake(0, [CommonUtils getFlexibleHeight:59], [CommonUtils getFlexibleWidth:320], [CommonUtils getFlexibleHeight:461]);
    [[AppDelegate instance] slideUpDownView:self.enterMessageView yCord:[CommonUtils getFlexibleHeight:519]];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [[AppDelegate instance] slideUpDownView:self.enterMessageView yCord:609];
}

- (void)pickPhotoFromCamera{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else{
        [[AppDelegate instance] showAlertWithTitle:@"Camera" WithMessage:@"Camera is not available for your device" withTwoButtons:NO withAlertType:SIMPLE_ALERT_TYPE];
    }
    picker.delegate = self;
    [[AppDelegate instance].navigationController presentViewController:picker animated:YES completion:nil];
}

- (void)pickPhotoFromGallery {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    else{
        [[AppDelegate instance] showAlertWithTitle:@"Photo Library" WithMessage:@"Photo library is not accessable in your device" withTwoButtons:NO withAlertType:SIMPLE_ALERT_TYPE];
    }
    picker.delegate = self;
    [[AppDelegate instance].navigationController presentViewController:picker animated:YES completion:nil];
}


-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
//    self.profilePicImageView.image = self.selectedUserImage;
//    self.isImageSelected = YES;
    [picker dismissViewControllerAnimated:YES completion:nil];
//    [self callSendImageMessageService];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(void)callChatListing:(NSString *)complainId {
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:@"chat_listing" forKey:@"name"];
    NSMutableDictionary *parmdict=[[NSMutableDictionary alloc]init];
//    [parmdict setValue:complainId forKey:@"complaint_id"];
//    [parmdict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"] forKey:@"user_id"];
    [parmdict setValue:complainId forKey:@"complaint_id"];
    [parmdict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"] forKey:@"user_id"];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"]);
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManagerByGet:@"chat_listing" :dict :parmdict];
}

-(void)callSendMessage:(NSString *)complainId {
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    [dict setValue:@"add_chat_message" forKey:@"name"];
    NSMutableDictionary *parmdict=[[NSMutableDictionary alloc]init];
    [parmdict setValue:complainId forKey:@"complaint_id"];
    [parmdict setValue:self.messageTextField.text forKey:@"message"];
    [parmdict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"] forKey:@"user_id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManagerByGet:@"add_chat_message" :dict :parmdict];
}


-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary; {
//    imgView.hidden = YES;
    NSLog(@"%@", responseDictionary);
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chat_listing"]) {
        if ([[responseDictionary valueForKey:@"success"] integerValue] == 1) {
            self.messageListArray=[responseDictionary valueForKey:@"chat_listing"];
            if ([self.messageListArray valueForKey:@"chat_listing"] != [NSNull null]) {
                [self.chatTableView reloadData];
                NSIndexPath* ip = [NSIndexPath indexPathForRow:[self.chatTableView numberOfRowsInSection:0] - 1 inSection:0];
                [self.chatTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
            }
            else {
                self.messageListArray = nil;
                [self.chatTableView reloadData];
            }
        }
    }
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"add_chat_message"]) {
        if ([[responseDictionary valueForKey:@"success"] integerValue] == 1) {
            self.messageTextField.text = @"";
            [self callChatListing:self.complaintId];
            [self startTimer];
        }
    }
}

-(void) processFailed :(NSError *)errorDictionary; {
    NSLog(@"Error");
}


- (NSString *)convertDateToTime:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *timeString = [dateFormatter stringFromDate:date];
    return timeString;
}



@end
