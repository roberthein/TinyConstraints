Pod::Spec.new do |s|
  s.name         = "TinyConstraints"
  s.version      = '1.0.0'
  s.platform     = :ios, '10.0'
  s.ios.deployment_target = "9.0"
  s.license      = 'Copyright, 2017, Robert-Hein Hooijmans'
  s.summary      = "Syntactic sugar that makes NSLayoutConstraint sweeter for human use."
  s.description  = <<-DESC
    Tiny Constraints is some syntactic sugar that makes NSLayoutConstraint sweeter for human use.
  DESC
  s.homepage     = "https://github.com/roberthein/TinyConstraints"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Robert-Hein Hooijmans" => "rh.hooijmans@gmail.com" }
  s.social_media_url   = "https://twitter.com/roberthein"
  s.source       = { :git => "https://github.com/roberthein/TinyConstraints.git", :tag => s.version.to_s }
  s.source_files  = "TinyConstraints/"
  s.frameworks  = "Foundation, UIKit"
end