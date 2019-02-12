//
//  SelectTagViewController.m
//  RootApplcation
//
//  Created by BRIJESH KUMAR on 20/09/17.
//  Copyright © 2017 EpikSolutions. All rights reserved.
//

#import "SelectTagViewController.h"
#import "EmotionTagTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface SelectTagViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation SelectTagViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    tblSimpleTable.delegate=self;
    tblSimpleTable.dataSource=self;
    arryData = [[NSArray alloc] initWithObjects:@"iPhone",@"iPod",@"MacBook",@"MacBook Pro",nil];
    //tblSimpleTable.frame =CGRectMake(10, 10, 300, 100);
    flag=1;
    tblSimpleTable.hidden=YES;
    btn.layer.cornerRadius=8;
    tblSimpleTable.layer.cornerRadius=8;
    //i=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow-down.png"]];
    [super viewDidLoad];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


//- (void)dealloc {
//    [tblSimpleTable release];
//    [super dealloc];
//}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arryData count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";

    EmotionTagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
//    }
//    if (cell == nil) {
//        cell = [[[EmotionTagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                       reuseIdentifier:CellIdentifier] autorelease];
//    }
    // Set up the cell...
    cell.TagEmotionnamelbl.text = [arryData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [btn setTitle:[arryData objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    if (flag==1) {
        flag=0;
        tblSimpleTable.hidden=NO;
        [i setImage:[UIImage imageNamed:@"UpArrow.png"]];
    }
    else{
        flag=1;
        tblSimpleTable.hidden=YES;
        [i setImage:[UIImage imageNamed:@"downArrow.png"]];
    }

}

- (IBAction)Backbtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}
@end
