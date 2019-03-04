Pod::Spec.new do |s|
    s.name             = 'objective_c_core_helpers'
    s.version          = '0.0.1'
    s.summary          = 'A core helpers for objective_c'
    
    s.description      = <<-DESC
This pod file contains objective_c core helpers, That's you use in your every project. You import helper files sepratally in your project ,Now don't need to import helpers files in your project just add pod into the podfile and done.
        DESC
        
    s.homepage         = 'https://github.com/EmptyOps/objective_c_core_helpers'
    
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'EmptyOps' => 'hsquaretechnology@gmail.com' }
    s.source           = { :git => 'https://github.com/EmptyOps/objective_c_core_helpers.git', :tag => s.version.to_s }
        
    s.platform = :ios, '7.0'
    s.requires_arc = true
        
    s.dependency 'RestKit', '~> 0.20'
        
    s.source_files = 'objective_c_core_helpers/Classes/**/*'
    
end

