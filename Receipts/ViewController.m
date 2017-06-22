//
//  ViewController.m
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "ViewController.h"
#import "AddReceiptViewController.h"
#import "AppDelegate.h"
#import "Receipt+CoreDataClass.h"
#import "Tag+CoreDataClass.h"


@interface ViewController ()
@property (nonatomic, strong) NSManagedObjectContext* context;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headerReuseIdentifier"];
    // Do any additional setup after loading the view, typically from a nib.
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        self.persistentContainer = appDelegate.persistentContainer;
    self.context = self.persistentContainer.viewContext;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddReceipt"])
    {
        AddReceiptViewController* controller = [[AddReceiptViewController alloc]init];
        controller = segue.destinationViewController;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
}

@end
