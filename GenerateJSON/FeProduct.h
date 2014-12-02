//
//  FeProduct.h
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeProduct : NSObject
@property (strong, nonatomic) NSString *productID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *quality;
@property (strong, nonatomic) NSNumber *price;

// Init
-(instancetype) initWithProductID:(NSString *) productID name:(NSString *) name quality:(NSNumber *) quality price:(NSNumber *) price;
+(instancetype) productByRandom;

-(id) proxyForJson;
@end
