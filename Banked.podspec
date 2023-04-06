#
#  Be sure to run `pod spec lint Banked.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "Banked"
  spec.version      = "0.0.32"
  spec.summary      = "Banked SDK"
  spec.description  = "Banked iOS checkout"
  spec.homepage     = "https://github.com/banked/banked-iOS.git"
  spec.license      = { :type => "Commercial", :file => "LICENSE" }
  spec.author       = { "Banked" => "hello@banked.com" }
  spec.platform     = :ios
  spec.source       = { :git => "https://github.com/banked/banked-iOS.git", :tag => "#{spec.version}" }
  spec.vendored_frameworks = 'Banked.xcframework'
  spec.swift_version = "5.5"
  spec.ios.deployment_target  = '11.0'

end
