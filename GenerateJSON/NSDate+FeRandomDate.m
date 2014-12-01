//
//  NSDate+FeRandomDate.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "NSDate+FeRandomDate.h"

@implementation NSDate (FeRandomDate)
+(NSDate *) randomDateFrom:(NSDate *)date WithCalendar:(NSCalendar *)calendar
{
    int r1 = arc4random_uniform(100);
    int r2 = arc4random_uniform(23);
    int r3 = arc4random_uniform(59);
    
    NSDateComponents *offsetComponents = [NSDateComponents new];
    [offsetComponents setDay:(r1*-1)];
    [offsetComponents setHour:r2];
    [offsetComponents setMinute:r3];
    
    NSDate *rndDate1 = [calendar dateByAddingComponents:offsetComponents
                                                  toDate:date options:0];
    
    return rndDate1;
}
@end
