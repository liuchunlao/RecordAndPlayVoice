//
//  LVRecordView.m
//  RecordAndPlayVoice
//
//  Created by 刘春牢 on 15/3/15.
//  Copyright (c) 2015年 liuchunlao. All rights reserved.
//

#import "LVRecordView.h"
#import "LVRecordTool.h"

@interface LVRecordView () <LVRecordToolDelegate>
/** 录音工具 */
@property (nonatomic, strong) LVRecordTool *recordTool;

/** 录音时的图片 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/** 录音按钮 */
@property (weak, nonatomic) IBOutlet UIButton *recordBtn;

/** 播放按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@end

@implementation LVRecordView

+ (instancetype)recordView {
    
    LVRecordView *recordView = [[[NSBundle mainBundle] loadNibNamed:@"LVRecordView" owner:nil options:nil] lastObject];
    
    recordView.recordTool = [LVRecordTool sharedRecordTool];
    // 初始化监听事件
    [recordView setup];
    
    return recordView;
}

- (void)setup {
    
    self.recordBtn.layer.cornerRadius = 10;
    self.playBtn.layer.cornerRadius = 10;
    
    [self.recordBtn setTitle:@"按住 说话" forState:UIControlStateNormal];
    [self.recordBtn setTitle:@"松开 结束" forState:UIControlStateHighlighted];
    
    
    self.recordTool.delegate = self;
    // 录音按钮
    [self.recordBtn addTarget:self action:@selector(recordBtnDidTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self.recordBtn addTarget:self action:@selector(recordBtnDidTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.recordBtn addTarget:self action:@selector(recordBtnDidTouchDragExit:) forControlEvents:UIControlEventTouchDragExit];
    
    // 播放按钮
    [self.playBtn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 录音按钮事件
// 按下
- (void)recordBtnDidTouchDown:(UIButton *)recordBtn {
    [self.recordTool startRecording];
}

// 点击
- (void)recordBtnDidTouchUpInside:(UIButton *)recordBtn {
    double currentTime = self.recordTool.recorder.currentTime;
    NSLog(@"%lf", currentTime);
    if (currentTime < 2) {
        [self.recordTool stopRecording];
        self.imageView.image = [UIImage imageNamed:@"mic_0"];
        [self alertWithMessage:@"说话时间太短"];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self.recordTool destructionRecordingFile];
        });
    } else {
        // 已成功录音
        NSLog(@"已成功录音");
       
    }
    [self.recordTool stopRecording];
}

// 手指从按钮上移除
- (void)recordBtnDidTouchDragExit:(UIButton *)recordBtn {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.recordTool stopRecording];
        [self.recordTool destructionRecordingFile];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self alertWithMessage:@"已取消录音"];
            
        });
    });
    
}

#pragma mark - 弹窗提示
- (void)alertWithMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

#pragma mark - 播放录音
- (void)play {
    [self.recordTool playRecordingFile];
}

- (void)dealloc {
    [self.recordTool stopPlaying];
    [self.recordTool stopRecording];
}

#pragma mark - LVRecordToolDelegate
- (void)recordTool:(LVRecordTool *)recordTool didstartRecoring:(int)no {

    NSString *imageName = [NSString stringWithFormat:@"mic_%d", no];
    self.imageView.image = [UIImage imageNamed:imageName];
}

@end
