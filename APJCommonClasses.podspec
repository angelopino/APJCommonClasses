Pod::Spec.new do |s|
  s.name             = 'APJCommonClasses'
  s.version          = '0.0.1'
  s.summary          = 'APJCommonClasses contains common classes for code reuse'
  s.description      = <<-DESC
APJCommonClasses contains a group of common classes used almost always during the development of various projects.
                       DESC

  s.homepage         = 'https://github.com/angelopino/APJCommonClasses'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Angelo Pino' => 'pino.angelo@gmail.com' }
  s.source           = { :git => 'https://github.com/angelopino/APJCommonClasses.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.source_files = 'APJCommonClasses/Classes/**/*'
end