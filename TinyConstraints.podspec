Pod::Spec.new do |s|
  s.name         = 'TinyConstraints'
  s.version      = '3.1.0'
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.summary      = 'Nothing but sugar.'
  s.description  = <<-DESC
    Tiny Constraints is the syntactic sugar that makes NSLayoutConstraint sweeter for human use.
  DESC
  s.homepage           = 'https://github.com/roberthein/TinyConstraints'
  s.license            = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { 'Robert-Hein Hooijmans' => 'rh.hooijmans@gmail.com' }
  s.social_media_url   = 'https://twitter.com/roberthein'
  s.source             = { :git => 'https://github.com/roberthein/TinyConstraints.git', :tag => s.version.to_s }
  s.source_files       = 'TinyConstraints/Classes/**/*.{swift}'
end