//
//  AddReceiptViewController.h
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receipt+CoreDataClass.h"
#import "Tag+CoreDataClass.h"
#import <CoreData/CoreData.h>

@protocol AddReceiptViewControllerDelegate <NSObject>

-(void)reloadData;

@end

@interface AddReceiptViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addReceiptButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelReceiptButton;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *timeStampPicker;
@property (weak, nonatomic) IBOutlet UITableView *tagsTableView;

@property (nonatomic, strong) NSPersistentContainer* persistentContainer;
@property (nonatomic, strong) NSArray<Tag*>* tags;
@property (nonatomic, strong) id<AddReceiptViewControllerDelegate> delegate;

- (void)saveContext;

@end
