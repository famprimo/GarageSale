//
//  ProductDetailViewController.h
//  GarageSale
//
//  Created by Federico Amprimo on 25/05/14.
//  Copyright (c) 2014 Federico Amprimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "Client.h"

@interface ProductDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameClient;
@property (weak, nonatomic) IBOutlet UIImageView *pictureClient;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *GS_codeLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@property (strong, nonatomic) Product *selectedProduct;
@property (strong, nonatomic) Client *selectedClient;
@property (weak, nonatomic) IBOutlet UIScrollView *productScrollView;

@end
