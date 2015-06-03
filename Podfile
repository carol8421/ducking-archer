platform :ios, '8.0'
use_frameworks!
inhibit_all_warnings!

source 'https://github.com/CocoaPods/Specs.git'

target 'ducking-archer' do
	pod 'AFNetworking'
end

target 'DataKit' do
	pod 'AFNetworking'
end


post_install do |installer|
	installer.project.targets.each do |target|
		if target.name.include?('DataKit')
			target.build_configurations.each do |config|

				# Add AF_APP_EXTENSIONS macro so AFNetworking builds without using app extension safe APIs
				config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'AF_APP_EXTENSIONS=1']

				# Only allow app extension safe APIs - fixed dylib linker warnings
				config.build_settings['APPLICATION_EXTENSION_API_ONLY'] ||= "YES"

			end
		end
	end
end

