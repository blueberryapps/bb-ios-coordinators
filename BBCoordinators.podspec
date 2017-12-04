#
# Be sure to run `pod lib lint BBCoordinators.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BBCoordinators'
  s.version          = '0.1.0'
  s.summary          = 'An iOS Coordination framework for MVVM architecture.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
BBCoordinators is an iOS framework, that encapsulates all navigation logic in MVVM architecture into a single element - Coordinator. It automates most of the repetitive work around creating a working navigation flow and makes it easier to maintain.

The idea is based on blog post from Soroush Khanlou http://khanlou.com/2015/10/coordinators-redux/.
                       DESC

  s.homepage         = 'https://github.com/blueberryapps/bb-ios-coordinators'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'David Lenský' => 'david.lensky.77@gmail.com' }
  s.source           = { :git => 'https://github.com/blueberryapps/bb-ios-coordinators.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'BBCoordinators/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BBCoordinators' => ['BBCoordinators/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
