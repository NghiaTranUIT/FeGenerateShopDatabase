//
//  ViewController.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "ViewController.h"
#import "FeInvoce.h"
#import "SBJson4Writer.h"
#import "FeGenerateObjectManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loader;
@property (weak, nonatomic) IBOutlet UIProgressView *processView;
@property (weak, nonatomic) IBOutlet UILabel *percentLbl;

@property (assign, nonatomic) BOOL isGeneratingData;

@property (strong, nonatomic) SBJson4Writer *writer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _loader.hidden = YES;
    _processView.hidden = YES;
    _percentLbl.hidden = YES;
    _isGeneratingData = NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) startGenerateJSONFile
{
    
}
- (IBAction)startTapped:(UIButton *)sender
{
    if (_isGeneratingData == NO)
    {
        _isGeneratingData = YES;
        
        FeGenerateObjectManager *generate = [FeGenerateObjectManager shareInstance];
        
        [generate generateDumpDataOnBackgroundWithPercentBlock:^(CGFloat percent) {
            
        } completionBlock:^(NSError *error) {
            
        }];
    }
}
- (IBAction)stopTapped:(UIButton *)sender
{
    if (_isGeneratingData)
    {
        _isGeneratingData = NO;
        
        
    }
}
@end
