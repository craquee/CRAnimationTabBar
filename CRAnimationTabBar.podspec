Pod::Spec.new do |s|

  s.name         = "CRAnimationTabBar"
  s.version      = "0.0.3"
  s.summary      = "A short description of CRAnimationTabBar."

  s.description  = <<-DESC
                   A longer description of CRAnimationTabBar in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "http://EXAMPLE/CRAnimationTabBar"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "Tomoya Igarashi" => "tomoya@couger.co.jp" }

  s.platform     = :ios, '5.1'

  s.source       = { :git => "git@github.com:craquee/CRAnimationTabBar.git", :tag => "0.0.3" }

  s.source_files  = 'CRAnimationTabBar/**/*.{h,m}'
  s.exclude_files = 'CRAnimationTabBar/**/*Tests.{h,m}'

  s.requires_arc = true
end
