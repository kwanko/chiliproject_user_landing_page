#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU


class UserLandingPage < ActiveRecord::Base
  belongs_to :users
  belongs_to :users_landing_page_settings
  unloadable
  validates_presence_of :user_id

  def self.find_or_create_by_user_id(user_id)
    user_landing_page = UserLandingPage.find(:first, :conditions => ["user_id = ?", user_id])
    unless user_landing_page
      user_landing_page = UserLandingPage.new
      user_landing_page.user_id = user_id
    end
    user_landing_page
  end
end
