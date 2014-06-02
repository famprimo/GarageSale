//
//  ProductDetailViewController.m
//  GarageSale
//
//  Created by Federico Amprimo on 25/05/14.
//  Copyright (c) 2014 Federico Amprimo. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "SWRevealViewController.h"
#import "ProductImageViewController.h"


@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

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

    // Add tap gesture recognizer to picture
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPicture:)];
    tapRecognizer.numberOfTapsRequired = 2;
    [self.pictureImageView addGestureRecognizer:tapRecognizer];

    // Asign values to view
    self.nameLabel.text = self.selectedProduct.name;
    self.descriptionLabel.text = self.selectedProduct.description;
    self.GS_codeLabel.text = self.selectedProduct.GS_code;
    self.priceLabel.text = [NSString stringWithFormat:@"%@%.f", self.selectedProduct.currency, self.selectedProduct.published_price];
    self.pictureImageView.image = [UIImage imageWithData:self.selectedProduct.picture];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapPicture:(UITapGestureRecognizer *)sender
{
    NSLog(@"Tap Recognized");
    
    // Segue to the image
    [self performSegueWithIdentifier:@"ProductImageSegue" sender:self];

}

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get reference to the destination view controller
    ProductImageViewController *imageVC = segue.destinationViewController;
    imageVC.selectedProduct = self.selectedProduct;
}

@end
