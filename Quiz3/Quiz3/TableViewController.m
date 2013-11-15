//
//  TableViewController.m
//  Quiz3
//
//  Created by qingfeng liu on 10/28/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "TableViewController.h"

static NSString *SectionsTableIdentifier=@"SectionsTableIdentifier";

@interface TableViewController ()

@end

@implementation TableViewController
{
    NSMutableArray *filteredNames;
    UISearchDisplayController *searchController;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UITableView *tableView=(id)[self.view viewWithTag:1];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SectionsTableIdentifier];
    
    filteredNames=[NSMutableArray array];
    UISearchBar *searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    tableView.tableHeaderView=searchBar;
    searchController=[[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
    searchController.delegate=self;
    searchController.searchResultsDataSource=self;
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"statedictionary" ofType:@"plist"];
    self.stateZips=[NSDictionary dictionaryWithContentsOfFile:path];
    self.states=[[self.stateZips allKeys]sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if(tableView.tag==1)
    {
        return [self.states count];
    }
    else
    {
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag==1)
    {
        NSString *key=self.states[section];
        NSArray *stateSection=self.stateZips[key];
        return [stateSection count];
    }
    else
    {
        return [filteredNames count];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(tableView.tag==1)
    {
        return self.states[section];
    }
    else
    {
        return nil;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier];
    if(tableView.tag==1)
    {
        NSString *key=self.states[indexPath.section];
        NSArray *stateSection=self.stateZips[key];
        cell.textLabel.text=stateSection[indexPath.row];
    }
    else
    {
        cell.textLabel.text=filteredNames[indexPath.row];
    }
    return cell;
}

-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if(tableView.tag==1)
    {
        return self.states;
    }
    else
    {
        return nil;
    }
}

-(void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SectionsTableIdentifier];
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [filteredNames removeAllObjects];
    if (searchString.length>0) {
        NSPredicate *predicate=[NSPredicate predicateWithBlock:^BOOL(NSString *name, NSDictionary *b) {
            NSRange range=[name rangeOfString:searchString options:NSCaseInsensitiveSearch];
            return range.location!=NSNotFound;
        }];
        for(NSString *key in self.states)
        {
            NSArray *matches=[self.stateZips[key] filteredArrayUsingPredicate:predicate];
            [filteredNames addObjectsFromArray:matches];
        }
    }
}
@end
