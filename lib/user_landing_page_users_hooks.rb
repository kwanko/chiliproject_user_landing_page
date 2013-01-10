#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU

class UserLandingPagesUsersHooks < Redmine::Hook::ViewListener
  render_on :view_account_left_bottom, :partial => 'users/show_user_landing_page', :multipart => true
end

