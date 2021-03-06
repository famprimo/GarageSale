//
//  ProductModel.h
//  GarageSale
//
//  Created by Federico Amprimo on 17/05/14.
//  Copyright (c) 2014 Federico Amprimo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"
#import "Product.h"

@interface ProductModel : NSObject

- (NSMutableArray*)getProducts:(NSMutableArray*)productList;
- (Client*)getClient:(Product*)productFound;

@end
