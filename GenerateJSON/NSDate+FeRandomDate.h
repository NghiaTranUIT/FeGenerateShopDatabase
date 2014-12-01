//
//  NSDate+FeRandomDate.h
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FeRandomDate)
+(NSDate *) randomDateFrom:(NSDate *) date WithCalendar:(NSCalendar *) calendar;
@end
