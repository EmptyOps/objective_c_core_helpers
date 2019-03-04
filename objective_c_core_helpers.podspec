Pod::Spec.new do |s|
    s.name             = 'objective_c_core_helpers'
    s.version          = '0.0.1'
    s.summary          = 'A core helpers for objective_c'
    
    s.description      = <<-DESC
    This pod file contains objective_c core helpers, That is you use in your every project. You can import helper files sepratally in your project ,Now do not need to import helpers files anytime in your project because comming pods into the server.
        DESC
        
        s.homepage         = 'https://github.com/EmptyOps/objective_c_core_helpers'
        
        s.license          = { :type => 'MIT', :file => 'LICENSE' }
        s.author           = { 'EmptyOps' => 'hsquaretechnology@gmail.com' }
        s.source           = { :git => 'https://github.com/EmptyOps/objective_c_core_helpers.git', :tag => s.version.to_s }
        
        s.ios.deployment_target = '8.0'
        s.platform = :ios, '7.0'
        s.requires_arc = true
        
        # s.dependency 'RestKit', '~> 0.26'
        
        s.source_files = 'objective_c_core_helpers/Classes/**/*'
        
        # s.resource_bundles = {
        #   'objective_c_core_helpers' => ['objective_c_core_helpers/Assets/*.png']
        # }
        
        # s.public_header_files = 'Pod/Classes/**/*.h'
        # s.frameworks = 'UIKit', 'MapKit'
        # s.dependency 'AFNetworking', '~> 2.3'
    end

