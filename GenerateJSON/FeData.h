//
//  FeData.h
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeData : NSObject
+(instancetype) shareData;

// Customer
-(NSString *) randomName;
-(NSString *) randomCustomerID;
-(NSString *) randomAddress;
-(NSString *) randomPhone;
-(NSString *) randomeEmailWithName:(NSString *) name;
-(NSDate *) randomBirthday;

// Product
-(NSString *) randomProductName;
-(NSString *) randomProductID;
-(NSNumber *) randomProductQuality;
-(NSNumber *) randomProductPrice;

@end
