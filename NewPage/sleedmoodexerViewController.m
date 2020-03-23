#import "smilepage1ViewController.h"
#import "sleedmoodexerViewController.h"
#import "FirstViewController.h"
#import "LeftViewController.h"
#import "SWRevealViewController.h"
#import "FeedViewController.h"
#import "LoginViewController.h"
#import "MyWebserviceManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "Base64.h"
#import <Photos/Photos.h>
#import "UIView+RNActivityView.h"
#import "UIImageView+WebCache.h"
#import "Reachability.h"
#import "LoginViewController.h"
#import "UIView+Toast.h"
#import "FriendsViewController.h"
#import "GalleryViewController.h"
#import "ChatfriendViewController.h"
#import "BS1ViewController.h"
#import "ResponseViewController.h"
#import "ViewController.h"
#import "GraphView1.h"
#import "GraphView.h"
#import "chattypeViewController.h"
#import "Sisuroot-Swift.h"
@interface sleedmoodexerViewController ()
{
    int bgselect;
    int bgselect1;
    int ques_select;
    int filterquesselect;
    int fil_ques_Sel;
    NSString *rememberstr;
    NSString *searchtextstr;
    NSString *str_videoname;
    NSMutableURLRequest *request;
    NSData *imageData;
    NSString *img_name;
}
@end
@implementation sleedmoodexerViewController

- (void)viewDidLoad {
    _tbl_view.delegate=self;
    [super viewDidLoad];
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
    graphView.backgroundColor = [UIColor clearColor];
    GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
    graphView1.backgroundColor = [UIColor clearColor];
      [self.view_footer1 addSubview:graphView];
          [self.view_footer2 addSubview:graphView1];
       
    [self callfetchprofile];
    _selectmood.imageEdgeInsets =UIEdgeInsetsMake(4,_selectmood.frame.size.width-45,4,10);
    //UIEdgeInsetsMake(_selectmood.titleLabel.frame.size.width-35, 4, 4, 5);
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *localDateString = [dateFormatter stringFromDate:currentDate];
    [NSUserDefaults.standardUserDefaults setValue:localDateString forKey:@"activity_ans_date1"];
    self.navigationController.navigationBar.hidden=YES;
    _btn_next.layer.cornerRadius=10;
    _str_anser3=@"";
    _str_anser2=@"";
    _str_anser1=@"";
    _listArray=[[NSMutableArray alloc]initWithObjects:@"I'm great",@"I'm okay",@"I'm meh",@"I'm struggling",@"I'm having a hard time & wouldn't mind a check in",@"I'm in a really dark place",nil];
    _tbl_view.separatorColor=UIColor.clearColor;
    _tbl_view.hidden=YES;
    _tbl_view.layer.cornerRadius=6;
    _tbl_view.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _tbl_view.layer.borderWidth =0.5f;
    _tbl_view.clipsToBounds=YES;
    _tbl_view.layer.masksToBounds = YES;
    self.navigationController.navigationBar.hidden=YES;
    SWRevealViewController *revealController = [self revealViewController];
    revealController.panGestureRecognizer.enabled = YES;
    revealController.tapGestureRecognizer.enabled=YES;
    [_btn_back addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    _img_profile.layer.cornerRadius=20;
    _img_profile.clipsToBounds=YES;
    _img_profile.layer.borderWidth =2;
    _img_profile.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
     _btn_profile.layer.cornerRadius=20;
     _btn_profile.clipsToBounds=YES;
     _btn_profile.layer.borderWidth =2;
     _btn_profile.layer.borderColor = [UIColor colorWithRed:(61.0/255.0) green:(181.0/255) blue:(230.0/255) alpha:1].CGColor;
    [self border:_btn_5];
    [self border:_btn_6];
    [self border:_btn_7];
    [self border:_btn_9];
    [self border:_btn_8];
}

-(void)border:(UIButton *)btn
{
    btn.layer.cornerRadius=25;
    btn.clipsToBounds=YES;
    btn.layer.borderWidth =1;
    btn.layer.borderColor = [[UIColor whiteColor]CGColor];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
    }
    else
    {
        //[self callwebsubmitanswer:@"0"];
    }
}

