//
//  FeCustomer.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeCustomer.h"
#import "FeData.h"
#import <SBJson4.h>
@implementation FeCustomer
-(instancetype) initWithCustomerID:(NSString *)customerID name:(NSString *)name birthDay:(NSString *)birthday phone:(NSString *)phone email:(NSString *)email
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
    FeData *data = [FeData shareData];
    
    NSString *name = [data randomName];
    NSString *email = [data randomeEmailWithName:name];
    
    FeCustomer *customer = [[FeCustomer alloc] initWithCustomerID:[data randomCustomerID] name:name birthDay:[data randomBirthday] phone:[data randomPhone] email:email];
    
    return customer;
}
-(id) proxyForJson
{
    NSDictionary *dict = @{@"customerID":_customerID,
                           @"name":_name,
                           @"birthday":_birthday,
                           @"phone":_phone,
                           @"email":_email};
    
    return dict;
}
@end
