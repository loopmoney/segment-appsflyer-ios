Pod::Spec.new do |s|
  s.name             = "lmsegment-appsflyer-ios"
  s.version          = "6.5.2"
  s.summary          = "AppsFlyer Integration for Segment's analytics-ios library."

  s.description      = <<-DESC
                       AppsFlyer is the market leader in mobile advertising attribution & analytics, helping marketers to pinpoint their targeting, optimize their ad spend and boost their ROI.
                       DESC

  s.homepage         = "https://github.com/loopmoney/segment-appsflyer-ios"
  s.license          =  { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :git => 'https://github.com/loopmoney/segment-appsflyer-ios.git', , :branch => "master", :tag => s.version.to_s }
  

  s.source_files = '**/Classes/**/*'
  s.public_header_files = '**/Classes/**/*.h'
  
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true
  s.static_framework = true

  s.dependency 'Analytics'

  s.default_subspecs = 'Main'
  s.subspec 'Main' do |ss|
    ss.ios.dependency 'AppsFlyerFramework','~> 6.5.2'
    ss.tvos.dependency 'AppsFlyerFramework', '~> 6.5.2'
    ss.source_files = 'segment-appsflyer-ios/Classes/**/*'
  end
  
  s.subspec 'Strict' do |ss|
    ss.ios.dependency 'AppsFlyerFramework/Strict', '~> 6.5.2'
    ss.tvos.dependency 'AppsFlyerFramework/Strict', '~> 6.5.2'
    ss.source_files = 'segment-appsflyer-ios/Classes/**/*'
    end
end 
