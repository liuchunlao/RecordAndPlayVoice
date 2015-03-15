//
//  ViewController.m
//  RecordAndPlayVoice
//
//  Created by PBOC CS on 15/3/12.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "LVRecordTool.h"
#import "LVRecordView.h"

@interface ViewController ()

@property (nonatomic, strong) LVRecordView *recordView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.recordView = [LVRecordView recordView];
    self.recordView.backgroundColor = [UIColor lightGrayColor];
    self.recordView.center = self.view.center;
    self.recordView.transform = CGAffineTransformMakeTranslation(0, -200);
    [self.view addSubview:self.recordView];
}

@end

