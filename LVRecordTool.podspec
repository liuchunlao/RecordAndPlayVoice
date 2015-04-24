
Pod::Spec.new do |s|

  s.name         = "LVRecordTool"
  s.version      = "1.0"


  s.homepage     = "https://github.com/liuchunlao/RecordAndPlayVoice"

  s.license      = "MIT"

  s.author             = { "liuchunlao" => "liuchunlao@qq.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/liuchunlao/RecordAndPlayVoice.git", :tag => s.version }

  s.source_files  = "RecordAndPlayVoice/RecordAndPlayVoice/Classes/*.{h,m}"

  s.framework  = "AVFoundation.framework"
  s.requires_arc = true

end
