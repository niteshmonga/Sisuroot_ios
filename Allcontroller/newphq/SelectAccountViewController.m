//
//  SelectAccountViewController.m
//  Root
//
//  Created by Epikso on 12/10/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "SelectAccountViewController.h"
#import "FeedViewController.h"
#import "SettingViewController.h"
#import "PaymentViewController.h"

@interface SelectAccountViewController ()

@end

@implementation SelectAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)BackBtnAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)HomeBtnAction:(id)sender {
    
    FeedViewController *LVC3=[[FeedViewController alloc]init];
    [self.navigationController pushViewController:LVC3 animated:YES];
}
- (IBAction)MakepaymentBtnAction:(id)sender {
    
    PaymentViewController *LVC3=[[PaymentViewController alloc]init];
    [self.navigationController pushViewController:LVC3 animated:YES];
}
- (IBAction)MakepaymentBtn1Action:(id)sender {
 
    PaymentViewController *LVC3=[[PaymentViewController alloc]init];
    [self.navigationController pushViewController:LVC3 animated:YES];
}



@end
