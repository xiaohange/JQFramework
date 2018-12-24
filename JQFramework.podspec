Pod::Spec.new do |s|
s.name         = "JQFramework"
s.version      = "1.1.3"
s.summary      = "Effectively improve development efficiency, a number of networks, extensions, classification, UIKit under the package library."
s.homepage     = "https://github.com/xiaohange/JQFramework"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "Hari" => "532167805@qq.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"
s.source       = { :git => "https://github.com/xiaohange/JQFramework.git", :tag => s.version.to_s }
s.social_media_url = 'https://weibo.com/hjq995'
s.requires_arc = true

s.subspec 'Foundation' do |Foundation|
Foundation.source_files = 'JQFramework/Foundation/**/*.{h,m}'
Foundation.public_header_files = 'JQFramework/Foundation/**/*.h'
Foundation.frameworks = 'UIKit', 'Foundation', 'AVFoundation'
end

s.subspec 'UIKIt' do |UIKIt|
UIKIt.source_files = 'JQFramework/UIKIt/**/*.{h,m}'
UIKIt.public_header_files = 'JQFramework/UIKIt/**/*.h'
UIKIt.frameworks = 'UIKit', 'Foundation', 'AVFoundation'
end

s.subspec 'Utility' do |Utility|
Utility.source_files = 'JQFramework/Utility/**/*.{h,m}'
Utility.public_header_files = 'JQFramework/Utility/**/*.h'
Utility.frameworks = 'UIKit', 'Foundation', 'AVFoundation'
end

s.subspec 'JQFrameworkHeader' do |JQFrameworkHeader|
JQFrameworkHeader.source_files = 'JQFramework/JQFrameworkHeader/**/*.{h,m}'
JQFrameworkHeader.public_header_files = 'JQFramework/JQFrameworkHeader/**/*.h'
JQFrameworkHeader.frameworks = 'UIKit', 'Foundation', 'AVFoundation'
JQFrameworkHeader.dependency 'JQFrameworkHeader/Foundation'
JQFrameworkHeader.dependency 'JQFrameworkHeader/UIKit'
JQFrameworkHeader.dependency 'JQFrameworkHeader/Utility'
end

end
