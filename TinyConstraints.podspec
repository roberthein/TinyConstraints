Pod::Spec.new do |s|
  s.name         = "TinyConstraints"
  s.version      = "1.0"
  s.summary      = "Tiny Constraints is syntactic sugar that makes NSLayoutConstraint sweeter for human use."
  s.description  = <<-DESC
    Tiny Constraints is syntactic sugar that makes NSLayoutConstraint sweeter for human use.
  DESC
  s.homepage     = "https://github.com/roberthein/TinyConstraints"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Robert-Hein Hooijmans" => "rh.hooijmans@gmail.com" }
  s.social_media_url   = "https://twitter.com/roberthein"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/roberthein/TinyConstraints", :tag => s.version.to_s }
  s.source_files  = "TinyConstraints/**/*"
  s.frameworks  = "Foundation, UIKit"
end