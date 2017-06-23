//
//  AddReceiptViewController.m
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "AddReceiptViewController.h"

@interface AddReceiptViewController ()
@property (nonatomic, strong) NSArray* categories;
@property (nonatomic, strong) NSManagedObjectContext* context;
@property (nonatomic, strong) NSMutableSet* tagsSelected;
@end

@implementation AddReceiptViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tagsTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellReuseIdentifier"];
    [self.tagsTableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"headerReuseIdentifier"];
    self.tagsTableView.allowsMultipleSelection = YES;
    
    self.context = self.persistentContainer.viewContext;
    
    self.tagsSelected = [NSMutableSet set];
    
    UITapGestureRecognizer *viewTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [viewTapped setNumberOfTapsRequired:1];
    [viewTapped setNumberOfTouchesRequired:1];
    [viewTapped setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:viewTapped];
    [self showKeyboards];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [self showKeyboards];
}
-(void)showKeyboards
{
    [self.amountTextField becomeFirstResponder];
    [self.noteTextField becomeFirstResponder];
}

-(void)resignOnTap:(UITapGestureRecognizer*)sender
{
    [self.noteTextField resignFirstResponder];
    [self.amountTextField resignFirstResponder];
}

- (IBAction)addReceipt:(id)sender
{
    Receipt* newReceipt = [[Receipt alloc] initWithContext:self.context];
    newReceipt.note = self.noteTextField.text;
    newReceipt.amount = [self.amountTextField.text doubleValue];
    newReceipt.timeStamp = self.timeStampPicker.date;
    
    for (Tag* tag in self.tagsSelected)
    {
        tag.relationship = [tag.relationship setByAddingObject:newReceipt];
    }
    
    [self saveContext];
    [self.delegate reloadData];

    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)cancelReceipt:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Core Data Saving support
- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark - UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tags.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = self.tags[indexPath.row].tagName;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerReuseIdentifier"];
    header.textLabel.text = @"Tags";
    return header;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    [self.tagsSelected addObject:self.tags[indexPath.row]];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    [self.tagsSelected removeObject:self.tags[indexPath.row]];
}

@end
