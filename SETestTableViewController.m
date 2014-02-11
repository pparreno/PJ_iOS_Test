//
//  SETestTableViewController.m
//  SymbioExam
//
//  Created by Paul John Parreno on 2/11/14.
//  Copyright (c) 2014 Paul John Parreno. All rights reserved.
//

#import "SETestTableViewController.h"
#import "SEListObject.h"
#import "SEListObjectTableViewCell.h"

@interface SETestTableViewController ()

@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation SETestTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.datasource = [NSMutableArray array];
    
    [self setDataSourceFromPList];
    
    self.title = @"Sybio Test";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.datasource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize maxSize = CGSizeMake(280.0f, MAXFLOAT);
    
    static NSString *CellIdentifier = @"SEListCell";
    SEListObjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SEListObjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    SEListObject *SE_listObj = [self.datasource objectAtIndex:indexPath.row];
    
    [cell.nameLabel setText:SE_listObj.name];
    [cell.phoneNumLabel setText:[NSString stringWithFormat:@"%d", [SE_listObj.phoneNumber intValue]]];
    [cell.addressLabel setText:SE_listObj.address];
    
    CGSize addressNewSize = [SE_listObj.address sizeWithFont:[UIFont systemFontOfSize:LISTOBJ_TABLEVIEWCELL_ADDRESSLABEL_FONTSIZE] constrainedToSize:maxSize];
    
    cell.addressHeightConstraint.constant = addressNewSize.height;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize maxSize = CGSizeMake(280.0f, MAXFLOAT);
    
    SEListObject *SE_listObj = [self.datasource objectAtIndex:indexPath.row];

    NSString *addressString = SE_listObj.address;

    CGSize addressNewSize = [addressString sizeWithFont:[UIFont systemFontOfSize:LISTOBJ_TABLEVIEWCELL_ADDRESSLABEL_FONTSIZE] constrainedToSize:maxSize];
    
    return LISTOBJ_TABLEVIEWCELL_HEIGHT + (addressNewSize.height - LISTOBJ_TABLEVIEWCELL_ADDRESSLABEL_HEIGHT);
}

#pragma mark - User Defined Methods

- (void) setDataSourceFromPList
{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"AddressBook" ofType:@"plist"];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:plistPath];
    
    for (NSDictionary *objValueFromPlist in contentArray) {
        SEListObject *listObj = [SEListObject new];
        listObj.name = [objValueFromPlist valueForKey:@"Name"];
        listObj.address = [objValueFromPlist valueForKey:@"Address"];
        listObj.phoneNumber = [objValueFromPlist valueForKey:@"PhoneNumber"];
        
        [self.datasource addObject:listObj];
    }
    
    NSLog(@"Datasource Array: %@", self.datasource);
}

@end
