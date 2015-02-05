#
# Be sure to run `pod lib lint TTPLAPIManager.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "TTPLAPIManager"
  s.version          = "0.1.0"
  s.summary          = "TTPL API manager."
  s.description      = "TTPL API Manager is using the AFNetworking to make api request. This Manager will handle all the API request and send back the succuess or failure response to the respective classes. APIKey.h file contains all the API related configurations."

  s.homepage         = "https://github.com/iosttpl/TTPLAPIManager"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Subramanian" => "mailmemani@ymail.com" }
  s.source           = { :git => "https://github.com/iosttpl/TTPLAPIManager.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*'
  s.resource_bundles = {
    'TTPLAPIManager' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 2.4'
  s.dependency 'XMLDictionary', '~> 1.4'

end
