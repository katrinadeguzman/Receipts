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


@interface ViewController ()
@property (nonatomic, strong) NSManagedObjectContext* context;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray<Tag*>* tags;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.context = self.persistentContainer.viewContext;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headerReuseIdentifier"];
    [self loadTags];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self loadTags];
}

#pragma mark - Tag
-(void)initTags
{
    Tag* business = [[Tag alloc] initWithContext:self.context];
    business.tagName = @"Business";
    
    Tag* travel = [[Tag alloc] initWithContext:self.context];
    travel.tagName = @"Travel";
    
    Tag* personal = [[Tag alloc] initWithContext:self.context];
    personal.tagName = @"Personal";
    
    Tag* family= [[Tag alloc] initWithContext:self.context];
    family.tagName = @"Family";
    
    [self saveContext];
}

-(void)fetchTags
{
    NSFetchRequest* fetchRequest = [Tag fetchRequest];
    NSSortDescriptor* tagSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"tagName" ascending:YES];
    [fetchRequest setSortDescriptors:@[tagSortDescriptor]];
    
    NSError* tagFetchError = nil;
    
    self.tags = [self.context executeFetchRequest:fetchRequest error:&tagFetchError];
    
    if (tagFetchError)
    {
        NSLog(@"Error fetching tags");
        NSLog(@"Fetch Error: %@",tagFetchError.localizedDescription);
    }
    
}

-(void)loadTags
{
    [self fetchTags];
    
    if (self.tags.count == 0)
    {
        [self initTags];
    }

    [self.tableView reloadData];
}


#pragma mark - TableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tags.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tags[section].relationship.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier" forIndexPath:indexPath];
    Tag* tag = self.tags[indexPath.section];
    NSArray* allTags = [tag.relationship allObjects];
    Receipt* receipt = allTags[indexPath.row];
    
    cell.textLabel.text = receipt.note;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerReuseIdentifier"];
    header.textLabel.text = self.tags[section].tagName;
    return header;
}

#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"AddReceipt"])
    {
        AddReceiptViewController* addReceipt = (AddReceiptViewController*)segue.destinationViewController;
        addReceipt.delegate = self;
        addReceipt.persistentContainer = self.persistentContainer;
        addReceipt.tags = self.tags;
    }
}

#pragma mark - Core Data
- (void)saveContext
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark - AddReceiptViewControllerDelegate

-(void)reloadData {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.tableView reloadData];
    }];
    
}

@end
