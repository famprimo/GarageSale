//
//  MenuModel.m
//  GarageSale
//
//  Created by Federico Amprimo on 17/05/14.
//  Copyright (c) 2014 Federico Amprimo. All rights reserved.
//

#import "MenuModel.h"
#import "MenuItem.h"

@implementation MenuModel

- (NSArray *)getMenuItem
{
    NSMutableArray *menuItemArray = [[NSMutableArray alloc] init];
    
    MenuItem *item1 = [[MenuItem alloc] init];
    item1.menuTitle = @"Products";
    item1.menuIcon = @"ProductMenuIcon";
    item1.screenType = ScreenTypeProduct;
    [menuItemArray addObject:item1];
    
    MenuItem *item2 = [[MenuItem alloc] init];
    item2.menuTitle = @"Clients";
    item2.menuIcon = @"ClientMenuIcon";
    item2.screenType = ScreenTypeClient;
    [menuItemArray addObject:item2];
    
    MenuItem *item3 = [[MenuItem alloc] init];
    item3.menuTitle = @"Opportunities";
    item3.menuIcon = @"OpportunityMenuIcon";
    item3.screenType = ScreenTypeOpportunity;
    [menuItemArray addObject:item3];
    
    MenuItem *item4 = [[MenuItem alloc] init];
    item4.menuTitle = @"About";
    item4.menuIcon = @"AboutMenuIcon";
    item4.screenType = ScreenTypeAbout;
    [menuItemArray addObject:item4];
    
    return menuItemArray;
    
}

@end
