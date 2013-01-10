#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU

class UserPreference < ActiveRecord::Base
  has_one :user_landing_page, :dependent => :destroy, :class_name => 'UserLandingPage'

  def ulp
    user_landing_page = UserLandingPage.find_by_user_id(user.id)
    return nil unless user_landing_page
    user_landing_page.user_landing_page_setting_id
  end

  def ulp=(user_landing_page_setting_id)
    user_landing_page = UserLandingPage.find_or_create_by_user_id(user.id)
    user_landing_page.user_landing_page_setting_id = user_landing_page_setting_id
    user_landing_page.save!
  end
end
