//
//  ClientViewController.m
//  GarageSale
//
//  Created by Federico Amprimo on 17/05/14.
//  Copyright (c) 2014 Federico Amprimo. All rights reserved.
//

#import "ClientViewController.h"
#import "SWRevealViewController.h"
#import "Client.h"
#import "ClientModel.h"
#import "AppDelegate.h"

@interface ClientViewController ()
{
    // Data for the table
    NSMutableArray *_myData;
    
    AppDelegate *mainDelegate;
    
    // The product that is selected from the table
    Client *_selectedClient;

}
@end

@implementation ClientViewController

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
    // Do any additional setup after loading the view.

    // For the reveal menu to work
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // To have access to shared arrays from AppDelegate
    mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    // Remember to set ViewControler as the delegate and datasource
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    // Get the listing data
    _myData = mainDelegate.sharedArrayClients;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuButtonTapped:(id)sender
{
    [self.revealViewController revealToggleAnimated:YES];
}

#pragma mark Table Delegate Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the listing to be shown
    Client *myClient = _myData[indexPath.row];
    
    // Get references to images and labels of cell
    UILabel *nameLabel = (UILabel*)[myCell.contentView viewWithTag:2];
    UIImageView *pictureCell = (UIImageView*)[myCell.contentView viewWithTag:1];
    
    // Set table cell labels to listing data
    nameLabel.text = [NSString stringWithFormat:@"%@ %@", myClient.name, myClient.last_name];
    pictureCell.image = [UIImage imageWithData:myClient.picture];
    
    return myCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _myData.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set selected listing to var
    _selectedClient = _myData[indexPath.row];
    
    // Manually call segue to detail view controller
    // [self performSegueWithIdentifier:@"ProductSelectionSegue" sender:self];
}

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog (@"Segue");
    
    // Get reference to the destination view controller
    // ProductDetailViewController *detailVC = segue.destinationViewController;
    // detailVC.selectedProduct = _selectedProduct;
}


@end
