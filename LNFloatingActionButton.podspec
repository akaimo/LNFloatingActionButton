Pod::Spec.new do |s|
  s.name         = "LNFloatingActionButton"
  s.version      = "0.1.1"
  s.summary      = "Easy to customize Floating Action Button"
  s.homepage     = "https://github.com/akaimo/LNFloatingActionButton"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "akaimo" => "kawashu0723@gmail.com" }
  s.source       = { :git => "https://github.com/akaimo/LNFloatingActionButton.git", :tag => "#{s.version}" }
  s.platform     = :ios, '8.0'
  s.source_files = 'LNFloatingActionButton/*.{swift,h,m}'
  s.frameworks   = 'UIKit', 'Foundation'
  s.requires_arc = true
end
