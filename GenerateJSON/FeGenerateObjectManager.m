//
//  FeGenerateObjectManager.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeGenerateObjectManager.h"

@implementation FeGenerateObjectManager
+(instancetype) shareInstance
{
    static FeGenerateObjectManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FeGenerateObjectManager alloc] init];
    });
    
    return instance;
}
@end
