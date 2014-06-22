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
    
    // Set text and position for Name
    self.nameLabel.text = self.selectedProduct.name;
    [self.nameLabel sizeToFit];
    self.nameLabel.numberOfLines = 0;
    CGRect nameLabelFrame = self.nameLabel.frame;
    nameLabelFrame.origin.y = 5;
    self.nameLabel.frame = nameLabelFrame;

    // Set image and position for Client picture
    self.pictureClient.image = [UIImage imageWithData:self.selectedClient.picture];
    CGRect pictureClientFrame = self.pictureClient.frame;
    pictureClientFrame.origin.y = self.nameLabel.frame.origin.y + self.nameLabel.frame.size.height + 10;
    self.pictureClient.frame = pictureClientFrame;

    // Set text and position for Price
    self.nameClient.text = [NSString stringWithFormat:@"%@ %@", self.selectedClient.name, self.selectedClient.last_name];
    CGRect nameClientFrame = self.nameClient.frame;
    nameClientFrame.origin.y = self.pictureClient.frame.origin.y;
    self.nameClient.frame = nameClientFrame;
 
    // Set image and position for Product picture
    self.pictureImageView.image = [UIImage imageWithData:self.selectedProduct.picture];
    CGRect pictureImageFrame = self.pictureImageView.frame;
    pictureImageFrame.origin.y = self.pictureClient.frame.origin.y + self.pictureClient.frame.size.height + 10;
    self.pictureImageView.frame = pictureImageFrame;

    // Set text and position for Price
    self.priceLabel.text = [NSString stringWithFormat:@"%@%.f", self.selectedProduct.currency, self.selectedProduct.published_price];
    CGRect priceLabelFrame = self.priceLabel.frame;
    priceLabelFrame.origin.y = self.pictureImageView.frame.origin.y;
    self.priceLabel.frame = priceLabelFrame;

    // Set text and position for GS code
    self.GS_codeLabel.text = self.selectedProduct.GS_code;
    CGRect GS_codeLabelFrame = self.GS_codeLabel.frame;
    GS_codeLabelFrame.origin.y = self.priceLabel.frame.origin.y + self.priceLabel.frame.size.height + 5;
    self.GS_codeLabel.frame = GS_codeLabelFrame;

    // Set text and position for description
    self.descriptionLabel.text = self.selectedProduct.description;
    [self.descriptionLabel sizeToFit];
    self.descriptionLabel.numberOfLines = 0;
    CGRect descriptionLabelFrame = self.descriptionLabel.frame;
    descriptionLabelFrame.origin.y = self.pictureImageView.frame.origin.y + self.pictureImageView.frame.size.height + 5;
    self.descriptionLabel.frame = descriptionLabelFrame;
    
    // Set content size of scrollview
    self.productScrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.descriptionLabel.frame.origin.y + self.descriptionLabel.frame.size.height + 50);

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
