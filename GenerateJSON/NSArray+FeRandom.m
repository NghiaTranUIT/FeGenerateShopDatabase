//
//  NSArray+FeRandom.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "NSArray+FeRandom.h"

@implementation NSArray (FeRandom)
-(instancetype) randomObject
{
    return [self objectAtIndex:[self randomIndex]];
}
-(NSInteger) randomIndex
{
    NSInteger min = 0;
    NSInteger max = self.count - 1;
    
    NSInteger randNum = rand() % (max- min) + min; //create the random number.
    
    return randNum;
}
@end
