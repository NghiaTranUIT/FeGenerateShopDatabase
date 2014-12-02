//
//  FeGenerateObjectManager.h
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

typedef void(^FeFeGenerateObjectManagerPercentBlock)(CGFloat percent);
typedef void(^FeGenerateObjectManagerCompletionBlock)(NSError *error);

@interface FeGenerateObjectManager : NSObject
+(instancetype) shareInstance;

-(void) generateDumpDataOnBackgroundWithPercentBlock:(FeFeGenerateObjectManagerPercentBlock) percentBlock completionBlock:(FeGenerateObjectManagerCompletionBlock) completionBlock;
@end
