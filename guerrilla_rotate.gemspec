# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{guerrilla_rotate}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason King"]
  s.date = %q{2010-02-16}
  s.email = %q{jk@handle.it}
  s.extra_rdoc_files = %w{README.markdown LICENSE}
  s.files = s.extra_rdoc_files + %w{lib/guerrilla_rotate.rb}
  s.has_rdoc = true
  s.homepage = %q{http://github.com/JasonKing/guerrilla_rotate}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = "A/B Testing made simple"
  s.description = File.read('README.markdown')

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
