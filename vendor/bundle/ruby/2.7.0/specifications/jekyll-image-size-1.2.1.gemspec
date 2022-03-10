# -*- encoding: utf-8 -*-
# stub: jekyll-image-size 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-image-size".freeze
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Shane Brinkman-Davis Delamore".freeze]
  s.date = "2019-08-01"
  s.description = "Jekyll tag-plugin to read image sizes from static assets and output in many formats.\n\nGenerate your opengraph link-tags, img-tags, css, html props, or just output the width and height of an image. All output image-sizes\ncan be scaled for retina support (/2 for @2x retina, /3 for @3x, etc...).\n".freeze
  s.email = ["shane@genui.com".freeze]
  s.homepage = "https://github.com/generalui/jekyll-image-size".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.5".freeze
  s.summary = "Jekyll tag-plugin to read images and output image-sizes as: opengraph tags, img-tags, css and more - with retina support".freeze

  s.installed_by_version = "3.3.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<jekyll>.freeze, [">= 3.7"])
    s.add_runtime_dependency(%q<fastimage>.freeze, [">= 1.8"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  else
    s.add_dependency(%q<jekyll>.freeze, [">= 3.7"])
    s.add_dependency(%q<fastimage>.freeze, [">= 1.8"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
