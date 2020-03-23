//
//  PHQ7ViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "PHQ7ViewController.h"
#import "PHQ8ViewController.h"
#import "JSMessagesViewController.h"
#import "MessageData.h"
#import "UIButton+JSMessagesView.h"


@interface PHQ7ViewController () <JSMessagesViewDelegate, JSMessagesViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIActionSheetDelegate>
{
    
    NSMutableDictionary *strarr;
    NSMutableArray *strarr1;
    NSMutableArray *newarr;
    NSString *str;
    NSString *text;
    NSString *text1;
    NSString *senderidlbl;
    NSString *receiveridlbl;
    UILabel *label1;
    UILabel *label2;
}
@property (strong, nonatomic) NSMutableArray *messageArray;
@property (nonatomic,strong) UIImage *willSendImage;
@end

@implementation PHQ7ViewController
@synthesize messageArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    self.title = @"ChatMessage";
    
    self.delegate = self;
    self.dataSource = self;
    
    self.messageArray = [NSMutableArray array];
    
    
//    _detail=[_detail1 valueForKey:@"friend_id"];
//    _usernamelbl.text=[_detail1 valueForKey:@"friend_username"];
//    [self callallchathistory];
//
//    NSString *imgStr = [_detail1 valueForKey:@"friend_img"];
//
//
//    if ([imgStr isEqual:(id)[NSNull null]] || [imgStr isEqualToString:@""])
//    {
//        _userimg.image = [UIImage imageNamed:@"user.png"];
//
//    }
//    else
//    {
//
//        if([[_detail1 valueForKey:@"img_status"] integerValue]==1)
//        {
//            NSString *imgStr = [_detail1 valueForKey:@"friend_img"];
//
//            if ([imgStr isEqual:(id)[NSNull null]] || [imgStr isEqualToString:@""])
//            {
//                _userimg.image = [UIImage imageNamed:@"user.png"];
//
//            }
//            else
//            {
//             //   [_userimg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ec2-18-216-29-175.us-east-2.compute.amazonaws.com/servicebus/profile_pic/%@",[_detail1  valueForKey:@"friend_img"]]] placeholderImage:nil];
//                _userimg.contentMode=UIViewContentModeScaleToFill;
//            }
//        }
//        else if([[_detail1 valueForKey:@"img_status"] integerValue]==0)
//        {
//
//          //  [_userimg setImageWithURL:[_detail1 valueForKey:@"friend_img"]placeholderImage:nil];
//            _userimg.contentMode=UIViewContentModeScaleToFill;
//        }
    
   // }
    [self testData];
}
- (void)testData{
    MessageData *message1 = [[MessageData alloc] initWithMsgId:@"0001" text:@"This is a Chat Demo like iMessage.app" date:[NSDate date] msgType:JSBubbleMessageTypeIncoming mediaType:JSBubbleMediaTypeText img:nil];
    
    [self.messageArray addObject:message1];
    
    MessageData *message2 = [[MessageData alloc] initWithMsgId:@"0002" text:nil date:[NSDate date] msgType:JSBubbleMessageTypeOutgoing mediaType:JSBubbleMediaTypeImage img:@"demo1.jpg"];
    
    [self.messageArray addObject:message2];
    
    MessageData *message3 = [[MessageData alloc] initWithMsgId:@"0003" text:@"Up-to-date for iOS 6.0 and ARC (iOS 5.0+ required) Universal for iPhone Allows arbitrary message (and bubble) sizes Copy & paste text message && Save image message " date:[NSDate date] msgType:JSBubbleMessageTypeOutgoing mediaType:JSBubbleMediaTypeText img:nil];
    
    [self.messageArray addObject:message3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageArray.count;
    //return [strarr1 count];

}

#pragma mark - Messages view delegate
- (void)sendPressed:(UIButton *)sender withText:(NSString *)text
{
    int value = arc4random() % 1000;
    NSString *msgId = [NSString stringWithFormat:@"%d",value];
    
    JSBubbleMessageType msgType;
    if((self.messageArray.count - 1) % 2){
        msgType = JSBubbleMessageTypeOutgoing;
        [JSMessageSoundEffect playMessageSentSound];
    }else{
        msgType = JSBubbleMessageTypeIncoming;
        [JSMessageSoundEffect playMessageReceivedSound];
    }
    
    MessageData *message = [[MessageData alloc] initWithMsgId:msgId text:text date:[NSDate date] msgType:msgType mediaType:JSBubbleMediaTypeText img:nil];
    
    [self.messageArray addObject:message];
    
    [self finishSend:NO];
}


//- (void)cameraPressed:(id)sender{
//
//    [self.inputToolBarView.textView resignFirstResponder];
//
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"相册", nil];
//    [actionSheet showInView:self.view];
//}

