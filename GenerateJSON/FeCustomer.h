//
//  FeCustomer.h
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeCustomer : NSObject
@property (copy, nonatomic) NSString *customerID;
@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *birthday;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *email;

-(instancetype) initWithCustomerID:(NSString *) customerID name:(NSString *) name birthDay:(NSDate *) birthday phone:(NSString *) phone email:(NSString *) email;

+(instancetype) customerByRandom;
@end
