#import "ShareViewController.h"
#import "ShareTableViewCell.h"
#import "feedViewController.h"
#import "UIImageView+WebCache.h"
#import "MyWebserviceManager.h"
#import "Base64.h"
#import "UIView+RNActivityView.h"
#import "BS1ViewController.h"
#import "FriendsViewController.h"

@interface ShareViewController ()
{
    
    NSMutableArray *innerarr;
    NSMutableArray *outer;
    BOOL flag1;
    BOOL check1;
    NSString *sel_friend_circle;
    NSString *Friendid;
    NSMutableArray *checkarr;
    NSString *checkedstr;
    NSString *strflag;
    NSMutableArray *arrayCheckUnchek;
    NSMutableArray *cellDataArray;
    NSString *strshare;
    NSMutableArray *friendarrid;
    NSMutableArray *arrid;
    NSArray *arrayWithoutDuplicates;
    NSString *tadstatusstr;
}
@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_img_post setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"tag_photo/",_str_img] placeholderImage:nil];
    _img_post.contentMode=UIViewContentModeScaleAspectFill;
    sel_friend_circle=@"1";
   
    _btn_cancel.layer.borderColor= UIColor.whiteColor.CGColor;
    _btn_cancel.layer.borderWidth=1.0;
    _btn_cancel.layer.cornerRadius=5;
    _btn_cancel.clipsToBounds=YES;
    _view_share_again_in.layer.cornerRadius=10;
    _view_share_again_in.clipsToBounds=YES;
    _img_post.layer.cornerRadius=10;
     _img_post.clipsToBounds=YES;
    _img_user.layer.cornerRadius=20;
     _img_user.clipsToBounds=YES;
    
     _view_share_agin.hidden=YES;
     [FIRAnalytics setScreenName:@"Share to inner friends" screenClass:@"Share to inner friends"];
    self.navigationController.navigationBar.hidden=YES;
    _Postbtnobj.layer.cornerRadius=15;
    _Postbtnobj.clipsToBounds=YES;
    
    _view_inner.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
    _view_outer.backgroundColor=[UIColor clearColor];
    UIBezierPath *maskPath = [UIBezierPath
               bezierPathWithRoundedRect:self.view_inner.bounds
               byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
               cornerRadii:CGSizeMake(20, 20)
        ];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = _view_inner.bounds;
        maskLayer.path = maskPath.CGPath;
        self.view_inner.layer.mask = maskLayer;
    
    arrayCheckUnchek = [[NSMutableArray alloc]init];
    [self callinnerlist:@"1"];
    friendarrid=[[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)callinnerlist:(NSString *)groupid
{
    MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setValue:@"groupFriends" forKey:@"name"];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
    
    [dict1 setValue:groupid forKey:@"group_id"];
    [dict1 setValue:_str2 forKey:@"tag_id"];
    
    [webServiceManager setDelegateMethode:self];
    [webServiceManager callMyWebServiceManager:@"groupFriends":dict :dict1];
}

