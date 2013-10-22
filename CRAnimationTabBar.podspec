Pod::Spec.new do |s|

  s.name         = "CRAnimationTabBar"
  s.version      = "0.0.2"
  s.summary      = "A short description of CRAnimationTabBar."

  s.description  = <<-DESC
                   A longer description of CRAnimationTabBar in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "http://EXAMPLE/CRAnimationTabBar"
  # s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"


  s.license      = { :type => 'MIT', :file => 'LICENSE' }


  s.author       = { "Tomoya Igarashi" => "tomoya@couger.co.jp" }


  s.platform     = :ios, '5.1'



  s.source       = { :git => "git@github.com:craquee/CRAnimationTabBar.git", :tag => "0.0.2" }


  s.source_files  = 'CRAnimationTabBar/**/*.{h,m}'
  s.exclude_files = 'CRAnimationTabBar/**/*Tests.{h,m}'



  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  # s.library   = 'iconv'
  # s.libraries = 'iconv', 'xml2'


  s.requires_arc = true

  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.dependency 'JSONKit', '~> 1.4'

end
