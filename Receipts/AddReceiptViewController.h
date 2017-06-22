//
//  AddReceiptViewController.h
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "ViewController.h"

@interface AddReceiptViewController : ViewController
@property (weak, nonatomic) IBOutlet UIButton *addReceiptButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelReceiptButton;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *timeStampPicker;
@property (weak, nonatomic) IBOutlet UITableView *tagsTableView;

@end
