#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU

require 'redmine'

# require all files in lib
Dir::foreach(File.join(File.dirname(__FILE__), 'lib')) do |file|
  next unless /\.rb$/ =~ file
  require file
end

Redmine::Plugin.register :chiliproject_user_landing_page do
  name 'Chiliproject User landing page plugin'
  author 'Arnauld NYAKU'
  description 'This is a plugin for Chiliproject lets each user to choose a landing page.'
  version '0.0.1'
  url ''
  author_url 'mailto:arnauld.nyaku@c2bsa.com'  
end
