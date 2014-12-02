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
@property (copy, nonatomic) NSString *total;
@property (strong, nonatomic) NSMutableArray *arrProduct;
@property (strong, nonatomic) NSDate *createdAt;
@end
