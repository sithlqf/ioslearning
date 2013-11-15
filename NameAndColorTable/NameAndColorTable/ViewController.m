//
//  ViewController.m
//  NameAndColorTable
//
//  Created by qingfeng liu on 10/21/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"

@interface ViewController ()

@end

@implementation ViewController

static NSString *CellTableIdentifier=@"CellTableIdentifier";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.computers=@[@{@"Name":@"MacBook",@"Color":@"White"},
                     @{@"Name":@"MacBook Pro",@"Color":@"Silver"},
                     @{@"Name":@"iMac",@"Color":@"Silver"},
                     @{@"Name":@"Mac Mini",@"Color":@"Silver"},
                     @{@"Name":@"Mac Pro",@"Color":@"Silver"},];
    
    UITableView *tableView=(id)[self.view viewWithTag:1];
    tableView.rowHeight=65;
    UINib *nib=[UINib nibWithNibName:@"NameAndColorCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifier];
}

#pragma mark-
#pragma mark Table Data Source Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.computers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NameAndColorCell *cell=[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    NSDictionary *rowData=self.computers[indexPath.row];
    cell.name=rowData[@"Name"];
    cell.color=rowData[@"Color"];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
