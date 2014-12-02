//
//  FeInvoce.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeInvoce.h"

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
    
}
@end
