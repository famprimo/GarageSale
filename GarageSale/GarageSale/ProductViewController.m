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

@interface ProductViewController ()
{
    // The product data from the ProductModel
    NSArray *_myData;

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
    _myData = [[[ProductModel alloc] init] getProducts];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    priceLabel.text = [NSString stringWithFormat:@"$%f", myProducts.published_price];
    pictureCell.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:myProducts.picture_link]]];

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
    // [self performSegueWithIdentifier:@"CellSelectionSegue" sender:self];
}


@end
