//
//  FeGenerateObjectManager.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeGenerateObjectManager.h"
#import "FeInvoce.h"
#import "SBJson4Writer.h"

#define kFe_FeGenerateObjectManager_NumberOfThread 1
#define kFe_FeGenerateObjectManager_NumberOfObjectInThread 10
#define kFe_FeGenerateObjectManager_NumberOfObjectNeedWrite 5

@interface FeGenerateObjectManager ()
{
    dispatch_group_t group;
    
    NSInteger numberOfWork;
    CGFloat percent;
}
@property (strong, nonatomic) NSOperationQueue *queue;
@end

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
-(instancetype) init
{
    self = [super init];
    if (self)
    {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = kFe_FeGenerateObjectManager_NumberOfThread;
        group = dispatch_group_create();
        
        numberOfWork = kFe_FeGenerateObjectManager_NumberOfThread * kFe_FeGenerateObjectManager_NumberOfObjectInThread;
        percent = 0;
    }
    return self;
}
-(void) generateDumpDataOnBackgroundWithPercentBlock:(FeFeGenerateObjectManagerPercentBlock)percentBlock completionBlock:(FeGenerateObjectManagerCompletionBlock)completionBlock
{
    
    __weak FeGenerateObjectManager *weakSelf = self;
    for (__block NSInteger i = 0; i < kFe_FeGenerateObjectManager_NumberOfThread; i++)
    {
        // Enter group
        dispatch_group_enter(group);
        
        // Init
        NSBlockOperation *thread = [NSBlockOperation blockOperationWithBlock:^
        {
            typeof(self) strongSelf = weakSelf;
            
            NSMutableArray *arrInvoice = [NSMutableArray arrayWithCapacity:kFe_FeGenerateObjectManager_NumberOfObjectInThread];
            
            for (NSInteger j = 1; j <= kFe_FeGenerateObjectManager_NumberOfObjectInThread; j++)
            {
                // Invoice
                FeInvoce *invoice = [FeInvoce invoiceByRandom];
                
                // Added
                [arrInvoice addObject:invoice];
                

                if ((j != 0) && (j % kFe_FeGenerateObjectManager_NumberOfObjectNeedWrite) == 0)
                {
                    NSLog(@"write File at i = %ld, j = %ld",(long)i,(long)j);
                    
                     NSString *pathFile = [strongSelf applicationDocumentsDirectory];
                    
                    // Write arr to JSON file
                    SBJson4Writer *writer = [[SBJson4Writer alloc] init];
                    writer.humanReadable = NO;
                    
                    NSData *json = [writer dataWithObject:arrInvoice];
                    
                    // Write to file
                    NSError *err;
                    //[json writeToFile:pathFile atomically:YES encoding:NSUTF16StringEncoding error:&err];
                    [json writeToFile:pathFile atomically:YES];
                    
                    if (err)
                    {
                        NSLog(@"error when writing file");
                    }
                    
                    // Remove all data
                    [arrInvoice removeAllObjects];

                }
                
            }
            
            
            // When writefile completion
            dispatch_group_leave(group);
        }];
        
        // Priortity
        thread.queuePriority = NSOperationQueuePriorityHigh;
        
        // Run
        [_queue addOperation:thread];
    }
    
    
    // Wait
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (completionBlock)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completionBlock(nil);
            });
        }
    });
}
- (NSString *) applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSUUID *uuid = [NSUUID UUID];
    basePath = [basePath stringByAppendingString:[NSString stringWithFormat:@"/%@.txt",uuid.UUIDString]];
    
    return basePath;
}
@end
