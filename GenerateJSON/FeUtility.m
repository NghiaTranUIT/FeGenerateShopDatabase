//
//  FeUtility.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/2/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeUtility.h"

@implementation FeUtility
+(NSInteger) randomIndexFrom:(NSInteger) from to:(NSInteger) to
{
    NSInteger min = from;
    NSInteger max = to;
    
    NSInteger randNum = rand() % (max- min) + min; //create the random number.
    
    return randNum;
}
@end
