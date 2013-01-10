#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU

class UserLandingPageMyAccountHooks < Redmine::Hook::ViewListener
  render_on :view_my_account, :partial => 'my/user_landing_page_form', :multipart => true
end