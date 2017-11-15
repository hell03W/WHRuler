#
#  Be sure to run `pod spec lint SweetRuler.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "CZBRule"
  s.version      = "0.0.1"
  s.summary      = "A slide ruler use to select some numbers, support Integer, Double. Write by swift-3.0."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
A slide ruler use to select some numbers, support Integer, Double. Write by swift-3.0. I hope this will give someone convenience.
                   DESC

  s.homepage     = "https://github.com/hell03W/WHRuler"
  # s.screenshots  = "https://camo.githubusercontent.com/f1bdadbc9832848143c6a5b6010f79ef49682234/687474703a2f2f3778763437622e636f6d312e7a302e676c622e636c6f7564646e2e636f6d2f31372d362d392f35333938363435312e6a7067"


  s.license      = "MIT (CZBRule)"

  s.author             = { "weidf" => "weidf@163.com" }
  s.social_media_url   = "https://my.oschina.net/whforever/blog"

  # s.platform     = :ios
   s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/hell03W/WHRuler.git" }


  s.source_files  = 'WHRuler/WHRuler/*.swift'
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
