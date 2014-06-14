//
//  ProductViewController.m
//  GarageSale
//
//  Created by Federico Amprimo on 17/05/14.
//  Copyright (c) 2014 Federico Amprimo. All rights reserved.
//

#import "ProductViewController.h"
#import "SWRevealViewController.h"
#import "Product.h"
#import "ProductModel.h"
#import "ProductDetailViewController.h"

@interface ProductViewController ()
{
    // The product data from the ProductModel
    NSMutableArray *_myData;

    // The product that is selected from the table
    Product *_selectedProduct;

}
@end

@implementation ProductViewController

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
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Remember to set ViewControler as the delegate and datasource
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    // Get the listing data
    _myData = [[[ProductModel alloc] init] getProducts:_myData];
    
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
    Product *myProducts = _myData[indexPath.row];
    
    // Get references to images and labels of cell
    UILabel *nameLabel = (UILabel*)[myCell.contentView viewWithTag:2];
    UILabel *codeLabel = (UILabel*)[myCell.contentView viewWithTag:3];
    UILabel *priceLabel = (UILabel*)[myCell.contentView viewWithTag:4];
    UIImageView *pictureCell = (UIImageView*)[myCell.contentView viewWithTag:1];

    // Set table cell labels to listing data
    nameLabel.text = myProducts.name;
    codeLabel.text = myProducts.GS_code;
//    priceLabel.text = [NSString stringWithFormat:@"$%.f", myProducts.published_price];
    priceLabel.text = [NSString stringWithFormat:@"%@%.f", myProducts.currency, myProducts.published_price];
    pictureCell.image = [UIImage imageWithData:myProducts.picture];

    return myCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _myData.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row selected at row %i", indexPath.row);
    
    // Set selected listing to var
    _selectedProduct = _myData[indexPath.row];
    
    // Manually call segue to detail view controller
    [self performSegueWithIdentifier:@"ProductSelectionSegue" sender:self];
}

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog (@"Segue");
    
    // Get reference to the destination view controller
    ProductDetailViewController *detailVC = segue.destinationViewController;
    detailVC.selectedProduct = _selectedProduct;
}

@end
