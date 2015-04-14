#
# Be sure to run `pod lib lint SWTiltTransition.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SWTiltTransition"
  s.version          = "1.0.0"
  s.summary          = "Twitter like modal presentation transition."
  # s.description      = <<-DESC
                       # Twitter like modal presentation transition.
                       # DESC
  s.homepage         = "https://github.com/sarunw/SWTiltTransition"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Sarun Wongpatcharapakorn" => "artwork.th@gmail.com" }
  s.source           = { :git => "https://github.com/sarunw/SWTiltTransition.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/sarunw'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SWTiltTransition' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
