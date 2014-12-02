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

#define kFe_FeGenerateObjectManager_NumberOfThread 10
#define kFe_FeGenerateObjectManager_NumberOfObjectInThread 10000

@interface FeGenerateObjectManager ()
{
    dispatch_group_t group;
    
    NSInteger numberOfWork;
    CGFloat percent;
}
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) SBJson4Writer *writer;
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
        
        _writer = [[SBJson4Writer alloc] init];
        _writer.humanReadable = YES;
    }
    return self;
}
-(void) generateDumpDataOnBackgroundWithPercentBlock:(FeFeGenerateObjectManagerPercentBlock)percentBlock completionBlock:(FeGenerateObjectManagerCompletionBlock)completionBlock
{
    __weak FeGenerateObjectManager *weakSelf = self;
    for (NSInteger i = 0; i < kFe_FeGenerateObjectManager_NumberOfThread; i++)
    {
        
        // Enter group
        dispatch_group_enter(group);
        
        // Init
        NSBlockOperation *thread = [NSBlockOperation blockOperationWithBlock:^
        {
            NSMutableArray *arrInvoice = [NSMutableArray arrayWithCapacity:kFe_FeGenerateObjectManager_NumberOfObjectInThread];
            for (NSInteger i = 0; i < kFe_FeGenerateObjectManager_NumberOfObjectInThread; i++)
            {
                // Invoice
                FeInvoce *invoice = [FeInvoce invoiceByRandom];
                
                // Added
                [arrInvoice addObject:invoice];
                
            }
            
            // Write arr to JSON file
            NSString *json = [_writer stringWithObject:arrInvoice];
            
            // When writefile completion
            dispatch_group_leave(group);
        }];
        
        // Priortity
        thread.queuePriority = NSOperationQueuePriorityHigh;
        
        // Run
        [weakSelf.queue addOperation:thread];
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
@end
