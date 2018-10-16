#
# Be sure to run `pod lib lint kroutled2018.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'kroutled2018'
  s.version          = '0.1.0'
  s.summary          = 'kroutled2018 is a pod created as per the day 08 of the WeThinkCode_ iOS bootcamp'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Here is a longer description about this project which is apparently about building a system to save articles into a database?
                       DESC

  s.homepage         = 'https://github.com/kroutled/kroutled2018'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kroutled' => 'kroutled@student.wethinkcode.co.za' }
  s.source           = { :git => 'https://github.com/kroutled/kroutled2018.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'kroutled2018/Classes/**/*'
  
  # s.resource_bundles = {
  #   'kroutled2018' => ['kroutled2018/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
