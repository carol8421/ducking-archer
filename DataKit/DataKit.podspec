Pod::Spec.new do |s|
  s.name             = "DataKit"
  s.version          = "0.0.1"
  s.summary          = "Shared lib"
  s.homepage         = "https://github.com/darrenclark/ducking-archer"
  s.license          = 'MIT'
  s.author           = { "Darren Clark" => "darrenjoelclark@icloud.com" }
  s.source           = { :git => "https://github.com/darrenclark/ducking-archer", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/darrenclark'
  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Classes/*.{h,m}'
  s.dependency 'AFNetworking'
end
