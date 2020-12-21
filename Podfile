target 'Electrolux' do
  
  use_frameworks!

  pod 'SwiftLint', '~> 0.41.0'
  pod 'Kingfisher', '~> 5.15.8'
  pod "SwiftyXMLParser", '~> 5.0.0'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end

end
