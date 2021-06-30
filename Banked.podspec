#
#  Be sure to run `pod spec lint Banked.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "Banked"
  spec.version      = "0.0.16"
  spec.summary      = "Banked SDK"
  spec.description  = "Banked iOS checkout"
  spec.homepage     = "https://github.com/banked/banked-iOS.git"
  spec.license      = { :type => "Commercial", :file => "LICENSE" }
  spec.author       = { "Banked" => "hello@banked.com" }
  spec.platform     = :ios
  spec.source       = { :git => "https://github.com/banked/banked-iOS.git", :tag => "#{spec.version}" }
  spec.public_header_files = "Banked.framework/Headers/*.h"
  spec.source_files  = "Banked.framework/Headers/*.{h}"
  spec.vendored_frameworks = 'Banked.framework'
  spec.swift_version = "5.3"
  spec.ios.deployment_target  = '11.0'
  spec.dependency 'Sentry'
  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
