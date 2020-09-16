$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "gns_banners/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "gns_banners"
  spec.version     = GnsBanners::VERSION
  spec.authors     = ["hoangthuan171098"]
  spec.email       = ["hoangthuan171098@gmail.com"]
  spec.homepage    = "https://localhost.com"
  spec.summary     = "This is summary of GnsBanners."
  spec.description = "This is description of GnsBanners."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.3"

  spec.add_development_dependency "pg"

  spec.add_dependency 'devise'
  spec.add_dependency 'unidecoder'
  spec.add_dependency 'roo'
  spec.add_dependency 'rubyzip'
  spec.add_dependency	'cancan'
  spec.add_dependency 'carrierwave'
  spec.add_dependency 'mini_magick'
  spec.add_dependency 'rubyXL'
  spec.add_dependency 'figaro'
  spec.add_dependency 'delayed_job_active_record'
  spec.add_dependency 'sidekiq'
end
