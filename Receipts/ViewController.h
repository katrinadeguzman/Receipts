//
//  ViewController.h
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreData/CoreData.h"
#import "AddReceiptViewController.h"


@class NSPersistentContainer;

@interface ViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate, AddReceiptViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addNewReceiptButton;

@property (nonatomic, strong) NSPersistentContainer *persistentContainer;

@end

