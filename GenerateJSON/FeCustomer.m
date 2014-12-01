//
//  FeCustomer.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeCustomer.h"

@implementation FeCustomer
-(instancetype) initWithCustomerID:(NSString *)customerID name:(NSString *)name birthDay:(NSDate *)birthday phone:(NSString *)phone email:(NSString *)email
{
    self = [super init];
    if (self)
    {
        _customerID = customerID;
        _name = name;
        _birthday = birthday;
        _phone = phone;
        _email = email;
    }
    
    return self;
}
+(instancetype) customerByRandom
{
    
}
@end
