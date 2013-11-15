//
//  ViewController.m
//  SimpleTable
//
//  Created by qingfeng liu on 10/21/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //initalize the NSArray to hold the data
    self.dwarves=@[@"Sleepy",@"Sneezy",@"Bashful",@"Happy",@"Doc",@"Grumpy",@"Dopey",@"Thorin",@"Dorin",@"Nori",@"Ori",@"Balin",@"Dwalin",@"Fili",@"Kili",@"Oin",@"Gloin",@"Bifur",@"Bofur",@"Bombur"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-
#pragma mark TableView Data Source Methods
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dwarves count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier=@"SimpleTableIdentifier";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    UIImage *image=[UIImage imageNamed:@"star.png"];
    cell.imageView.image=image;
    cell.textLabel.text=self.dwarves[indexPath.row];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:50];
    
    if(indexPath.row<7)
    {
        cell.detailTextLabel.text=@"Mr. Disney";
    }
    else
    {
        cell.detailTextLabel.text=@"Mr. Tolkien";
    }
    return cell;
}

#pragma mark-
#pragma mark Table Delegate Methods
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return nil;
    }
    else
    {
        return indexPath;
    }
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowValue=self.dwarves[indexPath.row];
    NSString *messages=[[NSString alloc]initWithFormat:@"You selected %@",rowValue];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Row Selected" message:messages delegate:nil cancelButtonTitle:@"Yes i did" otherButtonTitles:nil, nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}



@end
