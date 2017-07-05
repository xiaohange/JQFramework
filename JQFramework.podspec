Pod::Spec.new do |s|
s.name         = "JQFramework"
s.version      = "1.0.0"
s.summary      = "Effectively improve development efficiency, a number of networks, extensions, classification, UIKit under the package library."
s.homepage     = "https://github.com/xiaohange/JQFramework"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "韩俊强" => "532167805@qq.com" }
s.platform     = :ios, "7.0"
s.ios.deployment_target = "7.0"
s.source       = { :git => "https://github.com/xiaohange/JQFramework.git", :tag => s.version.to_s }
s.source_files  = "JQFramework/**/*.{h,m}"
s.public_header_files = "JQFramework/**/*.h"
s.dependency   "AFNetworking"
s.dependency   "SDWebImage"
s.dependency   "EGOCache"
s.requires_arc = true
end
