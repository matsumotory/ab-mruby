MRuby::Build.new do |conf|

  toolchain :gcc

  conf.gembox 'full-core'
  conf.gem :github => 'matsumoto-r/mruby-config', :branch => 'master'
  conf.gem '../mrbgems/mruby-ab-mruby-ext'
end

