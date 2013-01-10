#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU


class AddGroupToUserLandingPageSettings < ActiveRecord::Migration
  def self.up
   add_column :user_landing_page_settings, :group_id, :integer    
  end

  def self.down
    remove_column :user_landing_page_settings, :group_id
  end
end
