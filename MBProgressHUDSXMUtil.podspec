
Pod::Spec.new do |s|

  s.name         = "MBProgressHUDSXMUtil"
  s.version      = "0.0.2"
  s.summary      = "每次显示提示框时隐藏之前正在显示的提示框."
  s.homepage     = "https://github.com/LarkNan/MBProgressHUDSXMUtil"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "申铭" => "569818710@qq.com" }
  s.social_media_url   = "http://www.jianshu.com/users/0ac50007f001/latest_articles"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/LarkNan/MBProgressHUDSXMUtil.git", :tag => "#{s.version}" }
  s.source_files  = "MBProgressHUDSXMUtil/MBProgressHUDSXMUtil/*.{h,m}"
  s.resources = "MBProgressHUDSXMUtil/MBProgressHUDSXMUtil/MBProgressHUDSXMUtil.bundle"
  s.requires_arc = true

  s.dependency "MBProgressHUD", "~> 0.9"
end