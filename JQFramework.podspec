Pod::Spec.new do |s|
s.name         = "JQFramework"
s.version      = "1.2.2"
s.summary      = "Effectively improve development efficiency, a number of networks, extensions, classification, UIKit under the package library."
s.homepage     = "https://github.com/xiaohange/JQFramework"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "Hari" => "532167805@qq.com" }
s.platform     = :ios, "8.0"
s.ios.deployment_target = "8.0"
s.source       = { :git => "https://github.com/xiaohange/JQFramework.git", :tag => s.version.to_s }
s.social_media_url = 'https://weibo.com/hjq995'
s.requires_arc = true
s.source_files = 'JQFramework/JQFramework.h'
#存放引用的资源,如图片,plist文件等
#s.resources = 'JQFramework/**/*'

s.subspec 'JQFoundation' do |fd|
fd.source_files = 'JQFramework/JQFoundation/**/*'
#fd.public_header_files = 'JQFramework/JQFoundation/**/*.h'
end

s.subspec 'JQUIKIt' do |uk|
uk.source_files = 'JQFramework/JQUIKIt/**/*'
#uk.public_header_files = 'JQFramework/JQUIKIt/**/*.h'
end

s.subspec 'JQUtility' do |ut|
ut.source_files = 'JQFramework/JQUtility/**/*'
#ut.public_header_files = 'JQFramework/JQUtility/**/*.h'
end

s.subspec 'CTMBase64' do |ct|
ct.source_files = 'JQFramework/CTMBase64/**/*'
ct.requires_arc = false
end

s.subspec 'FDFullscreenPopGesture' do |fd|
fd.source_files = 'JQFramework/FDFullscreenPopGesture/**/*'
end

end
