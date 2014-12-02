//
//  FeProduct.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeProduct.h"
#import "FeData.h"

@implementation FeProduct
-(instancetype) initWithProductID:(NSString *)productID name:(NSString *)name quality:(NSNumber *)quality price:(NSNumber *)price
{
    self = [super init];
    if (self)
    {
        _productID = productID;
        _name = name;
        _quality = quality;
        _price = price;
    }
    return self;
}
+(instancetype) productByRandom
{
    FeData *data = [FeData shareData];

    FeProduct *product = [[FeProduct alloc] initWithProductID:[data randomProductID] name:[data randomProductName] quality:[data randomProductQuality] price:[data randomProductPrice]];
    
    return product;
}
@end
