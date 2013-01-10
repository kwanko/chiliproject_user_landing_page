#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU

class UserLandingPageSettingsHooks < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context = {})
        css = stylesheet_link_tag 'user_landing_page', :plugin => 'chiliproject_user_landing_page'
        js = javascript_include_tag 'user_landing_page', :plugin => 'chiliproject_user_landing_page'
        css + js
    end
end
