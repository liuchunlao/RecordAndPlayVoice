# RecordAndPlayVoice
模仿微信的录音和播放功能，在录音的时候检测音量调整图片，可以实现录音、播放、及删除录音文件功能。<br>

一、使用录音界面 <br>
1.将CustomView和Classes两个文件夹的内容添加到项目 <br>
2.包含录音界面头文件        
     #import "LVRecordView.h"


3.在控制器的viewdidload方法中添加以下代码 <br>
```
self.recordView = [LVRecordView recordView];
self.recordView.backgroundColor = [UIColor lightGrayColor];
CGFloat width = [UIScreen mainScreen].bounds.size.width;
self.recordView.frame = CGRectMake(50, 100, width - 2 * 50, 100);
[self.view addSubview:self.recordView];
```

4.需要需要调整self.recordView的位置即可实现录音功能。 <br>


二、用户自己实现了界面 <br>
1.将classes文件夹导入到项目中 <br>
2.包含录音工具的头文件       
    #import "LVRecordTool.h"

3.包含一个录音工具对象 <br>
/** 录音工具 */
```
@property (nonatomic, strong) LVRecordTool *recordTool;
```
4.在初始化方法中实例化录音工具 <br>
```
recordView.recordTool = [LVRecordTool sharedRecordTool];
```
5.在需要录音的时候添加录音代码 <br>
```
[self.recordTool startRecording];
```
6.停止录音的代码 <br>
```
[self.recordTool stopRecording];
```
7.播放录音的代码 <br>
```
[self.recordTool playRecordingFile];
```
8.销毁录音文件的代码 <br>
```
[self.recordTool destructionRecordingFile];
```
注意：必须在dealloc方法中添加如下代码，防止内存泄露。</br>
```
- (void)dealloc {
    [self.recordTool stopPlaying];
    [self.recordTool stopRecording];
}
```
![](https://github.com/liuchunlao/ImageCache/raw/master/gifResource/recordandplay.gif)
    

