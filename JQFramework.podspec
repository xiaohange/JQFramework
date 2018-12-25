Pod::Spec.new do |s|
s.name         = "JQFramework"
s.version      = "1.1.4"
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
Foundation.source_files = 'JQFramework/Foundation/**/*'
#Foundation.public_header_files = 'JQFramework/Foundation/**/*.h'
end

s.subspec 'UIKIt' do |UIKIt|
UIKIt.source_files = 'JQFramework/UIKIt/**/*'
#UIKIt.public_header_files = 'JQFramework/UIKIt/**/*.h'
end

s.subspec 'Utility' do |Utility|
Utility.source_files = 'JQFramework/Utility/**/*'
#Utility.public_header_files = 'JQFramework/Utility/**/*.h'
end

s.subspec 'JQFrameworkHeader' do |JQFrameworkHeader|
JQFrameworkHeader.source_files = 'JQFramework/JQFrameworkHeader/**/*'
#JQFrameworkHeader.public_header_files = 'JQFramework/JQFrameworkHeader/**/*.h'
JQFrameworkHeader.dependency 'JQFrameworkHeader/Foundation'
JQFrameworkHeader.dependency 'JQFrameworkHeader/UIKit'
JQFrameworkHeader.dependency 'JQFrameworkHeader/Utility'
end

end
