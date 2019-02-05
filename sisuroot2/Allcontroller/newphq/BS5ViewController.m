//
//  BS5ViewController.m
//  Root
//
//  Created by BRIJESH KUMAR on 04/05/18.
//  Copyright © 2018 EpikSolutions. All rights reserved.
//

#import "BS5ViewController.h"
#import "BS6ViewController.h"

@interface BS5ViewController ()

@end

@implementation BS5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    if ([_brief5str isEqualToString:@"briefstr"])
    {
        _BSAlbl.text=@"I feel calm";
        _Questionlbl.text=@"Question1/6";
        _Btn1lbl.text=@"Not at all";
        _Btn2lbl.text=@"Somewhat";
         _Btn3lbl.text=@"Moderately";
        _Btn4lbl.text=@"Very much";
    }
    if ([_percieved4str isEqualToString:@"percievedstr"])
    {
        _BSAlbl.text=@"In the last month,  how  often  have you felt that things  were  going your way?";

        _Questionlbl.text=@"Question5/10";
        _Btn1lbl.text=@"Not at all";
        _Btn1lbl.text=@"Days";
        
        _Btn1lbl.text=@"The days";
        _Btn1lbl.text=@"Day";
        
        
    }
    if ([_phq4 isEqualToString:@"phqstr"])
    {
        _BSAlbl.text=@"Feeling tired or having little energy";
        _Questionlbl.text=@"Question4/9";
        _Btn1lbl.text=@"Not at all";
        _Btn1lbl.text=@"Days";
         _Btn1lbl.text=@"The days";
        _Btn1lbl.text=@"Day";
        
     }
    [_Btn1obj setBackgroundImage:[UIImage imageNamed:@"circle2.png"] forState:UIControlStateNormal];
    [_Btn2obj setBackgroundImage:[UIImage imageNamed:@"circle2.png"] forState:UIControlStateNormal];
    [_Btn3obj setBackgroundImage:[UIImage imageNamed:@"circle2.png"] forState:UIControlStateNormal];
    [_Btn4obj setBackgroundImage:[UIImage imageNamed:@"circle2.png"] forState:UIControlStateNormal];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (IBAction)NotatallBtnAction:(id)sender {
//    [_Btn1obj setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
//
//    BS6ViewController *BSV=[[BS6ViewController alloc]init];
//    [BSV setBrief2str:@"brief2str"];
//    [BSV setPercieved5str:@"percievedstr"];
//    [BSV setPhq5:@"phqstr"];
//    [self.navigationController pushViewController:BSV animated:YES];
//}
//
//- (IBAction)Btn2Action:(id)sender {
//    [_Btn2obj setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
//
//    BS6ViewController *BSV=[[BS6ViewController alloc]init];
//    [BSV setBrief2str:@"brief2str"];
//    [BSV setPercieved5str:@"percievedstr"];
//    [BSV setPhq5:@"phqstr"];
//    [self.navigationController pushViewController:BSV animated:YES];
//}
//
//- (IBAction)Btn3Action:(id)sender {
//    [_Btn3obj setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
//
//    BS6ViewController *BSV=[[BS6ViewController alloc]init];
//    [BSV setBrief2str:@"brief2str"];
//    [BSV setPercieved5str:@"percievedstr"];
//    [BSV setPhq5:@"phqstr"];
//    [self.navigationController pushViewController:BSV animated:YES];
//}
//
//- (IBAction)Btn4Action:(id)sender {
//    [_Btn4obj setBackgroundImage:[UIImage imageNamed:@"circle1.png"] forState:UIControlStateNormal];
//
//    BS6ViewController *BSV=[[BS6ViewController alloc]init];
//    [BSV setBrief2str:@"brief2str"];
//    [BSV setPercieved5str:@"percievedstr"];
//    [BSV setPhq5:@"phqstr"];
//    [self.navigationController pushViewController:BSV animated:YES];
//}
//
//- (IBAction)SkipBtnAction:(id)sender {
//    BS6ViewController *BSV=[[BS6ViewController alloc]init];
//    [BSV setBrief2str:@"brief2str"];
//    [BSV setPercieved5str:@"percievedstr"];
//    [BSV setPhq5:@"phqstr"];
//    [self.navigationController pushViewController:BSV animated:YES];
//}
///*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
//*/

@end
