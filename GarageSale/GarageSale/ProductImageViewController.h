//
//  ProductImageViewController.h
//  GarageSale
//
//  Created by Federico Amprimo on 1/06/14.
//  Copyright (c) 2014 Federico Amprimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ProductImageViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@property (strong, nonatomic) Product *selectedProduct;

@end
