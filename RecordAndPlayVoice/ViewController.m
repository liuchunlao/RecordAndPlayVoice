//
//  ViewController.m
//  RecordAndPlayVoice
//
//  Created by PBOC CS on 15/3/12.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "ViewController.h"
#import "LVRecordView.h"

@interface ViewController ()

@property (nonatomic, strong) LVRecordView *recordView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.recordView = [LVRecordView recordView];
    self.recordView.backgroundColor = [UIColor lightGrayColor];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self.recordView.frame = CGRectMake(50, 100, width - 2 * 50, 100);
    [self.view addSubview:self.recordView];
}

@end

