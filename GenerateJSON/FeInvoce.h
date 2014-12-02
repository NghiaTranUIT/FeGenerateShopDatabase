//
//  FeInvoce.h
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FeCustomer;

@interface FeInvoce : NSObject
@property (copy, nonatomic) NSString *invoiceID;
@property (copy, nonatomic) FeCustomer *customer;
@property (strong, nonatomic) NSNumber *total;
@property (strong, nonatomic) NSMutableArray *arrProduct;
@property (copy, nonatomic) NSString *createdAt;

// Init
-(instancetype) initWithInvoiceID:(NSString *) invoiceID customer:(FeCustomer *) customer total:(NSNumber *) total arrOfProduct:(NSMutableArray *) arrProduct createdAt:(NSString *) createdAt;
+(instancetype) invoiceByRandom;

-(id) proxyForJson;
@end
