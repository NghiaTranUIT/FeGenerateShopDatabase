//
//  FeProduct.h
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeProduct : NSObject
@property (copy, nonatomic) NSString *productID;
@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *quality;
@property (strong, nonatomic) NSNumber *price;
@end