- (IBAction)btn_next:(id)sender {
    [self callwebsubmitanswer:@"0"];
}

-(void) processFailed :(NSError *)responseDictionary
{
    SWRevealViewController *revealController = [self revealViewController];
    LoginViewController *LVC=[[LoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:LVC];
    [revealController pushFrontViewController:nav animated:YES];
    NSLog(@"error");
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
   if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"activity_answer"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] == 200)
        {
            [self.view makeToast:@"Saved Successfully"
                        duration:2.0
                        position:CSToastPositionBottom];
            smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
            [self.navigationController pushViewController:VC1 animated:YES];
            NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
            if(navigationArray.count>2)
            {
            [navigationArray removeObjectAtIndex:navigationArray.count-2];
            self.navigationController.viewControllers = navigationArray;
            }
            else
            {
                //self.navigationController.viewControllers = navigationArray;
            }
                
        }
    }
    if([[methodeDictionary valueForKey:@"name"] isEqualToString:@"getProfileInfo"])
    {
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            [self.view hideActivityView];
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Chat_Status"] isEqual:@"0"])
            {
                [_chatbtnobj setUserInteractionEnabled:YES];
            }
            else
            {
                _chatbtnobj.alpha = 0.5;
                [_chatbtnobj setUserInteractionEnabled:NO];
            }
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"SOS_Status"] isEqual:@"0"])
            {
                [_btn_sos setUserInteractionEnabled:YES];
            }
            else
            {
               _btn_sos.alpha = 0.5;
               [_btn_sos setUserInteractionEnabled:NO];
            }
             if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"Sisuchat_Status"] integerValue]==1)
            {
               if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"])
                {
                    _chatnotification.hidden=YES;
                }
                else
                {
                    _chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
                }
            }
            else
            {
                _chatnotification.text=[[responseDictionary valueForKey:@"data"]valueForKey:@"count"];
                NSInteger b = [_chatnotification.text integerValue];
                
                NSString *str = [[responseDictionary valueForKey:@"data"]valueForKey:@"therapist_chat_count"];
                NSInteger j=[str integerValue];;
                j=b+j;
                NSString* myNewString = [NSString stringWithFormat:@"%li", (long)j];
                _chatnotification.text=myNewString;
            }
            if ([[[responseDictionary valueForKey:@"data"]valueForKey:@"count"] isEqual:@"0"] && [[[responseDictionary valueForKey:@"data"]valueForKey:@"therapist_chat_count"] integerValue]==0)
            {
                _chatnotification.hidden=YES;
                
            }
           NSString *imgStr = [[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"];
            
            
            if ([imgStr isEqual:(id)[NSNull null]] || imgStr.length < 1 )
            {
                _img_profile.image = [UIImage imageNamed:@"user.png"];
            }
            else if([[[responseDictionary valueForKey:@"data"] valueForKey:@"img_status"] integerValue]==1)
            {
                [_img_profile setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]]] placeholderImage:nil];
                _img_profile.contentMode=UIViewContentModeScaleToFill;
            }
            else
            {
                [_img_profile setImageWithURL:[[responseDictionary valueForKey:@"data"]valueForKey:@"profile_img"]placeholderImage:nil];
                _img_profile.contentMode=UIViewContentModeScaleToFill;
            } } }
}
-(void)callwebsubmitanswer:(NSString *)str_anony
{
    NSString *answer=[NSString stringWithFormat:@"%@,%@,%@",_str_anser1,_str_anser2,_str_anser3];
    if([answer isEqualToString:@",,"])
    {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
    NSMutableArray *navigationArray = [[NSMutableArray alloc] initWithArray: self.navigationController.viewControllers];
    [navigationArray removeObjectAtIndex:navigationArray.count-2];
         self.navigationController.viewControllers = navigationArray;
         
    }
    else
    {
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"activity_answer" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"user_id"];
    [dict1 setValue:@"0" forKey:@"Qes_id"];
    [dict1 setValue:answer forKey:@"answer"];
    [dict1 setValue:str_anony forKey:@"anonymous"];
               [dict1 setValue:@"0" forKey:@"ans_type"];
        NSDate *currentDate = [[NSDate alloc] init];
        NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
        // or Timezone with specific name like
        // [NSTimeZone timeZoneWithName:@"Europe/Riga"] (see link below)
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeZone:timeZone];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:ii:ss"];
        NSString *localDateString = [dateFormatter stringFromDate:currentDate];
         [dict1 setValue:localDateString forKey:@"date"];
       
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"activity_answer" :dict :dict1];
    
    }
}
- (IBAction)btn5:(id)sender {
    _str_anser2=_btn_5.titleLabel.text;
    
   [self setCustomButtonStyle:_btn_5 fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
   
   [self setCustomButtonStyle:_btn_6 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
    [self setCustomButtonStyle:_btn_7 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
    [self setCustomButtonStyle:_btn_8 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_9 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
}

- (IBAction)btn6:(id)sender {
    _str_anser2=_btn_6.titleLabel.text;
      [self setCustomButtonStyle:_btn_6 fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
    
    [self setCustomButtonStyle:_btn_5 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_7 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_8 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
      [self setCustomButtonStyle:_btn_9 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];

}
- (IBAction)btn7:(id)sender {
    _str_anser2=_btn_7.titleLabel.text;
         [self setCustomButtonStyle:_btn_7 fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
      
      [self setCustomButtonStyle:_btn_6 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
       [self setCustomButtonStyle:_btn_5 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
       [self setCustomButtonStyle:_btn_8 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
        [self setCustomButtonStyle:_btn_9 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];

}
- (IBAction)btn8:(id)sender {
    _str_anser2=_btn_8.titleLabel.text;
        [self setCustomButtonStyle:_btn_8 fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
      
      [self setCustomButtonStyle:_btn_6 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
       [self setCustomButtonStyle:_btn_7 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
       [self setCustomButtonStyle:_btn_5 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
        [self setCustomButtonStyle:_btn_9 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];

}
- (IBAction)btn9:(id)sender {
    _str_anser2=_btn_9.titleLabel.text;
       [self setCustomButtonStyle:_btn_9 fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
    
    [self setCustomButtonStyle:_btn_6 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_7 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_8 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
      [self setCustomButtonStyle:_btn_5 fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];

}

- (IBAction)btn_feel:(id)sender {
    if(_tbl_view.hidden==YES)
    {
        _tbl_view.hidden=NO;
    }
    else
    {
        _tbl_view.hidden=YES;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _listArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault   reuseIdentifier:@"cell"];
        
    }
   
    cell.textLabel.text =  [NSString stringWithFormat:@"  %@",[_listArray objectAtIndex:indexPath.row]];
    cell.textLabel.font= [UIFont systemFontOfSize:18.0f];
    cell.textLabel.lineBreakMode=UILineBreakModeWordWrap;
    cell.textLabel.numberOfLines=0;
    cell.textLabel.textAlignment=UITextAlignmentLeft;
     [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _btn_feel.text= [NSString stringWithFormat:@"  %@",[_listArray objectAtIndex:indexPath.row]];
    _str_anser1= [_listArray objectAtIndex:indexPath.row];
    _tbl_view.hidden=YES;
    
}
- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btn_chat:(id)sender {
    chattypeViewController *VC1=[[chattypeViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btn_home:(id)sender {
    FeedViewController *SVC=[[FeedViewController alloc]init];
    [SVC setStr2:@"done"];
    [self.navigationController pushViewController:SVC animated:YES];
}
-(void)setCustomButtonStyle:(UIButton *)button fromColor:(UIColor *)fromColor toColor:(UIColor *)toColor
{
  //Set Title color as you want
  //check gradientlayer exist
  id layer = nil;
  if (button.layer.sublayers.count > 0) {
    layer = [button.layer.sublayers objectAtIndex:0];
  }
  //Find added gradient layer
  CAGradientLayer *addedGradLayer = nil;
  if (layer) {
    if ([layer isKindOfClass:[CAGradientLayer class]]) {
       addedGradLayer = (CAGradientLayer *)[button.layer.sublayers objectAtIndex:0];
    }
  }

  //check gradient layer exists
  if (!addedGradLayer) //first time
  {
     CAGradientLayer *gradientLayer = [CAGradientLayer layer];
     gradientLayer.frame = button.layer.bounds;
     gradientLayer.colors = [NSArray arrayWithObjects:
                           (id)fromColor.CGColor,
                           (id)toColor.CGColor,
                           nil];

     gradientLayer.locations = [NSArray arrayWithObjects:
                              [NSNumber numberWithFloat:0.0f],
                              [NSNumber numberWithFloat:1.0f],
                              nil];

     gradientLayer.cornerRadius = button.layer.cornerRadius;
     [button.layer insertSublayer:gradientLayer atIndex:0];
     button.clipsToBounds = YES;
  }
  else //next time
  {

     CAGradientLayer *newGradientLayer = [CAGradientLayer layer];
     newGradientLayer.frame = button.layer.bounds;
     newGradientLayer.colors = [NSArray arrayWithObjects:
                              (id)fromColor.CGColor,
                              (id)toColor.CGColor,
                              nil];

     newGradientLayer.locations = [NSArray arrayWithObjects:
                                 [NSNumber numberWithFloat:0.0f],
                                 [NSNumber numberWithFloat:1.0f],
                                 nil];

     newGradientLayer.cornerRadius = button.layer.cornerRadius;
     [button.layer replaceSublayer:addedGradLayer with:newGradientLayer];
   }
}


- (IBAction)btn_none:(id)sender {
    _str_anser3=_btn_none.titleLabel.text;
    [self setCustomButtonStyle:_btn_none fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
    
    
    [self setCustomButtonStyle:_btn_30min fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_1hr fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_1hr_greater fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
}

- (IBAction)btn_30_min:(id)sender {
    _str_anser3=_btn_30min.titleLabel.text;
     
    [self setCustomButtonStyle:_btn_30min fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
    
    [self setCustomButtonStyle:_btn_none fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_1hr fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_1hr_greater fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
    
    
}
- (IBAction)btn_1hr:(id)sender {
    _str_anser3=_btn_1hr.titleLabel.text;
    [self setCustomButtonStyle:_btn_1hr fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
    
    [self setCustomButtonStyle:_btn_none fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_30min fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_1hr_greater fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
    
}
- (IBAction)btn_1hr_gtrater:(id)sender {
    _str_anser3=_btn_1hr_greater.titleLabel.text;
    [self setCustomButtonStyle:_btn_1hr_greater fromColor:[UIColor colorWithRed:(5.0/255.0) green:(151.0/255) blue:(183.0/255) alpha:1] toColor:[UIColor colorWithRed:(35.0/255.0) green:(37.0/255) blue:(82.0/255) alpha:1]];
    
    [self setCustomButtonStyle:_btn_none fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_1hr fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
     [self setCustomButtonStyle:_btn_30min fromColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1] toColor:[UIColor colorWithRed:(30.0/255.0) green:(32.0/255) blue:(65.0/255) alpha:1]];
}

- (IBAction)btn_friend:(id)sender {
    FriendsViewController *FVC=[[FriendsViewController alloc]init];
    
    [self.navigationController pushViewController:FVC animated:YES];
}
- (IBAction)btn_gallery:(id)sender {
    GalleryViewController *gvc=[[GalleryViewController alloc]init];
    [self.navigationController pushViewController:gvc animated:YES];
}


- (IBAction)btn_back:(id)sender {
}

- (IBAction)btn_sos:(id)sender {
    BS1ViewController *BSVC=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:BSVC animated:YES];
}
- (IBAction)btn_notification:(id)sender
{
    ResponseViewController *RVC=[[ResponseViewController alloc]init];
    [RVC setCountstr:_countlblstr];
    [self.navigationController pushViewController:RVC animated:YES];
}

-(void)callfetchprofile
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"getProfileInfo" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]init];
    [dict1 setValue:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"id"]] forKey:@"id"];
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"getProfileInfo" :dict :dict1];
    
}

@end

