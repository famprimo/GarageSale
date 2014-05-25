//
//  ProductModel.m
//  GarageSale
//
//  Created by Federico Amprimo on 17/05/14.
//  Copyright (c) 2014 Federico Amprimo. All rights reserved.
//

#import "ProductModel.h"
#import "Product.h"

@implementation ProductModel

- (NSMutableArray*)getProducts
{
    // Array to hold the listing data
    NSMutableArray *products = [[NSMutableArray alloc] init];
    
    // Create product #1
    Product *tempProduct = [[Product alloc] init];
    tempProduct.GS_code = @"GS3209";
    tempProduct.name = @"Bicicleta Monark aro 20";
    tempProduct.description = @"En perfecto estado. Comprada en 560 soles. MIRAFLORES";
    tempProduct.currency = @"S/.";
    tempProduct.published_price = 290.0;
    tempProduct.picture_link = @"https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-ash3/t1.0-9/10365873_837130456315654_6991006075101245277_n.jpg";
    
    // Add listing #1 to the array
    [products addObject:tempProduct];
    
    // Create product #2
    tempProduct = [[Product alloc] init];
    tempProduct.GS_code = @"GS3056";
    tempProduct.name = @"Mecedora Graco";
    tempProduct.description = @"Tiene un sonidito casi imperceptible. Comprado en USA el año pasado. Solo ha sido usado durante 5 meses y muy poco. La Aurora - MIRAFLORES";
    tempProduct.currency = @"S/.";
    tempProduct.published_price = 250.0;
    tempProduct.picture_link = @"https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-prn1/t1.0-9/10341676_838515596177140_687032528327336304_n.jpg";
    
    // Add listing #2 to the array
    [products addObject:tempProduct];

    // Create product #3
    tempProduct = [[Product alloc] init];
    tempProduct.GS_code = @"GS3205";
    tempProduct.name = @"HP Pavilion g6-1b70us 15.6'";
    tempProduct.description = @"Comprada hace un año, en perfecto estado. Notebook (2.4 GHz Intel Core i3-370M Processor, 4 GB RAM, 500 GB Hard Drive, Windows... by HP. SAN ISIDRO";
    tempProduct.currency = @"S/.";
    tempProduct.published_price = 1100.0;
    tempProduct.picture_link = @"https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-prn1/t1.0-9/10269440_835477799814253_5669782238393768165_n.jpg";
    
    // Add listing #3 to the array
    [products addObject:tempProduct];

    // Return the producct array as the return value
    return products;
}


@end
