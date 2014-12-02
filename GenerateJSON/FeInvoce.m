//
//  FeInvoce.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeInvoce.h"
#import "FeData.h"
#import "FeCustomer.h"
#import "FeProduct.h"
#import "FeUtility.h"
#import <QuartzCore/QuartzCore.h>

@implementation FeInvoce
-(instancetype) initWithInvoiceID:(NSString *)invoiceID customer:(FeCustomer *)customer total:(NSNumber *)total arrOfProduct:(NSMutableArray *)arrProduct createdAt:(NSDate *)createdAt
{
    self = [super init];
    if (self)
    {
        _invoiceID = invoiceID;
        _customer = customer;
        _total = total;
        _arrProduct = arrProduct;
        _createdAt = createdAt;
    }
    return self;
}
+(instancetype) invoiceByRandom
{
    FeData *data = [FeData shareData];
    
    // Customer
    FeCustomer *customer = [FeCustomer customerByRandom];
    
    // Product
    CGFloat total = 0;
    NSInteger numberOfProduct = [FeUtility randomIndexFrom:1 to:kFe_Data_MaxProduct];
    NSMutableArray *arrProduct = [NSMutableArray arrayWithCapacity:numberOfProduct];
    
    for (NSInteger i = 0 ; i < kFe_Data_MaxProduct; i++)
    {
        FeProduct *product = [FeProduct productByRandom];
        total += product.quality.integerValue * product.price.doubleValue;
        
        // Add
        [arrProduct addObject:product];
    }
    
    
    // Invoice
    FeInvoce *invoice = [[FeInvoce alloc] initWithInvoiceID:[data randomInvoiceID] customer:customer total:@(total) arrOfProduct:arrProduct createdAt:[data randomInvoiceCreatedAt]];
    
    return invoice;
}
@end
