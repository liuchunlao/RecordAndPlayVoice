Pod::Spec.new do |s|
s.name         = "LVRecordTool"
s.version      = "1.0"
s.summary      = "The easiest way to use record and play"
s.homepage     = "https://github.com/liuchunlao/RecordAndPlayVoice"
s.license      = "MIT"
s.authors      = { 'liuchunlao' => 'liuchunlao@qq.com'}
s.platform     = :ios, "6.0"
s.source       = { :git => "https://github.com/liuchunlao/RecordAndPlayVoice.git", :tag => s.version }
s.source_files = "RecordAndPlayVoice/RecordAndPlayVoice/Classes/*.{h,m}"
s.requires_arc = true
end
