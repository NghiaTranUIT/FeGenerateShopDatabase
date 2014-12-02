//
//  FeCustomer.h
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeCustomer : NSObject
@property (strong, nonatomic) NSString *customerID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *birthday;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *email;

-(instancetype) initWithCustomerID:(NSString *) customerID name:(NSString *) name birthDay:(NSString *) birthday phone:(NSString *) phone email:(NSString *) email;

+(instancetype) customerByRandom;

-(id) proxyForJson;
@end
