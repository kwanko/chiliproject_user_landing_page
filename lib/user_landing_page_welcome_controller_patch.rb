#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU

module UserLandingPageWelcomeControllerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      unloadable
      alias_method_chain :index, :redirect
    end
  end
  module InstanceMethods
    def index_with_redirect
      index_without_redirect
      redirect_to UserLandingPageSetting.find(User.current.pref.ulp).page_url if User.current.pref.ulp
    end
  end
end

require 'dispatcher'

Dispatcher.to_prepare do
  WelcomeController.send(:include, UserLandingPageWelcomeControllerPatch)
end
