
Pod::Spec.new do |s|
  s.name         = "RNToastMessage"
  s.version      = "1.0.0"
  s.summary      = "RNToastMessage"
  s.description  = <<-DESC
                  RNToastMessage
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNToastMessage.git", :tag => "master" }
  s.source_files  = "RNToastMessage/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  