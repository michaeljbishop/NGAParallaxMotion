Pod::Spec.new do |s|
  s.name         =  'NGAParallaxMotion'
  s.version      =  '1.1.0'
  s.license      =  { :type => 'MIT', :file => 'LICENSE' }
  s.summary      =  'UIView category that makes it trivial to add a parallax effect.'
  s.author       =  { 'Michael Bishop' => 'http://numerical-garden.com/' }
  s.source       =  { :git => 'https://github.com/michaeljbishop/NGAParallaxMotion.git', :tag => '1.1.0' }
  s.homepage     =  'http://github.com/michaeljbishop/NGAParallaxMotion'
  s.platform     =  :ios
  s.framework    = 'UIKit'
  s.source_files = 'Classes'
  s.requires_arc =  true
end
