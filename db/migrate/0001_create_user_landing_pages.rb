#-- encoding: UTF-8
# Doodle plugin for Chiliproject
# Copyright (C) 2011-2012  Arnauld NYAKU


class CreateUserLandingPages < ActiveRecord::Migration
  def self.up
    create_table :user_landing_pages do |t|

      t.column :user_id, :integer

      t.column :user_landing_page_setting_id, :integer

      t.column :updated_at, :timestamp

    end
  end

  def self.down
    drop_table :user_landing_pages
  end
end