#pragma mark -- UIActionSheet Delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        case 1:{
            int value = arc4random() % 1000;
            NSString *msgId = [NSString stringWithFormat:@"%d",value];
            
            JSBubbleMessageType msgType;
            if((self.messageArray.count - 1) % 2){
                msgType = JSBubbleMessageTypeOutgoing;
                [JSMessageSoundEffect playMessageSentSound];
            }else{
                msgType = JSBubbleMessageTypeIncoming;
                [JSMessageSoundEffect playMessageReceivedSound];
            }
            
            MessageData *message = [[MessageData alloc] initWithMsgId:msgId text:nil date:[NSDate date] msgType:msgType mediaType:JSBubbleMediaTypeImage img:@"demo1.jpg"];

            [self.messageArray addObject:message];
            
            [self finishSend:YES];
        }
            break;
    }
}

- (JSBubbleMessageType)messageTypeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageData *message = self.messageArray[indexPath.row];
    return message.messageType;
}

- (JSBubbleMessageStyle)messageStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return JSBubbleMessageStyleFlat;
}

- (JSBubbleMediaType)messageMediaTypeForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageData *message = self.messageArray[indexPath.row];
    return message.mediaType;
}

- (UIButton *)sendButton
{
    return [UIButton defaultSendButton];
}

- (JSMessagesViewTimestampPolicy)timestampPolicy
{
    /*
     JSMessagesViewTimestampPolicyAll = 0,
     JSMessagesViewTimestampPolicyAlternating,
     JSMessagesViewTimestampPolicyEveryThree,
     JSMessagesViewTimestampPolicyEveryFive,
     JSMessagesViewTimestampPolicyCustom
     */
    return JSMessagesViewTimestampPolicyEveryThree;
}

- (JSMessagesViewAvatarPolicy)avatarPolicy
{
    /*
     JSMessagesViewAvatarPolicyIncomingOnly = 0,
     JSMessagesViewAvatarPolicyBoth,
     JSMessagesViewAvatarPolicyNone
     */
    return JSMessagesViewAvatarPolicyBoth;
}

- (JSAvatarStyle)avatarStyle
{
    /*
     JSAvatarStyleCircle = 0,
     JSAvatarStyleSquare,
     JSAvatarStyleNone
     */
    return JSAvatarStyleCircle;
}

- (JSInputBarStyle)inputBarStyle
{
    /*
     JSInputBarStyleDefault,
     JSInputBarStyleFlat
     */
    return JSInputBarStyleFlat;
}

//  Optional delegate method
//  Required if using `JSMessagesViewTimestampPolicyCustom`
//  - (BOOL)hasTimestampForRowAtIndexPath:(NSIndexPath *)indexPath
//

#pragma mark - Messages view data source
- (NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageData *message = self.messageArray[indexPath.row];
    return message.text;
}

- (NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageData *message = self.messageArray[indexPath.row];
    return message.date;
}

- (UIImage *)avatarImageForIncomingMessage
{
    return [UIImage imageNamed:@""];
    // demo-avatar-jobs
}

- (SEL)avatarImageForIncomingMessageAction
{
    return @selector(onInComingAvatarImageClick);
}

- (void)onInComingAvatarImageClick
{
    NSLog(@"__%s__",__func__);
}

- (SEL)avatarImageForOutgoingMessageAction
{
    return @selector(onOutgoingAvatarImageClick);
}

- (void)onOutgoingAvatarImageClick
{
    NSLog(@"__%s__",__func__);
}

- (UIImage *)avatarImageForOutgoingMessage
{
    return [UIImage imageNamed:@""];
    //demo-avatar-woz
}

- (id)dataForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageData *message = self.messageArray[indexPath.row];
    return [UIImage imageNamed:message.img];
}

