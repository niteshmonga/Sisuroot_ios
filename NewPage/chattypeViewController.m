
#import "chattypeViewController.h"
#import "GraphView.h"
#import "GraphView1.h"
#import "SWRevealViewController.h"
#import "ChatfriendViewController.h"
#import "ChattherapistViewController.h"
#import "smilepage1ViewController.h"
#import "FeedViewController.h"
#import "Sisuroot-Swift.h"
@interface chattypeViewController ()

@end

@implementation chattypeViewController
- (IBAction)sos:(id)sender {
}

- (IBAction)btn_chat:(id)sender {
        ChatfriendViewController *VC1=[[ChatfriendViewController alloc]init];
       [self.navigationController pushViewController:VC1 animated:YES];
}

- (IBAction)btn_ther:(id)sender {
    ChattherapistViewController *VC1=[[ChattherapistViewController alloc]init];
          [self.navigationController pushViewController:VC1 animated:YES];
}


- (IBAction)btnhome:(id)sender {
     FeedViewController *VC1=[[FeedViewController alloc]init];
        [self.navigationController pushViewController:VC1 animated:YES];
    }
- (IBAction)btnyou:(id)sender {
    ME_YOUViewController *VC1=[[ME_YOUViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)btnfaq:(id)sender {
    smilepage1ViewController *VC1=[[smilepage1ViewController alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}


- (void)viewDidLoad {
    
    GraphView *graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, _tb_footer.frame.size.height, _tb_footer.frame.size.height)];
       graphView.backgroundColor = [UIColor clearColor];
       
       GraphView1 *graphView1 = [[GraphView1 alloc] initWithFrame:CGRectMake(0, 0,_tb_footer.frame.size.height, _tb_footer.frame.size.height)];
          graphView1.backgroundColor = [UIColor clearColor];
       [self.view_footer1 addSubview:graphView];
            [self.view_footer2 addSubview:graphView1];
      SWRevealViewController *revealController = [self revealViewController];
       revealController.panGestureRecognizer.enabled = YES;
         revealController.tapGestureRecognizer.enabled=YES;
       [revealController panGestureRecognizer];
       [revealController tapGestureRecognizer];
      [_btn_menu addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
     
    _view1.layer.borderWidth =1;
       _view1.layer.borderColor = [UIColor colorWithRed:(58.0/255.0) green:(183.0/255) blue:(255.0/255) alpha:1].CGColor;
       _view1.layer.cornerRadius=22;
       _view1.clipsToBounds=YES;
    
    
    _view2.layer.borderWidth =1;
       _view2.layer.borderColor = [UIColor colorWithRed:(58.0/255.0) green:(183.0/255) blue:(255.0/255) alpha:1].CGColor;
       _view2.layer.cornerRadius=22;
       _view2.clipsToBounds=YES;
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

@end
