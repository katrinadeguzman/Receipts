//
//  AddReceiptViewController.m
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "AddReceiptViewController.h"

@interface AddReceiptViewController ()

@end

@implementation AddReceiptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)addReceipt:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelReceipt:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