-(void) processCompleted :(NSString *)methodeName :(NSDictionary *)methodeDictionary :(NSDictionary *)responseDictionary
{
    // ActivityIndicator.hidden=YES;
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"groupFriends"])
    {
        NSLog(@"test...%@",responseDictionary);
        
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            NSArray *localArray =[[NSArray alloc]initWithArray:[responseDictionary valueForKey:@"data"]];
            
            innerarr = [[NSMutableArray alloc] init];
            
             for (int i = 0; i <localArray.count; i++)
            {
                NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                dict = [[localArray objectAtIndex:i] mutableCopy];
                [dict setValue:@"0" forKey:@"status"];
                [innerarr addObject:dict];
            }
            
            [_ShareTableviewobj reloadData];
        }
        else
       {
                    UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    alert.tag=4009;
                    [alert show];
        innerarr = [[NSMutableArray alloc] init];
          [_ShareTableviewobj reloadData];
        
    }
    }
    
    if ([[methodeDictionary valueForKey:@"name"] isEqualToString:@"shareTag"])
    {
        NSLog(@"test...%@",responseDictionary);
        
        if ([[responseDictionary valueForKey:@"status"] integerValue] ==200)
        {
            _view_share_agin.hidden=YES;
        UIAlertView *alert =   [[UIAlertView alloc] initWithTitle:@"SISUROOT" message:[responseDictionary valueForKey:@"status_message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                                [alert show];
            if ([sel_friend_circle isEqualToString:@"2"])
            {
                 [self callinnerlist:@"2"];
                sel_friend_circle=@"2";
            }
            else
            {
                 [self callinnerlist:@"1"];
                sel_friend_circle=@"1";
            }
        }
    }
}


- (IBAction)innerbtnclick:(id)sender {
    _view_inner.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
    
    UIBezierPath *maskPath = [UIBezierPath
          bezierPathWithRoundedRect:self.view_inner.bounds
          byRoundingCorners:(UIRectCornerBottomRight | UIRectCornerTopRight)
          cornerRadii:CGSizeMake(20, 20)
      ];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = _view_inner.bounds;
      maskLayer.path = maskPath.CGPath;
    self.view_inner.layer.mask = maskLayer;
    [self callinnerlist:@"1"];
    sel_friend_circle=@"1";
    _view_outer.backgroundColor=[UIColor clearColor];
}

- (IBAction)outerbtnclick:(id)sender {
    _view_outer.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
   UIBezierPath *maskPath = [UIBezierPath
        bezierPathWithRoundedRect:self.view_outer.bounds
        byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
        cornerRadii:CGSizeMake(20, 20)
    ];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = _view_outer.bounds;
    maskLayer.path = maskPath.CGPath;
    self.view_outer.layer.mask = maskLayer;
      [self callinnerlist:@"2"];
    sel_friend_circle=@"2";
   _view_inner.backgroundColor=[UIColor clearColor];
}

-(void) processFailed :(NSError *)responseDictionary
{
     _view_share_agin.hidden=YES;
     NSLog(@"error");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return innerarr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *iden=@"ListtableView";
    ShareTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:iden];
    if (cell==nil)
    {
        NSArray * array =[[NSBundle mainBundle]loadNibNamed:@"ShareTableViewCell" owner:self options:nil];
        cell=[array objectAtIndex:0];
        
    }
    cell.Usernamelbl.text=[[innerarr objectAtIndex:indexPath.row] valueForKey:@"username"];
    NSString *imgStr1 = [[innerarr objectAtIndex:indexPath.row]valueForKey:@"profile_img"];
    
    if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
    {
        cell.Userimg.image = [UIImage imageNamed:@"user.png"];
    }
    else
    {
        
        if([[[innerarr objectAtIndex:indexPath.row] valueForKey:@"img_status"] integerValue]== 1)
            
        {
            if ([imgStr1 isEqual:(id)[NSNull null]] ||[imgStr1 isEqualToString:@""])
             {
                cell.Userimg.image = [UIImage imageNamed:@"user.png"];
                
            }
            else
            {
                 [cell.Userimg setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[innerarr objectAtIndex:indexPath.row]valueForKey:@"profile_img"]] placeholderImage:nil];
                cell.Userimg.contentMode=UIViewContentModeScaleToFill;
            }
        }
        else
        {
            [cell.Userimg setImageWithURL:[[innerarr objectAtIndex:indexPath.row]valueForKey:@"profile_img"]placeholderImage:nil];
            cell.Userimg.contentMode=UIViewContentModeScaleToFill;
        }
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(280.0, 25.0, 35.0, 35.0)];
    
    
    if ([[[innerarr objectAtIndex:indexPath.row] valueForKey:@"tad_status"] integerValue] == 1)
    {
        cell.Circleimg.image = [UIImage imageNamed:@"checkbox_40px.png"];
    }
    else
    {
        cell.Circleimg.image = [UIImage imageNamed:@"square.png"];
    }
    cell.RequestBtnobj.tag = indexPath.row;
    [cell.RequestBtnobj addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

-(void)buttonClicked  : (UIButton *) btn
{
   Friendid = [[innerarr objectAtIndex:btn.tag] valueForKey:@"id"];
    tadstatusstr=[[innerarr objectAtIndex:btn.tag] valueForKey:@"tad_status"];
    
    NSString *imgStr1 = [[innerarr objectAtIndex:btn.tag]valueForKey:@"profile_img"];
    
    if ([imgStr1 isEqual:(id)[NSNull null]] || [imgStr1 isEqualToString:@""])
    {
        _img_user.image = [UIImage imageNamed:@"user.png"];
    }
    else
    {
        
        if([[[innerarr objectAtIndex:btn.tag] valueForKey:@"img_status"] integerValue]== 1)
            
        {
            if ([imgStr1 isEqual:(id)[NSNull null]] ||[imgStr1 isEqualToString:@""])
             {
                _img_user.image = [UIImage imageNamed:@"user.png"];
                
            }
            else
            {
                 [_img_user setImageWithURL:[NSString stringWithFormat:@"%@%@%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"publicurl"],@"profile_pic/",[[innerarr objectAtIndex:btn.tag]valueForKey:@"profile_img"]] placeholderImage:nil];
                _img_user.contentMode=UIViewContentModeScaleToFill;
            }
        }
        else
        {
            [_img_user setImageWithURL:[[innerarr objectAtIndex:btn.tag]valueForKey:@"profile_img"]placeholderImage:nil];
            _img_user.contentMode=UIViewContentModeScaleToFill;
        }
    }
    if ([[[innerarr objectAtIndex:btn.tag] valueForKey:@"tad_status"] integerValue] == 1)
    {
        _label_head.text=@"Unshare Post";
      //  _btn_share.titleLabel.text=@"Unshare";
    }
    else
    {
         _label_head.text=@"Share Post";
       //  _btn_share.titleLabel.text=@"Share";
    }
    _view_share_agin.hidden=NO;
}
- (IBAction)backBtnobj:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btn_share:(id)sender {
     [self Callpostshare];
}
- (IBAction)btn_cancel:(id)sender {
    _view_share_agin.hidden=YES;
}

-(void)Callpostshare
{
    if ([tadstatusstr integerValue] ==1)
    {
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"shareTag" forKey:@"name"];
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
        [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
        [dict1 setValue:Friendid forKey:@"share_to"];
        [dict1 setValue:_str2 forKey:@"tag_id"];
        [dict1 setValue:@"1" forKey:@"share_status"];
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"ShareTagPost":dict :dict1];
    }
    else
    {
        MyWebserviceManager *webServiceManager = [[MyWebserviceManager alloc]init];
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setValue:@"shareTag" forKey:@"name"];
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
        [dict1 setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"id"] forKey:@"id"];
        [dict1 setValue:Friendid forKey:@"share_to"];
        [dict1 setValue:_str2 forKey:@"tag_id"];
        [dict1 setValue:@"0" forKey:@"share_status"];
        [webServiceManager setDelegateMethode:self];
        [webServiceManager callMyWebServiceManager:@"ShareTagPost":dict :dict1];
    }
   
}
- (IBAction)PostBtn:(id)sender {
    BS1ViewController *pvc=[[BS1ViewController alloc]init];
    [self.navigationController pushViewController:pvc animated:YES];
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button Index =%ld",(long)buttonIndex);
    if (buttonIndex == 0)
    {
        NSLog(@"You have clicked Cancel");
        if(alertView.tag == 4009)
        {
            if([sel_friend_circle isEqualToString:@"1"])
            {
                _view_outer.backgroundColor = [UIColor colorWithRed:(12.0/255.0) green:(113.0/255) blue:(207.0/255) alpha:1];
                 UIBezierPath *maskPath = [UIBezierPath
                      bezierPathWithRoundedRect:self.view_outer.bounds
                      byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerTopLeft)
                      cornerRadii:CGSizeMake(20, 20)
                  ];
                  CAShapeLayer *maskLayer = [CAShapeLayer layer];
                  maskLayer.frame = _view_outer.bounds;
                  maskLayer.path = maskPath.CGPath;
                  self.view_outer.layer.mask = maskLayer;
                    [self callinnerlist:@"2"];
                  sel_friend_circle=@"2";
                 _view_inner.backgroundColor=[UIColor clearColor];
            }
            else
            {
                FriendsViewController *Hgn= [[FriendsViewController alloc]init];
                [Hgn setStr1:@"done"];
                [self.navigationController pushViewController:Hgn animated:YES];
            }
        }
        else
        {
        }
    }
    else if(buttonIndex == 1)
    {
        [self Callpostshare];
     }
}
@end