//-(void)callchatService
//{
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"chatapi" forKey:@"name"];
//
//    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
//
//    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"senderid"];
//    if ([_strdetail isEqualToString:@"search"])
//    {
//        [dict1 setValue:_detail forKey:@"receiverid"];
//
//    }
//    [dict1 setValue:_detail forKey:@"receiverid"];
//    [dict1 setValue:_chatTF.text forKey:@"msg"];
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManager:@"chat" :dict :dict1];
//    //    senderidlbl=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]];
//    //
//    //    if ([_strdetail isEqualToString:@"search"]) {
//    //        receiveridlbl =_detail;
//    //
//    //    }
//    //    else
//    //    {
//    //        receiveridlbl =_detail;
//    //    }
//    //    sqlite3_stmt *statement;
//    //    const char *dbpath = [_databasePath UTF8String];
//    //
//    //    if (sqlite3_open(dbpath, &_DB) == SQLITE_OK) {
//    //
//    //        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO chats (msg,senderid,receiverid) VALUES (\"%@\",\"%@\",\"%@\")", _chatTF.text,senderidlbl,receiveridlbl];
//    //        const char *insert_statement = [insertSQL UTF8String];
//    //        sqlite3_prepare_v2(_DB, insert_statement, -1, &statement, NULL);
//    //        if (sqlite3_step(statement) == SQLITE_DONE) {
//    //
//    //            [self showUIAlertWithMessage:@"User added to the database" andTitle:@"Message"];
//    //            _chatTF.text=@"";
//    //        }
//    //        else
//    //        {
//    //            [self showUIAlertWithMessage:@"Failed to add the user" andTitle:@"Error"];
//    //
//    //        }
//    //        sqlite3_finalize(statement);
//    //        [self callchathistory];
//    //        sqlite3_close(_DB);
//    //    }
//
//
//
//}
//-(void)callchathistory
//{
//    _chatTF.text = @"";
//    //
//    //    sqlite3_stmt *statement;
//    //    const char *dbpath= [_databasePath UTF8String];
//    //    if (sqlite3_open(dbpath, &_DB) ==  SQLITE_OK)
//    //    {
//    //        NSString *querySQL = [NSString stringWithFormat:@"SELECT msg FROM users WHERE senderid && receiverid=\"%%@\"\"%%@\"", senderidlbl,receiveridlbl];
//    //        const char *query_statement= [querySQL UTF8String];
//    //        if (sqlite3_prepare_v2(_DB, query_statement, -1, &statement, NULL)== SQLITE_OK)
//    //        {
//    //            if (sqlite3_step(statement)== SQLITE_ROW)
//    //            {
//    //                NSString *msgField =[[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
//    //               // _chatTF.text=msgField;
//    //
//    //                newarr=[[NSMutableArray alloc]initWithArray:msgField];
//    //                            [newarr mutableCopy];
//    //
//    //                            int lastIndex = [newarr count] - 1;
//    //                             strarr =[newarr objectAtIndex:lastIndex];
//    //
//    //                            [self callallchathistory];
//    //                            //}
//    //
//    //                [_tableviewbj reloadData];
//    //                [self showUIAlertWithMessage:@"Match found in database" andTitle:@"Message"];
//    //            }
//    //            else
//    //            {
//    //                  [self showUIAlertWithMessage:@"Match not found in database" andTitle:@"Message"];
//    //                _chatTF.text=@"";
//    //
//    //            }
//    //            sqlite3_finalize(statement);
//    //        }
//    //        else
//    //        {
//    //            [self showUIAlertWithMessage:@"failed to  search the  database" andTitle:@"Message"];
//    //        }
//    //        sqlite3_finalize(statement);
//    //        sqlite3_close(_DB);
//    //
//    //    }
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"chatapi1" forKey:@"name"];
//
//    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
//
//    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"receiverid"];
//    if ([_strdetail isEqualToString:@"search"])
//    {
//        [dict1 setValue:_detail forKey:@"senderid"];
//    }
//    [dict1 setValue:_detail forKey:@"senderid"];
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManager:@"chathistory" :dict :dict1];
//
//}
//-(void)callallchathistory
//{
//
//    //    sqlite3_stmt *statement;
//    //    const char *dbpath= [_databasePath UTF8String];
//    //    if (sqlite3_open(dbpath, &_DB) ==  SQLITE_OK)
//    //    {
//    //        NSString *querySQL = [NSString stringWithFormat:@"SELECT msg FROM users WHERE senderid && receiverid=\"%%@\"\"%%@\"", receiveridlbl,senderidlbl];
//    //        const char *query_statement= [querySQL UTF8String];
//    //        if (sqlite3_prepare_v2(_DB, query_statement, -1, &statement, NULL)== SQLITE_OK)
//    //        {
//    //            if (sqlite3_step(statement)== SQLITE_ROW)
//    //            {
//    //                NSString *msgField =[[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
//    //                // _chatTF.text=msgField;
//    //
//    //                strarr1 =[[NSMutableArray alloc]initWithArray:msgField];
//    //
//    //                        [strarr1 mutableCopy];
//    //
//    //                      //  NSString *imgStr3 = [[responseDictionary valueForKey:@"data"] valueForKey:@"status"];
//    //                        NSString *imgStr4 = msgField;
//    //
//    //
//    //                        if ([imgStr4 isEqualToString:@""])
//    //                        {
//    //
//    //                        }
//    //                      else
//    //                        {
//    //                            int lastIndex = [strarr1 count] - 1;
//    //                            [_tableviewbj reloadData];
//    //                            NSIndexPath* ip = [NSIndexPath indexPathForRow:lastIndex inSection:0];
//    //                            [_tableviewbj scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
//    //
//    //                        }
//    //
//    //                [_tableviewbj reloadData];
//    //                [self showUIAlertWithMessage:@"Match found in database" andTitle:@"Message"];
//    //            }
//    //            else
//    //            {
//    //                [self showUIAlertWithMessage:@"Match not found in database" andTitle:@"Message"];
//    //                _chatTF.text=@"";
//    //
//    //            }
//    //            sqlite3_finalize(statement);
//    //        }
//    ////        else
//    ////        {
//    ////            [self showUIAlertWithMessage:@"failed to  search the  database" andTitle:@"Message"];
//    ////        }
//    //        sqlite3_finalize(statement);
//    //        sqlite3_close(_DB);
//    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
//    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
//    [dict setValue:@"chatapi2" forKey:@"name"];
//
//    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
//    //[dict1 setValue:[[NSUserDefaults standardUserDefaults]valueForKey:@"id"] forKey:@"id"];
//
//    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"sender"];
//    if ([_strdetail isEqualToString:@"search"]) {
//        [dict1 setValue:_detail forKey:@"receiver"];
//
//    }
//    [dict1 setValue:_detail forKey:@"receiver"];
//
//
//    [webServiceManager setDelegateMethode:self];
//    [webServiceManager callMyWebServiceManagerByGet:@"chathistory_idwise" :dict :dict1];
//}
//
//-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
//{
//
//    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatapi"])
//    {
//        if ([[responseDictionary valueForKey:@"sucess"] integerValue] ==1)
//        {
//            [self callchathistory];
//            // strarr =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
//        }
//    }
//    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatapi1"])
//    {
//        if ([[responseDictionary valueForKey:@"status"] integerValue] ==1)
//        {
//            newarr=[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
//            [newarr mutableCopy];
//
//            //            if ([newarr isEqual:(id)[NSNull null]] || [newarr isEqual:@""] )
//            //            {
//
//            //            }
//            //            else
//            //            {
//            int lastIndex = [newarr count] - 1;
//            strarr =[newarr objectAtIndex:lastIndex];
//
//            [self callallchathistory];
//            //}
//            // [_tableviewbj reloadData];
//        }
//    }
//    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"chatapi2"])
//    {
//
//        //    if ([[responseDictionary valueForKey:@"status"] integerValue] ==1)
//        //    {
//
//        //  strarr1 =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
//
//        messageArray =[[NSMutableArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
//
//        [messageArray mutableCopy];
//
//        //  NSString *imgStr3 = [[responseDictionary valueForKey:@"data"] valueForKey:@"status"];
//        NSString *imgStr4 = [responseDictionary valueForKey:@"msg"];
//
//
//        if ([imgStr4 isEqualToString:@"Id Not Match"])
//        {
//
//        }
//        else
//        {
//            int lastIndex = [strarr1 count] - 1;
//            [_tableviewbj reloadData];
//            NSIndexPath* ip = [NSIndexPath indexPathForRow:lastIndex inSection:0];
//            [_tableviewbj scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
//
//        }
//
//
//        // [strarr1 addObject:strarr];
//
//
//
//
//    }
//}



@end
