#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU

module UserLandingPageSettingsHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, SettingsHelperMethodsUserLandingPageSettings)

    base.class_eval do
      unloadable # Send unloadable so it will not be unloaded in development
      alias_method_chain :administration_settings_tabs, :user_landing_page_settings
    end

  end
end

module SettingsHelperMethodsUserLandingPageSettings
  def administration_settings_tabs_with_user_landing_page_settings
    tabs = administration_settings_tabs_without_user_landing_page_settings
    tabs << {:name => 'user_landing_pages', :partial => 'user_landing_page_settings/index', :label => :label_user_landing_pages}
    tabs
  end
end

SettingsHelper.send(:include, UserLandingPageSettingsHelperPatch)