require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-toast-message"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
  React Native Toast Message is a customizable and easy-to-use library for displaying toast notifications in React Native applications. It provides a simple interface for showing short-lived messages to users, making it perfect for alerts, notifications, or feedback.

  GitHub Repository: https://github.com/calintamas/react-native-toast-message
DESC
  s.homepage     = "https://github.com/seyedmostafahasani/react-native-toast-message"
  s.license      = package["license"]
  s.author       = { "author" => package["author"]["email"] }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/seyedmostafahasani/react-native-toast-message.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m}"
  s.requires_arc = true

  if respond_to?(:install_modules_dependencies, true)
    install_modules_dependencies(s)
  else
  s.dependency "React-Core"

  # Don't install the dependencies when we run `pod install` in the old architecture.
  if ENV['RCT_NEW_ARCH_ENABLED'] == '1' then
    s.compiler_flags = folly_compiler_flags + " -DRCT_NEW_ARCH_ENABLED=1"
    s.pod_target_xcconfig    = {
        "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost\"",
        "OTHER_CPLUSPLUSFLAGS" => "-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1",
        "CLANG_CXX_LANGUAGE_STANDARD" => "c++17"
    }
    s.dependency "React-Codegen"
    s.dependency "RCT-Folly"
    s.dependency "RCTRequired"
    s.dependency "RCTTypeSafety"
    s.dependency "ReactCommon/turbomodule/core"
   end
  end
end
