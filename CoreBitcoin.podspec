Pod::Spec.new do |s|
  s.name         = "CoreBitcoin"
  s.version      = "0.6.8.1"
  s.summary      = "CoreBitcoin is an implementation of Bitcoin protocol in Objective-C."
  s.description  = <<-DESC
                   CoreBitcoin is a complete toolkit to work with Bitcoin data structures.
                   DESC
  s.homepage     = "https://github.com/oleganza/CoreBitcoin"
  s.license      = 'WTFPL'
  s.author       = { "Oleg Andreev" => "oleganza@gmail.com" }
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.source       = { :git => "https://github.com/oleganza/CoreBitcoin.git", :tag => s.version.to_s }
  s.source_files = 'CoreBitcoin'
  s.exclude_files = ['CoreBitcoin/**/*+Tests.{h,m}', 'CoreBitcoin/BTCScriptTestData.h']
  s.requires_arc = true
  s.framework    = 'Foundation'
  s.ios.framework = 'UIKit'
  s.osx.framework = 'AppKit'
  s.dependency 'OpenSSL-Universal', '1.0.1.16'
  s.dependency 'ISO8601DateFormatter'

  s.static_framework = true
  
  s.pod_target_xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/CoreBitcoin',
    'OTHER_LDFLAGS'          => '$(inherited) -undefined dynamic_lookup'
  }

  s.subspec 'OpenSSL-Universal' do |openssl|
    openssl.source_files = 'CoreBitcoin/openssl/**/*.h'
    openssl.public_header_files = 'CoreBitcoin/openssl/**/*.h'
    openssl.ios.preserve_paths      = 'CoreBitcoin/openssl/libcrypto-ios.a', 'CoreBitcoin/openssl/libssl-ios.a'
    openssl.ios.vendored_libraries  = 'CoreBitcoin/openssl/libcrypto-ios.a', 'CoreBitcoin/openssl/libssl-ios.a'
    openssl.libraries = 'ssl', 'crypto'
    openssl.xcconfig = { 'HEADER_SEARCH_PATHS' => "${PODS_ROOT}/#{s.name}/CoreBitcoin/openssl/**" }
  end

end
